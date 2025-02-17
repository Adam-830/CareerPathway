<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Jobs - PathwayPro</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Roboto:400,700&display=swap" rel="stylesheet">

  <!-- Custom Styles -->
  <style>
    /* Set white text color for navbar links */
    .navbar-nav .nav-link {
      color: white !important;
    }

    /* Set white text color for navbar brand */
    .navbar-brand span {
      color: white !important;
    }

    /* White text for job titles and description */
    .job_section .job_box h3,
    .job_section .job_box p {
      color: white;
    }

    /* White text for section heading */
    .heading_container h2 {
      color: white;
    }

    /* Set the background color of the entire body */
    body {
      background-color: #1a1a1a;
      color: white;
      margin: 0;
      padding: 0;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Ensures the content takes full height */
    .hero_area {
      flex: 1;
    }

    /* Job section styling */
    .job_section {
      padding-top: 40px;
      padding-bottom: 40px;
      width: 100%;
    }

    /* Container styling */
    .container {
      width: 100%;
      padding: 0 15px;
    }

    /* Footer styling */
    footer {
      background-color: #333;
      color: white;
      padding: 20px;
      text-align: center;
      width: 100%;
    }

    /* Job box styling */
    .job_box {
      background-color: #333;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 5px;
    }

    .job_box a {
      background-color: #f39c12;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
    }

    .job_box a:hover {
      background-color: #e67e22;
    }

    /* Search Bar Styles */
    .search-bar {
      margin-bottom: 20px;
      display: flex;
      justify-content: space-between;
    }

    .search-bar input,
    .search-bar select {
      width: 30%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .search-bar button {
      padding: 10px 20px;
      background-color: #f39c12;
      border: none;
      border-radius: 5px;
      color: white;
      cursor: pointer;
    }

    .search-bar button:hover {
      background-color: #e67e22;
    }

    /* Ensures the dropdowns are properly aligned */
    .search-bar select {
      width: 20%;
    }
  </style>
</head>

<body>
  <div class="hero_area">
    <!-- Header Section -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.html">
            <span>PathwayPro</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="job.jsp">Jobs</a>
                </li>
              </ul>
              <ul class="user_option navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">
                    <img src="images/login.png" alt="Login Icon">
                    <span>Login</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="register.jsp">
                    <img src="images/register.png" alt="Register Icon">
                    <span>Register</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- End Header Section -->

    <!-- Job Page Content Section -->
    <section class="job_section layout_padding-bottom">
      <div class="container">
        <div class="heading_container">
          <h2>
            Available Jobs <br>
            <span>Find your dream job here</span>
          </h2>
        </div>

        <!-- Search Bar with Dropdowns and Search Button -->
        <div class="search-bar">
          <!-- Job Title Search -->
          <input type="text" id="search-input" placeholder="Search by job title..." />
          
          <!-- Location Dropdown -->
          <select id="location-select">
            <option value="">Location (Malaysia)</option>
            <option value="Kuala Lumpur">Kuala Lumpur</option>
            <option value="Penang">Penang</option>
            <option value="Selangor">Selangor</option>
            <option value="Johor">Johor</option>
            <option value="Melaka">Melaka</option>
          </select>

          <!-- Category Dropdown -->
          <select id="category-select">
            <option value="">Category</option>
            <option value="Developer">Developer</option>
            <option value="Designer">Designer</option>
            <option value="Manager">Manager</option>
            <option value="Marketing">Marketing</option>
            <option value="Sales">Sales</option>
          </select>

          <!-- Search Button -->
          <button onclick="filterJobs()">Search</button>
        </div>

        <div class="job_list" id="job-list">
          <!-- Sample Job Listing 1 -->
          <div class="job_box" data-location="Kuala Lumpur" data-category="Developer">
            <h3>Software Developer</h3>
            <p class="location"><strong>Location:</strong> Kuala Lumpur, Malaysia</p>
            <p class="category"><strong>Category:</strong> Developer</p>
            <a href="#" onclick="goBack()" class="btn btn-primary">View Details</a>
          </div>
          <!-- Sample Job Listing 2 -->
          <div class="job_box" data-location="Penang" data-category="Designer">
            <h3>Graphic Designer</h3>
            <p class="location"><strong>Location:</strong> Penang, Malaysia</p>
            <p class="category"><strong>Category:</strong> Designer</p>
            <a href="#" onclick="goBack()" class="btn btn-primary">View Details</a>
          </div>
          <!-- Add other job listings similarly -->
        </div>
      </div>
    </section>
  </div>

  <!-- Footer Section -->
  <footer class="container-fluid footer_section">
    <p>
      &copy; 2024 All Rights Reserved By PathwayPro
    </p>
  </footer>

  <!-- Bootstrap and jQuery Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

  <!-- Search Job Functionality -->
  <script>
    function filterJobs() {
      const input = document.getElementById('search-input').value.toLowerCase();
      const location = document.getElementById('location-select').value.toLowerCase();
      const category = document.getElementById('category-select').value.toLowerCase();
      const jobList = document.getElementById('job-list');
      const jobs = jobList.getElementsByClassName('job_box');

      for (let job of jobs) {
        const jobTitle = job.getElementsByTagName('h3')[0].textContent.toLowerCase();
        const jobLocation = job.getElementsByClassName('location')[0].textContent.toLowerCase();
        const jobCategory = job.getElementsByClassName('category')[0].textContent.toLowerCase();

        if (jobTitle.includes(input) &&
            jobLocation.includes(location) &&
            jobCategory.includes(category)) {
          job.style.display = "";
        } else {
          job.style.display = "none";
        }
      }
    }

    function goBack() {
      window.history.back();
    }
  </script>
</body>

</html>