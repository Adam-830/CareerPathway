<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Job Seeker</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #ff9f01; /* Updated background color */
        }
    </style>
</head>
<body class="bg-warning d-flex justify-content-center align-items-center vh-100 flex-column">

    <!-- Website Name at Top Center -->
    <h1 class="text-center text-dark w-100">PathwayPro</h1>

    <div class="add-job-container bg-dark text-white p-5 rounded shadow-sm" style="width: 100%; max-width: 500px;">
        <h2 class="text-center">Add Job Seeker</h2>
        <form action="AddJobSeeker" method="post">
            <!-- Job Title -->
            <div class="form-group">
                <label for="title">Skills:</label>
                <input type="text" id="skills" name="skills" class="form-control" required>
            </div>

            <!-- Job Description -->
            <div class="form-group">
                <label for="description">Experience:</label>
                <textarea id="experience" name="experience" class="form-control" rows="3" required></textarea>
            </div>

            <!-- Salary -->
            <div class="form-group">
                <label for="salary">Education:</label>
                <textarea id="education" name="education" class="form-control" rows='3' required></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">Add Job Seeker</button>
        </form>
        <p class="text-center mt-3"><a href="admin.jsp" class="text-light">Back to Dashboard</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>