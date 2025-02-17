<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #ff9f01;
        }
    </style>
</head>
<body class="bg-warning d-flex justify-content-center align-items-center vh-100 flex-column">
    <h1 class="text-center text-dark w-100">PathwayPro</h1>
    <div class="login-container bg-dark text-white p-5 rounded shadow-sm" style="width: 100%; max-width: 400px;">
        <h2 class="text-center">Login</h2>
        <form action="UserController" method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <% if (request.getAttribute("error") != null) { %>
                <p class="text-danger mt-3"><%= request.getAttribute("error") %></p>
            <% } %>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="register.jsp" class="text-light">Register here</a>.</p>
    </div>
</body>
</html>