package com.user.controller;

import com.user.dao.JobDAO;
import com.user.model.Job;
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
        int jobID = Integer.parseInt(request.getParameter("jobId"));
        
    if ("delete".equals(action)) {
            jobDAO.deleteJob(jobID);
        } else if ("update".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String location = request.getParameter("location");
            Date postedDate = new Date();
            Date deadline = new Date();

            Job job = new Job(jobID, title, description, salary, location, postedDate, deadline);
            job.setSalary(salary);
            job.setPostedDate(postedDate);
            job.setDeadline(deadline);

            jobDAO.updateJob(job);
        }

        response.sendRedirect("admin.jsp");
    }

}
