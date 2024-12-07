<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        h3 {
            color: #333;
            text-align: center;
            margin-top: 20px;
            text-decoration: underline;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 60%;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .center-text {
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

<h3>Booking Confirmation</h3>

<!-- Retrieve Spot Information -->
<c:set var="spotId" value="${param.spotId}" />
<!-- Replace mocked logic with actual backend fetching -->
<c:set var="spot" value="${spots[spotId]}" />

<!-- Confirmation Message -->
<div class="center-text">
    <h4>Thank you for your booking, <c:out value="${param.name}" />!</h4>
    <p>Your booking details are as follows:</p>
</div>

<!-- Booking Details Table -->
<table>
    <tr>
        <th>Spot</th>
        <td><c:out value="${spot.spotname}" /></td>
    </tr>
    <tr>
        <th>Country</th>
        <td><c:out value="${spot.country}" /></td>
    </tr>
    <tr>
        <th>State</th>
        <td><c:out value="${spot.state}" /></td>
    </tr>
    <tr>
        <th>Booking Date</th>
        <td><c:out value="${param.date}" /></td>
    </tr>
    <tr>
        <th>Name</th>
        <td><c:out value="${param.name}" /></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><c:out value="${param.email}" /></td>
    </tr>
</table>

<!-- Action Buttons -->
<div class="center-text">
    <p>Your booking has been successfully confirmed!</p>
    <button onclick="window.location.href='bookspots.jsp'">View All Spots</button>
    <button onclick="window.location.href='touristhome.jsp'">Go to Home</button>
</div>

</body>
</html>
