<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.Member" %>
<%@ page import="com.example.DAOtrust" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="profileinf.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="neshot.png" alt="Your Logo">
        </div>
        <div class="app-name">Trust Fund</div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="#">Accounts</a></li>
                <li><a href="#">Payments</a></li>
                <li><a href="#">Loans</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <a href="dashboard.jsp"><button class="signup-login-btn">Back to dashboard</button></a>
    </header>
       <div class="container">
        <h1>User Profile</h1>

        <%-- Retrieve the member object from the request attribute --%>
        <% Member member = (Member) request.getAttribute("member"); %>
        <%-- Check if the member object is not null --%>
        <% if (member != null) { %>
            <div class="profile-info">
                <label for="name">Name:</label>
                <span><%= member.getName() %></span>
            </div>
            <div class="profile-info">
                <label for="age">Age:</label>
                <span><%= member.getAge() %></span>
            </div>
            <div class="profile-info">
                <label for="phone">Phone:</label>
                <span><%= member.getPhone() %></span>
            </div>
            <div class="profile-info">
                <label for="adhar">Adhar:</label>
                <span><%= member.getAdhar() %></span>
            </div>
            <div class="profile-info">
                <label for="email">Email:</label>
                <span><%= member.getEmail() %></span>
            </div>

            <div class="profile-edit-btn">
                <a href="edit_profile.jsp">Edit Profile</a>
            </div>
        <% } else { %>
            <p>Profile not found!</p>
        <% } %>

    </div>

    <footer>
        <!-- Your footer content here -->
    </footer>
</body>
</html>
