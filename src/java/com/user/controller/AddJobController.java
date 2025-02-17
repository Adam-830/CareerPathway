package com.user.controller;

import com.user.dao.JobDAO;
import com.user.model.Job;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String location = request.getParameter("location");
        Date postedDate = parseDate(request.getParameter("postedDate"));
        Date deadline = parseDate(request.getParameter("deadline"));

        // Create a Job object
        Job job = new Job();
        job.setTitle(title);
        job.setDescription(description);
        job.setSalary(salary);
        job.setLocation(location);
        job.setPostedDate(postedDate);
        job.setDeadline(deadline);

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
}