package com.user.controller;

import com.user.dao.JobDAO;
import com.user.model.Job;
import util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/Search")
public class SearchJob extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        Connection connection = DBConnection.getConnection();
        JobDAO jobDAO = new JobDAO();
        List<Job> jobList = jobDAO.searchJobs(title, location, description);

        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("job.jsp").forward(request, response);
    }
}
