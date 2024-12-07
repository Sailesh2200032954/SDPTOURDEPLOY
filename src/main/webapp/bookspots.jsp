<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Spot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        h3 {
            text-align: center;
            color: #333;
            margin-top: 20px;
            text-decoration: underline;
        }
        .message {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background-color: #e7f4e4;
            border: 1px solid #c3e6cb;
            color: #155724;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 5px;
        }
        .error {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 5px;
        }
        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%@ include file="touristnavbar.jsp" %>

<h3>Book Spot</h3>

<%
    // Retrieve spotId and userId from the request
    String spotId = request.getParameter("spotId");
    String userId = (String) session.getAttribute("userId"); // Assuming user is logged in and userId is stored in session

    // Mock booking process for demonstration
    boolean bookingSuccess = false;

    if (spotId != null && userId != null) {
        // Replace with your actual service or database logic
        // Example: bookingSuccess = spotService.bookSpot(userId, spotId);

        // Simulate booking success
        bookingSuccess = true;

        if (bookingSuccess) {
%>
<div class="message">
    <h4>Spot successfully booked!</h4>
    <p>You have successfully booked the spot with ID: <strong><%= spotId %></strong>.</p>
</div>
<div class="action-buttons">
    <button onclick="window.location.href='myspots.jsp'">View My Spots</button>
    <button onclick="window.location.href='touristhome.jsp'">Go to Home</button>
</div>
<%
        } else {
%>
<div class="error">
    <h4>Booking Failed</h4>
    <p>Sorry, we couldn't process your booking for the spot with ID: <strong><%= spotId %></strong>. Please try again later.</p>
</div>
<%
        }
    } else {
%>
<div class="error">
    <h4>Error: Missing Information</h4>
    <p>No spot selected or user is not logged in. Please go back and try again.</p>
</div>
<div class="action-buttons">
    <button onclick="window.location.href='touristhome.jsp'">Go Back</button>
</div>
<%
    }
%>

</body>
</html>
