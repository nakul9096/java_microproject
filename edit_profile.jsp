<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h1 {
            background-color: #35424a;
            color: #fff;
            padding: 20px;
            margin: 0;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin: 20px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            background-color: #35424a;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }
        a {
            color: #35424a;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1>Edit Profile</h1>
 <form action="MemberServlet" method="post">
        <input type="hidden" name="action" value="edit_profile">
        <input type="hidden" name="email" value="${email}">
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${name}" required><br>
        
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="${age}" required><br>
        
        <label for="adhar">Adhar:</label>
        <input type="number" id="adhar" name="adhar" value="${adhar}" required><br>
        
        <label for="phone">Phone:</label>
        <input type="number" id="phone" name="phone" value="${phone}" required><br>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="${country}" required><br>
        
        <label for="ifsc">IFSC Code:</label>
        <input type="text" id="ifsc" name="ifsc" value="${ifsc}" required><br>
        
        <button type="submit">Update Profile</button>
    </form>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
