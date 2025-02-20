package com.user.controller;

import com.user.dao.JobSeekerDAO;
import com.user.dao.JobDAO;
import com.user.model.Job;
import com.user.model.JobSeekers;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ManageJobSeeker", urlPatterns = {"/ManageJobSeeker"})
public class ManageJobSeeker extends HttpServlet {
    
    private JobDAO jobDAO = new JobDAO();
    private JobSeekerDAO jobSeekDAO = new JobSeekerDAO();
    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway"; // Update with your database URL
    private static final String DB_USER = "app"; // Update with your database username
    private static final String DB_PASSWORD = "app"; // Update with your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action2 = request.getParameter("action2");
        
        try {
            int jobSeekerID = Integer.parseInt(request.getParameter("jobSeekerId"));
        switch (action2) {
            case "delete":
                jobSeekDAO.deleteJobSeeker(jobSeekerID);
                break;
            case "update":
                String skills = request.getParameter("skills");
                String experience = request.getParameter("experience");
                String education = request.getParameter("education");
                
                JobSeekers jobSeek = new JobSeekers(jobSeekerID, skills, experience, education);
                jobSeekDAO.updateJobSeeker(jobSeek);
                break;
            default:
                System.out.println("Invalid action: " + action2);
                break;
        }
        } catch (NumberFormatException e) {
            System.out.println("Invalid Job Seeker Id or Salary format!");
            e.printStackTrace();
        }
        
    response.sendRedirect("admin.jsp");
}
}
