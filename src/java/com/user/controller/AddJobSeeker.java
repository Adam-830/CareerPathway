package com.user.controller;

import com.user.dao.JobSeekerDAO;
import com.user.model.JobSeekers;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddJobSeeker", urlPatterns = {"/AddJobSeeker"})
public class AddJobSeeker extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        String education = request.getParameter("education");
        // Create a Job Seeker object
        JobSeekers jobSeek = new JobSeekers();
        jobSeek.setSkills(skills);
        jobSeek.setExperience(experience);
        jobSeek.setEducation(education);

        // Add the job to the database
        JobSeekerDAO jobseekDAO = new JobSeekerDAO();
        boolean isAdded = jobseekDAO.addJobSeeker(jobSeek);

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