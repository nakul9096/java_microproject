<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Your CSS code here */
        /* Reset some default styles for consistency */
        body, h1, form {
            margin: 0;
            padding: 0;
        }

        .account-container {
            width: 80%;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
        }

        /* Style for the form elements */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input, button {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        input:focus, button:focus {
            outline: none;
            border-color: #007bff;
        }

        /* Header styling */
        header {
            background-color: #333;
            color: #fff;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .app-name {
            font-size: 1.5rem;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-right: 20px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
            transition: color 0.3s ease-in-out;
        }

        nav a:hover {
            color: #f0f0f0;
        }
    </style>
    <title>Account Page</title>
</head>
<body>
    <header>
        <div class="logo">
            <img src="neshot.png" alt="Your Logo">
            <div class="app-name">Trust Fund</div>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="account.jsp">Transfer</a></li>
                <li><a href="#">Payments</a></li>
                <li><a href="#">Loans</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <a href="Signup.jsp"><button class="signup-login-btn">Sign Up / Login</button></a>
    </header>
    <br><br><br>
    <div class="account-container">
        <h1>Transfer Money</h1>
        <form id="transfer-form" action="MemberServlet?action=transfer" method="post">
            <label for="source-account">Source Account:</label>
            <input type="text" id="source-account" name="source-account" required>

            <label for="destination-account">Destination Account:</label>
            <input type="text" id="destination-account" name="destination-account" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>

            <button type="submit">Transfer</button>
        </form>
    </div>
</body>
</html>
