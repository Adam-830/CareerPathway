package com.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JobSeekerDAO {
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    // Method to update jobseeker profile
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
    }
}