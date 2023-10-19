<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link rel="icon" href="register.png">
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
.tabs-container {
	max-width: 800px;
	margin: 30px auto;
}

.tab-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	cursor: pointer;
}

.tab-button:hover {
	background-color: #45a049;
}

.tab-content {
	display: none;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: #fff;
}

.active {
	display: block;
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
	margin-right: 10px;
	/* Add some space between the logo and the app name */
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
	background: linear-gradient(to bottom, #007BFF, #0056b3);
	color: #fff;
	border: none;
	padding: 0.5rem 1rem;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	border-radius: 5px;
}

.signup-login-btn:hover {
	background: linear-gradient(to bottom, #0056b3, #007BFF);
}

/* Slider styles ... (existing styles) ... */

/* Improved Form Styling */
form {
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 0 auto;
}

form table {
	width: 100%;
}

form table tr td {
	padding: 10px;
}

form table tr td:first-child {
	text-align: right;
	font-weight: bold;
	width: 30%;
}

form table tr td:last-child {
	text-align: center;
}

form button {
	background: linear-gradient(to bottom, #007BFF, #0056b3);
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	border-radius: 5px;
}

form button:hover {
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
		<a href="login.jsp"><button class="signup-login-btn">Login</button></a>
	</header>
	<div class="tabs-container">
		<div class="tab-button" onclick="showTab('personalTab')" align="center">Personal & Account Information (Tab 1)</div>

		<!-- Combined Form: Personal Information and Account Information -->
		<div id="personalTab" class="tab-content active">
			<form action="MemberServlet" method="post" id="personalForm">
				<table>
					<caption>Personal and Account Information</caption>
					<tr>
						<td><label for="name">Name</label></td>
						<td><input type="text" name="name" id="name" required></td>
					</tr>
					<tr>
						<td><label for="age">Age</label></td>
						<td><input type="number" name="age" id="age" required></td>
					</tr>
					<tr>
						<td><label for="phone">Phone</label></td>
						<td><input type="number" name="phone" id="phone" required></td>
					</tr>
					<tr>
						<td><label for="adhar">Aadhar number</label></td>
						<td><input type="number" name="adhar" id="adhar" required></td>
					</tr>
					<tr>
						<td><label for="email">Email</label></td>
						<td><input type="email" name="email" id="email" required></td>
					</tr>
					<tr>
						<td><label for="password">Password</label></td>
						<td><input type="password" name="password" id="password"
							required></td>
					</tr>
					<tr>
						<td><label for="acc">Account number</label></td>
						<td><input type="number" name="acc" id="acc" required></td>
					</tr>
					<tr>
						<td><label for="accounttype">Account type</label></td>
						<td><select name="accounttype" id="accounttype" required>
								<option value="current">Current Account</option>
								<option value="saving">Savings Account</option>
								<option value="checking">Checking Account</option>
								<option value="fixedDeposit">Fixed Deposit</option>
								<option value="ira">IRA Account</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="country">Country</label></td>
						<td><select name="country" id="country" required>
								<option value="India">India (INR)</option>
								<option value="USA">USA (Dollar)</option>
								<option value="Europe">Europe (Euro)</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="ifsc">IFSC-code</label></td>
						<td><input type="text" name="ifsc" id="ifsc" required></td>
					</tr>
					
					<tr align="center">
						<td colspan="2">    
						<input type="hidden" name="action" value="register">
						<button type="reset">Clear Form</button>
						<button type="submit" >Register</button></td>
					</tr>
				</table>
			</form>
		</div>
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
