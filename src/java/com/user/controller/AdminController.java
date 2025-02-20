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

@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {
    
    private JobDAO jobDAO = new JobDAO();
    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway"; // Update with your database URL
    private static final String DB_USER = "app"; // Update with your database username
    private static final String DB_PASSWORD = "app"; // Update with your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String action2 = request.getParameter("action2");
        String jobIdParam = request.getParameter("jobId");
        
        
        // Debug: Print action and jobId
        System.out.println("Action: " + action);
        System.out.println("Job ID: " + jobIdParam);
       
        if (jobIdParam == null || jobIdParam.isEmpty()) {
        System.out.println("Job ID is null or empty!");
        response.sendRedirect("admin.jsp");
        return;
        }
        
        
        try {
            int jobID = Integer.parseInt(jobIdParam);
        switch (action) {
            case "approve":
                jobDAO.approveJob(jobID);
                break;
            case "reject":
                jobDAO.rejectJob(jobID);
                break;
            case "delete":
                jobDAO.deleteJob(jobID);
                break;
            case "update":
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String salaryParam = request.getParameter("salary");
                double salary = Double.parseDouble(request.getParameter("salary"));
                String location = request.getParameter("location");
                Date postedDate = new Date();
                Date deadLine = new Date();
                
                // Debug: Print other parameters
                System.out.println("Title: " + title);
                System.out.println("Description: " + description);
                System.out.println("Salary: " + salaryParam);
                System.out.println("Location: " + location);
                System.out.println("posted: " + postedDate);
                System.out.println("deadline: " + deadLine);

                if (title == null || description == null || salaryParam == null || location == null || postedDate == null || deadLine == null) {
                    System.out.println("One or more parameters are null!");
                    response.sendRedirect("admin.jsp");
                    return;
                }

                
                Job job = new Job(jobID, title, description, salary, location, postedDate, deadLine, "pending");
     
                jobDAO.updateJob(job);
                break;
            default:
                System.out.println("Invalid action: " + action);
                break;
        }
        } catch (NumberFormatException e) {
            System.out.println("Invalid Job Id or Salary format!");
            e.printStackTrace();
        }
        
        
}
}
