<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details - Software Developer</title>
    <!-- Link to Bootstrap CSS from CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #ff9f01;
        }

        .job-details-container {
            background-color: #333333; /* Dark grey */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: white; /* Set text color to white for all text inside the container */
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

        /* Ensure buttons are visible with appropriate color */
        .btn {
            color: white;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">

    <div class="job-details-container w-75">
        <h1 class="text-center job-title">Software Developer</h1>
        
        <div class="job-description">
            <p>Join our team and work on innovative software solutions that will shape the future of technology. We are looking for passionate and skilled developers to contribute to dynamic projects in a collaborative environment.</p>
        </div>

        <div class="job-info">
            <h4 class="text-primary">Job Details</h4>
            <ul class="list-unstyled">
                <li><strong>Location:</strong> Kuala Lumpur, Malaysia</li>
                <li><strong>Category:</strong> Developer</li>
            </ul>
        </div>

        <div class="section-title">Responsibilities:</div>
        <ul class="list-unstyled">
            <li>Develop and maintain software applications.</li>
            <li>Collaborate with cross-functional teams to design and implement new features.</li>
            <li>Ensure the performance, quality, and responsiveness of applications.</li>
            <li>Identify and resolve bugs, and conduct code reviews.</li>
        </ul>

        <div class="section-title">Requirements:</div>
        <ul class="requirements-list">
            <li>Bachelor's degree in Computer Science or related field.</li>
            <li>Proven experience as a Software Developer or similar role.</li>
            <li>Proficiency in Java, Python, or similar programming languages.</li>
            <li>Experience with web development frameworks and databases.</li>
            <li>Excellent problem-solving skills and attention to detail.</li>
            <li>Strong communication and teamwork skills.</li>
        </ul>

        <div class="text-center">
            <a href="apply.jsp" class="btn btn-success btn-lg">Apply Now</a>
            <a href="index.jsp" class="btn btn-secondary btn-lg">Back to Jobs List</a>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>