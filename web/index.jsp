<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

  <title>PathwayPro</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Roboto:400,700&display=swap" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- Responsive CSS -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
  <div class="hero_area">
    <!-- Header Section -->
    <header class="header_section">
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg custom_nav-container">
      <a class="navbar-brand" href="index.jsp">
        <span>PathwayPro</span>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
        <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="job.jsp">Jobs</a>
            </li>
          </ul>
          <form class="form-inline ml-0 ml-lg-4">
            <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
          </form>
          <ul class="user_option navbar-nav">
            <% if (session.getAttribute("username") != null) { %>
              <li class="nav-item">
                <a class="nav-link" href="profile.jsp">
                  <img src="images/profile.png" alt="Profile Icon">
                  <span>Profile</span>
                </a>
              </li>
            <% } else { %>
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
            <% } %>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</header>
    <!-- End Header Section -->

    <!-- Slider Section -->
    <section class="slider_section">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="indicator_box">
          <div>
            <span>01/</span>
          </div>
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">01</li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1">02</li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2">03</li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3">04</li>
          </ol>
        </div>
        <div class="carousel-inner">
          <!-- First Carousel Item -->
          <div class="carousel-item active">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-4 offset-md-1">
                  <div class="detail-box">
                    <h1>Software Developer</h1>
                    <p>Join our dynamic tech team and work on cutting-edge software solutions.</p>
                    <div>
                      <a href="job-details.jsp?job=developer">Read More</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="img-box">
                    <img src="images/slider-img.png" alt="Software Developer">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Second Carousel Item -->
          <div class="carousel-item">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-4 offset-md-1">
                  <div class="detail-box">
                    <h1>Graphic Designer</h1>
                    <p>Bring your creative skills to life and design stunning visuals.</p>
                    <div>
                      <a href="job-details.jsp?job=graphic-designer">Read More</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="img-box">
                    <img src="images/slider-img.png" alt="Graphic Designer">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Third Carousel Item -->
          <div class="carousel-item">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-4 offset-md-1">
                  <div class="detail-box">
                    <h1>Marketing Manager</h1>
                    <p>Lead marketing campaigns and drive the brand’s success.</p>
                    <div>
                      <a href="job-details.jsp?job=marketing-manager">Read More</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="img-box">
                    <img src="images/slider-img.png" alt="Marketing Manager">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Fourth Carousel Item -->
          <div class="carousel-item">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-4 offset-md-1">
                  <div class="detail-box">
                    <h1>Data Analyst</h1>
                    <p>Use data-driven insights to shape the future of business strategies.</p>
                    <div>
                      <a href="job-details.jsp?job=data-analyst">Read More</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="img-box">
                    <img src="images/slider-img.png" alt="Data Analyst">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="sr-only">Next</span>
        </a>
      </div>
    </section>
    <!-- End Slider Section -->
  </div>

  <!-- Find Section -->
  <section class="find_section">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-8 offset-lg-1 col-md-9 offset-md-1">
          <form action="search.jsp" method="GET">
            <div class="form_container">
              <div class="box b-1">
                <input type="text" class="form-control" placeholder="Job Title or Keywords" name="query">
              </div>
              <div class="box b-2">
                <input type="text" class="form-control" placeholder="Location" name="location">
              </div>
              <div class="box b-3">
                <input type="text" class="form-control" placeholder="All Category" name="category">
              </div>
              <div class="btn-box">
                <button type="submit">Search</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!-- End Find Section -->

  <!-- Job Section -->
  <section class="job_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container">
        <h2>
          Recommended Jobs <br>
          <span>15000+ Jobs Available For You</span>
        </h2>
      </div>
      <div class="handler_btn-box" id="myTab" role="tablist">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="jb-1-tab" data-toggle="tab" href="#jb-1" role="tab" aria-controls="jb-1" aria-selected="true">Full Time</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="jb-2-tab" data-toggle="tab" href="#jb-2" role="tab" aria-controls="jb-2" aria-selected="false">Part Time</a>
          </li>
        </ul>
      </div>
      <div class="tab-content" id="myTabContent">
        <div class="job_board tab-pane fade show active" id="jb-1" role="tabpanel" aria-labelledby="jb-1-tab">
          <div class="content-box">
            <div class="content layout_padding2-top">
              <div class="box">
                <h3>Graphic Design</h3>
                <a href="apply.jsp?job=graphic-design">Apply Now</a>
              </div>
              <div class="box">
                <h3>UX Design</h3>
                <a href="apply.jsp?job=ux-design">Apply Now</a>
              </div>
              <div class="box">
                <h3>Web Design</h3>
                <a href="apply.jsp?job=web-design">Apply Now</a>
              </div>
              <div class="box">
                <h3>UI Design</h3>
                <a href="apply.jsp?job=ui-design">Apply Now</a>
              </div>
            </div>
            <div class="btn-box">
              <a href="jobs.jsp">See More</a>
            </div>
          </div>
        </div>
        <div class="job_board tab-pane fade" id="jb-2" role="tabpanel" aria-labelledby="jb-2-tab">
          <div class="content-box">
            <div class="content layout_padding2-top">
              <div class="box">
                <h3>PHP Developer</h3>
                <a href="apply.jsp?job=php-developer">Apply Now</a>
              </div>
              <div class="box">
                <h3>Angular Developer</h3>
                <a href="apply.jsp?job=angular-developer">Apply Now</a>
              </div>
              <div class="box">
                <h3>HTML & CSS Developer</h3>
                <a href="apply.jsp?job=html-css-developer">Apply Now</a>
              </div>
              <div class="box">
                <h3>WordPress Developer</h3>
                <a href="apply.jsp?job=wordpress-developer">Apply Now</a>
              </div>
            </div>
            <div class="btn-box">
              <a href="jobs.jsp">See More</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Job Section -->

  <!-- Feature Section -->
  <section class="feature_section">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-5 offset-md-1">
          <div class="detail-box">
            <h2>Featured Job</h2>
            <p>Discover an exciting opportunity to advance your career with our featured job of the month!</p>
            <a href="featured-job.jsp">Read More</a>
          </div>
        </div>
        <div class="col-md-6 px-0">
          <div class="img-box">
            <img src="images/feature-img.jpg" alt="Featured Job">
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Feature Section -->

  <!-- Info Section -->
  <section class="info_section layout_padding2-bottom layout_padding-top">
    <div class="container info_content">
      <div>
        <div class="row">
          <div class="col-md-3 about_links">
            <div class="d-flex">
              <h5>About Us</h5>
            </div>
            <div class="d-flex">
              <ul>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="services.jsp">About Services</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3">
            <div class="d-flex">
              <h5 class="section-title">Jobs</h5>
            </div>
            <div class="d-flex">
              <ul class="info-list">
                <li><a href="jobs.jsp">Explore Job Openings</a></li>
                <li><a href="employers.jsp">Connect with Employers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3">
            <div class="d-flex">
              <h5 class="section-title">Services</h5>
            </div>
            <div class="d-flex">
              <ul class="info-list">
                <li><a href="career-guidance.jsp">Career Guidance</a></li>
                <li><a href="resume-support.jsp">Resume Support</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3">
            <div class="d-flex">
              <h5 class="section-title">Useful Links</h5>
            </div>
            <div class="d-flex">
              <ul class="info-list">
                <li><a href="career-tips.jsp">Career Tips</a></li>
                <li><a href="job-fairs.jsp">Job Fairs</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col-lg-3 mt-2">
            <div class="social-box">
              <a href="https://facebook.com"><img src="images/fb.png" alt="Facebook" /></a>
              <a href="https://twitter.com"><img src="images/twitter.png" alt="Twitter" /></a>
              <a href="https://linkedin.com"><img src="images/linkedin.png" alt="LinkedIn" /></a>
              <a href="https://instagram.com"><img src="images/insta.png" alt="Instagram" /></a>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="form_container mt-2">
              <form action="subscribe.jsp" method="POST">
                <label for="subscribeMail">Subscribe to Our Newsletter</label>
                <input type="email" placeholder="Enter your email" id="subscribeMail" name="email" required />
                <button type="submit">Subscribe</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Info Section -->

  <!-- Footer Section -->
  <footer class="container-fluid footer_section">
    <p>&copy; 2024 All Rights Reserved By PathwayPro</p>
  </footer>
  <!-- End Footer Section -->

  <!-- Bootstrap and jQuery Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>

</html>