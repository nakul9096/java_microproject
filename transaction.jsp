<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Transaction" %>
<%@ page import="com.example.DAOtrust" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
</head>
<body>
    <h1>Transaction History</h1>
    
    <%
        String accountNumber = request.getParameter("acc");
        // Replace the following line with your actual code to retrieve transactions for the account
        public List<Transaction> getTransactionsForAccount(String acc)
        {
        	
        }
    %>
    
    <% if (!transactions.isEmpty()) { %>
        <table border="1">
            <tr>
                <th>Transaction ID</th>
                <th>Date</th>
                <th>Amount</th>
            </tr>
            <% for (Transaction transaction : transactions) { %>
                <tr>
                    <td><%= transaction.getTransactionId() %></td>
                    <td><%= transaction.getDate() %></td>
                    <td><%= transaction.getAmount() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No transactions found for this account.</p>
    <% } %>
</body>
</html>