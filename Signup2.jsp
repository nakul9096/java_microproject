<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
  }

  /* Blue header styles */
  header {
    background-color: #007BFF;
    color: #fff;
    padding: 1rem;
    display: flex;
    justify-content: space-between;
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
    <a href="signup.html"><button class="signup-login-btn">Sign Up / Login</button></a>
</header>

<div class="tabs-container">
  <div class="tab-button" onclick="showTab('personalTab')">Personal Information (Tab 1)</div>
  <div class="tab-button" onclick="showTab('accountTab')">Account Information (Tab 2)</div>
  
  <!-- Personal Information Tab -->
  <div id="personalTab" class="tab-content active">
    <form action="Register" method="post">
      <table align="center">
        <caption>Personal Information</caption>
        <tr>
          <td>Name</td>
          <td><input type="text" name="name"></td>
        </tr>
        <tr>
          <td>Age</td>
          <td><input type="number" name="age"></td>
        </tr>
        <tr>
          <td>Phone</td>
          <td><input type="number" name="phone"></td>
        </tr>
        <tr>
          <td>Aadhar number</td>
          <td><input type="number" name="adhar"></td>
        </tr>
        <tr>
          <td>Email</td>
          <td><input type="email" name="email"></td>
        </tr>
        <tr>
          <td>Password</td>
          <td><input type="password" name="password"></td>
        </tr>
        <tr align="center">
          <td><button type="reset">Clear Form</button></td>
          <td><button type="button" onclick="showTab('accountTab')">Next</button></td>
        </tr>
      </table>
    </form>
  </div>
  
  <!-- Account Information Tab -->
  <div id="accountTab" class="tab-content">
    <form action="Register" method="post">
      <table align="center">
        <caption>Account Information</caption>
        <tr>
          <td>Account number</td>
          <td><input type="number" name="acc"></td>
        </tr>
        <tr>
          <td>Account type</td>
          <td>
            <select>
              <option>current</option>
              <option>saving</option>
              <option>checking</option>
              <option>fixed deposit</option>
              <option>IRA</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Country</td>
          <td>
            <select>
              <option>India (INR)</option>
              <option>USA (Dollar)</option>
              <option>Europe (Euro)</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>IFSC-code</td>
          <td><input type="text" name="ifsc"></td>
        </tr>
        <tr align="center">
          <td><button type="reset">Clear Form</button></td>
          <td><button type="submit">Register</button></td>
        </tr>
      </table>
    </form>
  </div>
</div>

<script>
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
</script>

</body>
</html>
