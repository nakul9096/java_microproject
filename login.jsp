<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login to your account</title>
<link rel="icon" href="account-25.png">
<style>
html{
height: 100%;
}
body {
height:100%;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to bottom, #f0f0f0, #d3e1f8);
}

header {
    background-color: #333; /* Change to dark grey color */
    color: #fff;
    padding: 1rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2); /* Add a subtle shadow for material look */
}

.logo {
    display: flex;
    align-items: center;
}

.logo img {
    height: 40px; /* Adjust the height of your logo as needed */
    margin-right: 10px; /* Add some space between the logo and the app name */
}

.app-name {
    font-size: 1.5rem;
    font-weight: bold;
}

nav {
    flex-grow: 1;
    display: flex;
    justify-content: center;
}

nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
}

nav li {
    margin-right: 1rem;
}

nav a {
    text-decoration: none;
    color: #fff;
}

.signup-login-btn {
    background-color: #fff;
    color: #007BFF;
    border: 2px solid #007BFF;
    padding: 0.5rem 1rem;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.signup-login-btn:hover {
    background-color: #007BFF;
    color: #fff;
}

.login-container {
    max-width: 400px;
    margin: 100px auto; /* Adjust the margin value as needed to center the login container */
    background-color: #fff;
    padding: 70px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.login-title {
    text-align: center;
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 50px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.login-btn {
    background: linear-gradient(to bottom, #007BFF, #0056b3);
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    border-radius: 5px;
    width: 100%;
}

.login-btn:hover {
    background: linear-gradient(to bottom, #0056b3, #007BFF);
}

</style>
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
        <a href="Signup.jsp"><button class="signup-login-btn">Signup/Register</button></a>
    </header>
    <div class="login-container">
        <div class="login-title">Login</div>
        <form action="MemberServlet" method="post">
            <div class="form-group">
                <label for="username">Email:</label>
                <input type="text" name="email" id="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>
            </div>
            <input type="hidden" name="action" value="login">
            <button type="submit" class="login-btn" name="action">Login</button>
        </form>
    </div>
    <script>
        // Function to show a specific tab and set the "active" class
        function showTab(tabId) {
            var tabContents = document.getElementsByClassName("tab-content");
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }
            document.getElementById(tabId).style.display = "block";

            // Set active class for the clicked tab button and remove active class from other tabs
            var tabButtons = document.getElementsByClassName("tab-button");
            for (var i = 0; i < tabButtons.length; i++) {
                if (tabButtons[i].getAttribute("onclick") === "showTab('" + tabId + "')") {
                    tabButtons[i].classList.add("active");
                } else {
                    tabButtons[i].classList.remove("active");
                }
            }
        }

        // Show the Tab 1 content when the page loads
        showTab('personalTab');
    </script>
</body>
</html>
