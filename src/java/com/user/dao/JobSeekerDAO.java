package com.user.dao;

import com.user.model.Job;
import com.user.model.JobSeekers;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class JobSeekerDAO {
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    // Method to retrieve all job seekers from the database
    public static List<JobSeekers> getAllJobSeekers() {
        List<JobSeekers> jobSeekers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver and establish a connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query to retrieve all job seekers
            String sql = "SELECT * FROM jobseeker";
            pstmt = conn.prepareStatement(sql);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                int jobseekerID = rs.getInt("jobseekerID");
                String skills = rs.getString("skills");
                String education = rs.getString("education");
                String experience = rs.getString("experience");

                // Create a JobSeeker object and add it to the list
                JobSeekers jobSeeker = new JobSeekers(jobseekerID, skills, education, experience);
                jobSeekers.add(jobSeeker);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return jobSeekers;
    }
    
    public boolean addJobSeeker(JobSeekers jobSeek) {
    String sql = "INSERT INTO jobseeker (skills, experience, education) VALUES (?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1, jobSeek.getSkills());
        pstmt.setString(2, jobSeek.getExperience());
        pstmt.setString(3, jobSeek.getEducation());

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
    e.printStackTrace();
    System.out.println("SQL Error: " + e.getMessage());
    return false;
}
    }
    
    // Method to delete a job posting
    public boolean deleteJobSeeker(int jobSeekerID) {
    String sql = "DELETE FROM jobseeker WHERE jobSeekerID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setInt(1, jobSeekerID);
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
    }
    
    public boolean updateJobSeeker(JobSeekers jobSeek) {
    String sql = "UPDATE jobseeker SET skills = ?, experience = ?, education = ? WHERE jobSeekerID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1, jobSeek.getSkills());
        pstmt.setString(2, jobSeek.getExperience());
        pstmt.setString(3, jobSeek.getEducation());
        pstmt.setInt(4, jobSeek.getJobSeekerID());
        
        System.out.println("Executing query: " + pstmt.toString());
        
        int rowsAffected = pstmt.executeUpdate();
        System.out.println("Rows affected: " + rowsAffected);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    
    /* Method to update jobseeker profile
    public boolean updateJobseekerProfile(int userID, String skills, String experience, String education) {
        String sql = "UPDATE jobseeker SET skills = ?, experience = ?, education = ? WHERE userID = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, skills);
            pstmt.setString(2, experience);
            pstmt.setString(3, education);
            pstmt.setInt(4, userID);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }*/
    
    // Method to retrieve a job seeker by ID from the database
    public static JobSeekers getJobSeekerById(int jobseekerID) {
        JobSeekers jobSeeker = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query to retrieve a job seeker by ID
            String sql = "SELECT * FROM jobseeker WHERE jobseekerID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, jobseekerID);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            if (rs.next()) {
                String skills = rs.getString("skills");
                String education = rs.getString("education");
                String experience = rs.getString("experience");

                // Create a JobSeeker object
                jobSeeker = new JobSeekers(jobseekerID, skills, education, experience);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return jobSeeker;
    }
}