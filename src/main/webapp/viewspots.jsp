<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Spots</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
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
            text-decoration: underline;
        }
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        tr:hover td {
            background-color: #f1f1f1;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            color: #333;
            padding: 10px 15px;
            display: inline-block;
            margin: 20px 0;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #eaeaea;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #ddd;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            padding: 20px 0;
        }
    </style>
</head>
<body>
<%@ include file="touristnavbar.jsp" %>

<div class="container">
    <h3 style="text-align: center;"><u>View All Spots</u></h3>

    <!-- Table displaying spots -->
    <table>
        <tr>
            <th>ID</th>
            <th>COUNTRY</th>
            <th>STATE</th>
            <th>SPOT NAME</th>
            <th>BOOK SPOT</th>
        </tr>
        <c:forEach items="${spots}" var="spot">
            <tr>
                <td><c:out value="${spot.id}"/></td>
                <td><c:out value="${spot.country}"/></td>
                <td><c:out value="${spot.state}"/></td>
                <td><c:out value="${spot.spotname}"/></td>
                <td>
                    <!-- Book Spot Button -->
                    <button onclick="window.location.href='booknow.jsp?spotId=${spot.id}'">Book Spot</button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="touristhome.jsp">Go Back</a>
</div>

</body>
</html>
