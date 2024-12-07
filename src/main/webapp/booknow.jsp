<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Now</title>
</head>
<body>
<%@ include file="touristnavbar.jsp" %>

<h3 style="text-align: center;"><u>Book Your Spot</u></h3>

<!-- Booking Form -->
<form action="bookconfirmation.jsp" method="get" style="text-align: center;">
    <input type="hidden" name="spotId" value="${param.spotId}" />
    <label for="name"><strong>Name:</strong></label>
    <input type="text" name="name" id="name" required>
    <br><br>

    <label for="email"><strong>Email:</strong></label>
    <input type="email" name="email" id="email" required>
    <br><br>

    <label for="date"><strong>Booking Date:</strong></label>
    <input type="date" name="date" id="date" required>
    <br><br>

    <button type="submit">Confirm Booking</button>
</form>

</body>
</html>
