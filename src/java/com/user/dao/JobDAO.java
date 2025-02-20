package com.user.dao;

import com.user.model.Job;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.DBConnection;

public class JobDAO {
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    public boolean addJob(Job job) {
    String sql = "INSERT INTO job (title, description, salary, location, postedDate, deadLine, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1, job.getTitle());
        pstmt.setString(2, job.getDescription());
        pstmt.setDouble(3, job.getSalary());
        pstmt.setString(4, job.getLocation());
        pstmt.setDate(5, new java.sql.Date(job.getPostedDate().getTime()));
        pstmt.setDate(6, new java.sql.Date(job.getDeadLine().getTime()));
        pstmt.setString(7, job.getStatus());

        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
    e.printStackTrace();
    System.out.println("SQL Error: " + e.getMessage());
    return false;
}

    
}

    // Method to retrieve all job postings
    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT * FROM job";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Job job = new Job();
                job.setJobID(rs.getInt("jobID"));
                job.setTitle(rs.getString("title"));
                job.setDescription(rs.getString("description"));
                job.setSalary(rs.getDouble("salary"));
                job.setLocation(rs.getString("location"));
                job.setPostedDate(rs.getDate("postedDate"));
                job.setDeadLine(rs.getDate("deadLine"));
                
                // Debug: Print the status value from the database
                String status = rs.getString("status");
                System.out.println("Status from DB: " + status);
                
                job.setStatus(rs.getString("status"));
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }

    // Method to retrieve a job posting by ID
    public Job getJobById(int jobID) {
        String sql = "SELECT * FROM job WHERE jobID = ?";
        Job job = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, jobID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    job = new Job();
                    job.setJobID(rs.getInt("jobID"));
                    job.setTitle(rs.getString("title"));
                    job.setDescription(rs.getString("description"));
                    job.setSalary(rs.getDouble("salary"));
                    job.setLocation(rs.getString("location"));
                    job.setPostedDate(rs.getDate("postedDate"));
                    job.setDeadLine(rs.getDate("deadline"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }

    // Method to update a job posting
    public boolean updateJob(Job job) {
    String sql = "UPDATE job SET title = ?, description = ?, salary = ?, location = ?, postedDate = ?, deadLine = ? WHERE jobID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setString(1, job.getTitle());
        pstmt.setString(2, job.getDescription());
        pstmt.setDouble(3, job.getSalary());
        pstmt.setString(4, job.getLocation());
        pstmt.setDate(5, new java.sql.Date(job.getPostedDate().getTime()));
        pstmt.setDate(6, new java.sql.Date(job.getDeadLine().getTime()));
        pstmt.setInt(7, job.getJobID());
        
        System.out.println("Executing query: " + pstmt.toString());
        
        int rowsAffected = pstmt.executeUpdate();
        System.out.println("Rows affected: " + rowsAffected);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

    public void approveJob(int jobID) {
        String sql = "Update job set status='approved' where jobID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, jobID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void rejectJob(int jobID) {
        String sql="delete from job where jobID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, jobID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Method to delete a job posting
    public boolean deleteJob(int jobID) {
    String sql = "DELETE FROM job WHERE jobID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

        pstmt.setInt(1, jobID);
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public List<Job> searchJobs(String title, String location, String description) {
        List<Job> jobList = new ArrayList<>();
        String sql = "SELECT * FROM job WHERE title LIKE ? AND location LIKE ? AND description LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, "%" + title + "%");
            stmt.setString(2, "%" + location + "%");
            stmt.setString(3, "%" + description + "%");
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Job job = new Job();
                job.setJobID(rs.getInt("id"));
                job.setTitle(rs.getString("title"));
                job.setDescription(rs.getString("description"));
                job.setSalary(rs.getDouble("salary"));
                job.setLocation(rs.getString("location"));
                job.setPostedDate(rs.getDate("posted_date"));
                job.setDeadLine(rs.getDate("deadLine"));
                
                jobList.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return jobList;
    }
}