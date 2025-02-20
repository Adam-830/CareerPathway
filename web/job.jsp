<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
    <!-- Include Bootstrap for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #ff9f01;
        }

        .job_list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            
        }
        .job_box {
            background-color: #333333; /* Dark grey */
            width: calc(33.33% - 20px);
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            color: white; /* Set text color to white for all text inside the container */

        }
        .job_box:hover {
            transform: translateY(-10px);
        }
        .job_box h3 {
            font-size: 1.5rem;
            color: #007bff;
        }
        .job_box p {
            margin: 5px 0;
        }
        .btn-primary {
            margin-top: 10px;
        }
        .container {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Job Listings</h1>

    <!-- Search Bar with Dropdown for Location and Input for Title -->
    <div class="mb-4 d-flex justify-content-between">
        <!-- Job Title Search -->
        <input type="text" class="form-control w-50 me-2" id="searchBar" placeholder="Search by job title...">
        
        <!-- Location Dropdown -->
        <select class="form-select w-25 me-2" id="location-select">
            <option value="">Location (Malaysia)</option>
            <option value="Kuala Lumpur">Kuala Lumpur</option>
            <option value="Penang">Penang</option>
            <option value="Selangor">Selangor</option>
            <option value="Johor">Johor</option>
            <option value="Melaka">Melaka</option>
        </select>

        <!-- Search Button -->
        <button class="btn btn-primary" id="searchButton">Search</button>
    </div>

    <div class="job_list" id="job-list">
        <%
            // Establish connection using DBConnection utility class
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                String query = "SELECT jobID, title, description, salary, location, postedDate, deadline FROM job";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                // Loop through the result set and display job listings
                while (rs.next()) {
                    int jobID = rs.getInt("jobID");
                    String title = rs.getString("title");
                    double salary = rs.getDouble("salary");
                    String location = rs.getString("location");
                    Timestamp postedDate = rs.getTimestamp("postedDate");
                    Timestamp deadline = rs.getTimestamp("deadline");
        %>
                    <div class="job_box" 
                         data-title="<%= title.toLowerCase() %>" 
                         data-location="<%= location.toLowerCase() %>">
                        <h3><%= title %></h3>
                        <p class="location"><strong>Location:</strong> <%= location %></p>
                        <p class="salary"><strong>Salary:</strong> RM <%= salary %></p>
                        <p class="postedDate"><strong>Posted on:</strong> <%= postedDate %></p>
                        <p class="deadline"><strong>Apply by:</strong> <%= deadline %></p>
                        <a href="jobDetails.jsp?jobID=<%= jobID %>" class="btn btn-primary">View Details</a>
                    </div>
        <%
                }
                rs.close();
                ps.close();
                conn.close();
            } else {
        %>
            <p class="text-danger">Error connecting to the database.</p>
        <%
            }
        %>
    </div>
</div>

<!-- Include Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Search and Filter Script -->
<script>
    document.getElementById("searchButton").addEventListener("click", filterJobs);

    function filterJobs() {
        var searchValue = document.getElementById("searchBar").value.toLowerCase();
        var selectedLocation = document.getElementById("location-select").value.toLowerCase();
        var jobBoxes = document.querySelectorAll(".job_box");

        jobBoxes.forEach(function(box) {
            var title = box.getAttribute("data-title");
            var location = box.getAttribute("data-location");

            // Check if the title matches the search value and location matches the selected location
            var matchesTitle = title.includes(searchValue);
            var matchesLocation = selectedLocation === "" || location.includes(selectedLocation);

            if (matchesTitle && matchesLocation) {
                box.style.display = "block";
            } else {
                box.style.display = "none";
            }
        });
    }
</script>

</body>
</html>
