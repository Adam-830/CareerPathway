package com.user.dao;

import com.user.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    public User validateUser(String username, String password) {
        String sql = "select username, password from users where username = ? and password = ?";
        User user = new User();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("password"));
                    user.setPassword("password");
                    user.setRole(rs.getString("roles"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
             return user;   
                
    }
    
    // Method to check already existing username
    public boolean isUsernameTaken(String username) {
        String sql = "SELECT username FROM users WHERE username = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            boolean exists = rs.next();
            System.out.println("Checking username: " + username + " exists? " + exists);
            return exists;
            /*try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("roles"));
                }*/
                  
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error checking username: " + e.getMessage());
        }
        return false;
    }

    // Method to register a new user and insert into both `users` and `jobseeker` tables
    public boolean registerUser(User user) {
        Connection conn = null;
        PreparedStatement pstmtUser = null;
        PreparedStatement pstmtJobseeker = null;
        ResultSet generatedKeys = null;
        
        if (isUsernameTaken(user.getUsername())) {
            System.out.println("Registration failed: Username already exists.");
            return false;
        }
        
        try {
            // Load the JDBC driver and establish a connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false); // Start transaction

            // Insert into the `users` table
            String sqlUser = "INSERT INTO users (username, email, password, roles) VALUES (?, ?, ?, ?)";
            pstmtUser = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            pstmtUser.setString(1, user.getUsername());
            pstmtUser.setString(2, user.getEmail());
            pstmtUser.setString(3, user.getPassword());
            pstmtUser.setString(4, user.getRole()); // Default role is "jobseeker"
            int rowsAffectedUser = pstmtUser.executeUpdate();

            // Retrieve the generated `userID`
            generatedKeys = pstmtUser.getGeneratedKeys();
            int userID = -1;
            if (generatedKeys.next()) {
                userID = generatedKeys.getInt(1); // Get the auto-generated userID
            }

            // Insert into the `jobseeker` table
            if (userID != -1) {
                String sqlJobseeker = "INSERT INTO jobseeker (userID, skills, experience, education) VALUES (?, ?, ?, ?)";
                pstmtJobseeker = conn.prepareStatement(sqlJobseeker);
                pstmtJobseeker.setInt(1, userID); // Set the foreign key `userID`
                pstmtJobseeker.setString(2, ""); // Default empty skills
                pstmtJobseeker.setString(3, ""); // Default empty experience
                pstmtJobseeker.setString(4, ""); // Default empty education
                int rowsAffectedJobseeker = pstmtJobseeker.executeUpdate();

                // Commit transaction if both inserts are successful
                if (rowsAffectedUser > 0 && rowsAffectedJobseeker > 0) {
                    conn.commit();
                    return true;
                } else {
                    conn.rollback(); // Rollback if any insert fails
                    return false;
                }
            } else {
                conn.rollback(); // Rollback if userID is not generated
                return false;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback on error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            // Close resources
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (pstmtUser != null) pstmtUser.close();
                if (pstmtJobseeker != null) pstmtJobseeker.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}