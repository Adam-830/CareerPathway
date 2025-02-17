package com.user.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:derby://localhost:1527/CareerPathway"; // Update with your database URL
    private static final String DB_USER = "app"; // Update with your database username
    private static final String DB_PASSWORD = "app"; // Update with your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        // Validate form data
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            // If any field is empty, set an error message and redirect back to the registration page
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            // If passwords do not match, set an error message and redirect back to the registration page
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // If validation passes, proceed to store the user in the database
        Connection conn = null;
        PreparedStatement pstmtApplicant = null;
        PreparedStatement pstmtJobseeker = null;

        try {
            // Load the JDBC driver and establish a connection
            Class.forName("org.apache.derby.jdbc.ClientDriver"); // Update with your database driver
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Insert into the `applicant` table with a default role of "jobseeker"
            String sqlApplicant = "INSERT INTO users (username, email, password, roles) VALUES (?, ?, ?, ?)";
            pstmtApplicant = conn.prepareStatement(sqlApplicant);
            pstmtApplicant.setString(1, username);
            pstmtApplicant.setString(2, password);
            pstmtApplicant.setString(3, email);// In a real application, hash the password before storing it
            pstmtApplicant.setString(4, "jobseeker"); // Assign default role as "jobseeker"

            // Execute the query for `applicant` table
            int rowsAffectedApplicant = pstmtApplicant.executeUpdate();

            if (rowsAffectedApplicant > 0) {
                // If the user is successfully registered, redirect to the login page
                response.sendRedirect("login.jsp");
            } else {
                // If registration fails, set an error message and redirect back to the registration page
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // If an exception occurs, set an error message and redirect back to the registration page
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            // Close the database resources
            try {
                if (pstmtApplicant != null) pstmtApplicant.close();
                if (pstmtJobseeker != null) pstmtJobseeker.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}