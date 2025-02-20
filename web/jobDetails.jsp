<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection" %> <!-- Import DB Connection Class -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <!-- Link to Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #ff9f01;
        }
        .job-details-container {
            background-color: #333333;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: white;
        }
        .job-title {
            font-size: 2rem;
            font-weight: bold;
        }
        .job-description {
            font-size: 1.1rem;
            margin-top: 20px;
        }
        .job-info {
            margin-top: 20px;
        }
        .requirements-list {
            list-style-type: square;
            padding-left: 20px;
        }
        .section-title {
            margin-top: 20px;
            font-weight: bold;
            font-size: 1.2rem;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">

    <div class="job-details-container w-75">
        <%
            // Get jobID from request parameter
            String jobID = request.getParameter("jobID");

            // Check if jobID is not null or empty
            if (jobID != null && !jobID.isEmpty()) {
                // Establish database connection using DBConnection class
                Connection conn = DBConnection.getConnection();
                if (conn != null) {
                    // Prepare the SQL query to fetch job details by jobID
                    String query = "SELECT title, description, salary, location, postedDate, deadline FROM job WHERE jobID = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1, Integer.parseInt(jobID));
                    ResultSet rs = ps.executeQuery();

                    // Check if the job is found
                    if (rs.next()) {
                        // Retrieve job details from the result set
                        String title = rs.getString("title");
                        String description = rs.getString("description");
                        double salary = rs.getDouble("salary");
                        String location = rs.getString("location");
                        Timestamp postedDate = rs.getTimestamp("postedDate");
                        Timestamp deadline = rs.getTimestamp("deadline");
        %>
                        <!-- Display Job Details Dynamically -->
                        <h1 class="text-center job-title"><%= title %></h1>

                        <div class="job-info">
                            <h4 class="text-primary">Job Details</h4>
                            <ul class="list-unstyled">
                                <li><strong>Location:</strong> <%= location %></li>
                                <li><strong>Salary:</strong> RM <%= salary %></li>
                                <li><strong>Posted on:</strong> <%= postedDate %></li>
                                <li><strong>Apply by:</strong> <%= deadline %></li>
                            </ul>
                        </div>

                            <div class="job-description">
                            <p><%= description %></p>
                        </div>
                        
                        <div class="text-center">
                            <a href="apply.jsp?jobID=<%= jobID %>" class="btn btn-success btn-lg">Apply Now</a>
                            <a href="job.jsp" class="btn btn-secondary btn-lg">Back to Jobs List</a>
                        </div>
        <%
                    } else {
                        // Job not found
        %>
                        <h2 class="text-center text-warning">Job not found!</h2>
        <%
                    }
                    rs.close();
                    ps.close();
                    conn.close();
                } else {
        %>
                    <h2 class="text-center text-danger">Database connection error!</h2>
        <%
                }
            } else {
        %>
                <h2 class="text-center text-warning">Invalid Job ID!</h2>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
