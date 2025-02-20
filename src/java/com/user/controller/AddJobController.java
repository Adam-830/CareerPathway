package com.user.controller;

import com.user.dao.JobDAO;
import com.user.model.Job;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddJobController", urlPatterns = {"/AddJobController"})
public class AddJobController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String postedDateStr = request.getParameter("postedDate");
        String deadLineStr = request.getParameter("deadLine");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String location = request.getParameter("location");
        Timestamp postedDate = Timestamp.valueOf(postedDateStr.replace("T", " ") + ":00");
        Timestamp deadLine = Timestamp.valueOf(deadLineStr.replace("T", " ") + ":00");

        // Create a Job object
        Job job = new Job();
        job.setTitle(title);
        job.setDescription(description);
        job.setSalary(salary);
        job.setLocation(location);
        job.setPostedDate(postedDate);
        job.setDeadLine(deadLine);
        job.setStatus("pending");

        // Add the job to the database
        JobDAO jobDAO = new JobDAO();
        boolean isAdded = jobDAO.addJob(job);

        if (isAdded) {
            // Redirect to the admin dashboard with a success message
            request.getSession().setAttribute("successMessage", "Job added successfully!");
            response.sendRedirect("admin.jsp");
        } else {
            // Redirect back to the add job page with an error message
            request.setAttribute("errorMessage", "Failed to add job. Please try again.");
            request.getRequestDispatcher("AddJob.jsp").forward(request, response);
        }
    }

    // Helper method to parse a date string into a Date object
    private Date parseDate(String dateStr) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    private Timestamp parseTimestamp(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}