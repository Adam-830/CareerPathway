<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.Job" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.user.dao.JobDAO" %>
<%@ page import="com.user.dao.JobSeekerDAO" %>
<%@ page import="com.user.model.JobSeekers" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css"> <!-- Verify the path -->
    <style>
        body {
            background-color: #ff9f01; /* Updated background color */
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <div class="ml-auto">
            <a href="LogoutServlet.java" class="btn btn-outline-light">Logout</a>
        </div>
    </nav>

        <!-- Section for Job Listings Approval -->
       <!-- Container for Admin Functions -->
    <div class="container mt-5">
        <h1 class="text-center mb-4">Welcome, Admin!</h1>

        <!-- Section for Job Listings Approval -->
        <section class="mb-5">
            <h2>Pending Job Listings</h2>
            <div class="mb-3">
                <a href="AddJob.jsp" class="btn btn-primary">Add Job Listing</a>
            </div>
            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th>Job ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Salary</th>
                        <th>Location</th>
                        <th>Posted</th>
                        <th>Deadline</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        JobDAO jobDAO = new JobDAO();
                        List<Job> jobListings = jobDAO.getAllJobs();
                        if (jobListings != null && !jobListings.isEmpty()) {
                            for (Job job : jobListings) {
                    %>
                    <tr>
                        <td><%= job.getJobID() %></td>
                        <td><%= job.getTitle() %></td>
                        <td><%= job.getDescription() %></td>
                        <td><%= job.getSalary() %></td>
                        <td><%= job.getLocation() %></td>
                        <td><%= job.getPostedDate() %></td>
                        <td><%= job.getDeadLine() %></td>
                        <td><%= job.getStatus() %></td>
                        <td>
                            <!-- Delete Form -->
                            <form action="AdminController" method="post" class="d-inline">
                                <input type="hidden" name="jobId" value="<%= job.getJobID() %>">
                                <button type="submit" name="action" value="delete" class="btn btn-danger">Delete</button>
                            </form>

                            <!-- Edit Button -->
                            <button class="btn btn-warning" data-toggle="modal" data-target="#editJobModal<%= job.getJobID() %>">Edit</button>
                            
                            <!-- Approve Form -->
                            <form action="AdminController" method="post" class="d-inline">
                                 <input type="hidden" name="jobId" value="<%= job.getJobID() %>">
                                 <button type="submit" name="action" value="approve" class="btn btn-success">Approve</button>
                            </form>
                            
                            <!-- Reject Form -->
                            <form action="AdminController" method="post" class="d-inline">
                                <input type="hidden" name="jobId" value="<%= job.getJobID() %>">
                                <button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>
                            </form>
                            
                            <!-- Edit Job Modal -->
                            <div class="modal fade" id="editJobModal<%= job.getJobID() %>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" style="color: black">Edit Job</h5>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="AdminController" method="post">
                                                <input type="hidden" name="jobId" value="<%= job.getJobID() %>"> 
                                                <div class="form-group">
                                                    <label style="color:black">Title</label>
                                                    <input type="text" name="title" class="form-control" value="<%= job.getTitle() %>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color:black">Description</label>
                                                    <textarea name="description" class="form-control" required><%= job.getDescription() %></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color:black">Salary</label>
                                                    <input type="number" name="salary" class="form-control" value="<%= job.getSalary() %>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color:black">Location</label>
                                                    <input type="text" name="location" class="form-control" value="<%= job.getLocation() %>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color:black">Posted Date:</label>
                                                    <input type="datetime-local" id="postedDate" name="postedDate" class="form-control" required>
                                                </div>
                                                <div class="form-group">
                                                    <label style="color:black">Application Deadline:</label>
                                                    <input type="datetime-local" id="deadLine" name="deadLine" class="form-control" required>
                                                </div>
                                                <button type="submit" name="action" value="update" class="btn btn-primary">Update Job</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="9" class="text-center">No pending job listings found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>

         <div class="container mt-5">
        <!-- Section for Managing Job Seekers -->
        <section>
            <h2>Manage Job Seekers</h2>
            <div class="mb-3">
                <a href="AddJobSeeker.jsp" class="btn btn-primary">Add Job Seeker</a>
            </div>
            <table class="table table-striped table-light">
                <thead>
                    <tr>
                        <th>Job Seeker ID</th>
                        <th>Skills</th>
                        <th>Experience</th>
                        <th>Education</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Fetch job seekers from the request attribute
                        JobSeekerDAO jobseekerDAO = new JobSeekerDAO();
                        List<JobSeekers> jobSeekerList = jobseekerDAO.getAllJobSeekers();
                        if (jobSeekerList != null && !jobSeekerList.isEmpty()) {
                            for (JobSeekers jobSeek : jobSeekerList){
                    %>
                    <tr>
                        <td><%= jobSeek.getJobSeekerID() %></td>
                        <td><%= jobSeek.getSkills() %></td>
                        <td><%= jobSeek.getExperience() %></td>
                        <td><%= jobSeek.getEducation() %></td>
                        <td>
                            <!--Delete Form-->
                            <form action="ManageJobSeeker" method="post" class="d-inline">
                                <input type="hidden" name="jobSeekerId" value="<%= jobSeek.getJobSeekerID() %>">
                                <button type="submit" name="action2" value="delete" class="btn btn-danger">Delete</button>
                            </form>
                                
                            <!-- Edit Button -->
                            <button class="btn btn-warning" data-toggle="modal" data-target="#editJobModal<%= jobSeek.getJobSeekerID() %>">Edit</button>
                            
                            <!-- Edit Job Modal -->
                            <div class="modal fade" id="editJobModal<%= jobSeek.getJobSeekerID() %>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Job Seeker</h5>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="ManageJobSeeker" method="post">
                                                <input type="hidden" name="jobSeekerId" value="<%= jobSeek.getJobSeekerID() %>"> 
                                                <div class="form-group">
                                                    <label>Skills</label>
                                                    <textarea name="skills" class="form-control" value="<%= jobSeek.getSkills() %>" required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Experience</label>
                                                    <textarea name="experience" class="form-control" required><%= jobSeek.getExperience()%></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Education</label>
                                                    <textarea name="education" class="form-control" required><%= jobSeek.getEducation()%></textarea>
                                                </div>
                                                <button type="submit" name="action2" value="update" class="btn btn-primary">Update Job</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                       
                        
                        
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No job seekers found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
