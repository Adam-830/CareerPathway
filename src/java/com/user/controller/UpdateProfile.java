/*package com.user.controller;

import com.user.dao.JobSeekerDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/UpdateProfileController"})
public class UpdateProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userID = (int) session.getAttribute("userID");

        // Retrieve form data
        String skills = request.getParameter("skills");
        String experience = request.getParameter("experience");
        String education = request.getParameter("education");

        // Update the jobseeker table
        JobSeekerDAO jobseekerDAO = new JobSeekerDAO();
        boolean isUpdated = jobseekerDAO.updateJobseekerProfile(userID, skills, experience, education);

        if (isUpdated) {
            request.setAttribute("successMessage", "Profile updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update profile. Please try again.");
        }

        // Redirect back to the profile page
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}*/