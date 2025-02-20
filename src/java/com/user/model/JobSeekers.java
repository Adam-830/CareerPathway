package com.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobSeekers implements java.io.Serializable{
    // Attributes
    private int jobseekerID;
    private String skills;
    private String education;
    private String experience;

    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway"; // Update with your database URL
    private static final String DB_USER = "app"; // Update with your database username
    private static final String DB_PASSWORD = "app"; // Update with your database password

    // Parameterized Constructor
    public JobSeekers(int jobseekerID, String skills, String education, String experience) {
        this.jobseekerID = jobseekerID;
        this.skills = skills;
        this.education = education;
        this.experience = experience;
    }

    // Default Constructor
    public JobSeekers() {
        jobseekerID = 0;
        skills = "";
        education = "";
        experience = "";
    }

    // Getters and Setters
    public int getJobSeekerID() {
        return jobseekerID;
    }

    public void setJobSeekerID(int jobseekerID) {
        this.jobseekerID = jobseekerID;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    // toString Method
    @Override
    public String toString() {
        return "JobSeeker{" +
                "jobseekerID=" + jobseekerID +
                ", skills='" + skills + '\'' +
                ", education='" + education + '\'' +
                ", experience='" + experience + '\'' +
                '}';
    }

    // Method to retrieve all job seekers from the database
    public static List<JobSeekers> getAllJobSeekers() {
        List<JobSeekers> jobSeekers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
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