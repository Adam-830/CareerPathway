<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .profile-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
  <div class="profile-container">
    <h2 class="text-center">Edit Profile</h2>
    <form action="UpdateProfileController" method="post">
      <div class="form-group">
        <label for="skills">Skills:</label>
        <textarea id="skills" name="skills" class="form-control" rows="3" required><%= request.getAttribute("skills") != null ? request.getAttribute("skills") : "" %></textarea>
      </div>
      <div class="form-group">
        <label for="experience">Experience:</label>
        <textarea id="experience" name="experience" class="form-control" rows="3" required><%= request.getAttribute("experience") != null ? request.getAttribute("experience") : "" %></textarea>
      </div>
      <div class="form-group">
        <label for="education">Education:</label>
        <textarea id="education" name="education" class="form-control" rows="3" required><%= request.getAttribute("education") != null ? request.getAttribute("education") : "" %></textarea>
      </div>
      <button type="submit" class="btn btn-primary w-100">Save Changes</button>
    </form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>