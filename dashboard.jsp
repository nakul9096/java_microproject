<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.DAOtrust" %>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
ResultSet rs = null;
DAOtrust dm = new DAOtrust();
con = dm.getConnection();
rs = dm.getData(con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trust-Fund Dashboard</title>
    <link rel="icon" href="neshot.png">
    <link rel="stylesheet" href="dash.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="neshot.png" alt="Your Logo">
        </div>
        <div class="app-name">Trust Fund</div>
        <nav>
            <ul>
               <li><a href="dashboard.jsp" id="homeButton">Home</a></li>
                <li><a href="account.jsp">Transfer</a></li>
                <li><a href="balance.jsp">Check balance</a></li>
                <li><a href="transaction.jsp">Transactions</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <div class="user-dropdown">
            <!-- Display the user's name here -->
<button class="user-btn" onclick="toggleDropdown()">
    Welcome,
    <%
        HttpSession session12 = request.getSession();
        String userName = (String) session.getAttribute("name");
        out.print(userName != null ? userName : "User");
    %>
    !
</button>
            <div class="dropdown-content" id="dropdown">
                <a href="MemberServlet?action=profile&email=<%= session.getAttribute("email") %>">Profile</a>
                <a href="setting.jsp">Settings</a>
                <a href="index.html">Logout</a>
            </div>
        </div>
    </header>
    <div class="slider-container">
        <!-- Slider content... -->
    </div>
    <footer>
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Trust Fund by Nakul. All rights reserved.</p>
    </footer>
    <script src="dashboard.js"></script>
</body>
</html>
