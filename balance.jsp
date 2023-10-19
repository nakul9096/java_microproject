<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.DAOtrust"%>
<%@ page import="com.example.Member" %>
<!DOCTYPE html>
<html>
<head>
    <title>Balance Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Balance:</h1>
        <%
            String email = (String) session.getAttribute("email");
            DAOtrust dao = new DAOtrust();
            Member member = dao.getMemberByEmail(email);
            String balance = "N/A"; // Default value if balance is not found
            if (member != null) {
                balance = member.getBalance();
            }
        %>
        <p><%= balance %></p>
    </div>
</body>
</html>