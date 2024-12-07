<%@page import="com.klef.jfsd.sdpproject.model.Tourist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tourist Profile - Tourism Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
            display: flex;
        }

        /* Vertical Navbar Styles */
        .navbar {
            width: 250px;
            background: linear-gradient(180deg, #2c3e50 0%, #2c3e50 100%);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 20px;
            color: white;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            text-align: center;
            padding: 20px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }

        .navbar-brand h2 {
            color: white;
            font-size: 1.2em;
            line-height: 1.4;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 15px 25px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            margin: 8px 0;
            font-weight: 500;
            gap: 10px;
        }

        .navbar a i {
            width: 20px;
            text-align: center;
        }

        .navbar a:hover {
            background: rgba(255,255,255,0.1);
            padding-left: 30px;
        }

        .navbar a.active {
            background: #3498db;
        }

        /* Main Content Area */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
            background-color: #f5f7fb;
        }

        .profile-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 0 20px;
        }

        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h1 {
            color: #2c3e50;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .profile-details {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 20px;
            color: #2c3e50;
        }

        .profile-details .label {
            font-weight: 600;
            color: #3498db;
        }

        .profile-details .value {
            color: #666;
        }

        .profile-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .action-button {
            background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .action-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .session-expired {
            text-align: center;
            color: #e74c3c;
            padding: 20px;
            background-color: #f8d7da;
            border-radius: 10px;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .navbar {
                width: 70px;
                padding-top: 10px;
            }

            .navbar-brand {
                padding: 10px 5px;
            }

            .navbar-brand h2 {
                display: none;
            }

            .navbar a span {
                display: none;
            }

            .navbar a {
                padding: 15px;
                justify-content: center;
            }

            .navbar a:hover {
                padding-left: 15px;
            }

            .main-content {
                margin-left: 70px;
            }
        }
    </style>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirmation</title>
</head>
<body>
<%@ include file="touristnavbar.jsp" %>

<h3 style="text-align: center;"><u>Booking Confirmation</u></h3>

<!-- Show the confirmation details after form submission -->
<c:set var="spotId" value="${param.spotId}" />
<!-- Fetch Spot Information from backend (mocked for now) -->
<!-- You would fetch the spot details from your database using the spotId -->
<c:set var="spot" value="${spots[spotId]}" /> <!-- Mocked list for demonstration -->

<!-- Confirmation Message -->
<div style="text-align: center; margin-top: 30px;">
    <h4>Thank you for your booking, ${param.name}!</h4>
    <p>Your booking details are as follows:</p>
    <table style="margin-top: 20px; margin-left: auto; margin-right: auto;">
        <tr>
            <td><strong>Spot:</strong></td>
            <td><c:out value="${spot.spotname}"/></td>
        </tr>
        <tr>
            <td><strong>Country:</strong></td>
            <td><c:out value="${spot.country}"/></td>
        </tr>
        <tr>
            <td><strong>State:</strong></td>
            <td><c:out value="${spot.state}"/></td>
        </tr>
        <tr>
            <td><strong>Booking Date:</strong></td>
            <td><c:out value="${param.date}"/></td>
        </tr>
        <tr>
            <td><strong>Name:</strong></td>
            <td><c:out value="${param.name}"/></td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td><c:out value="${param.email}"/></td>
        </tr>
    </table>
    <p>Your booking has been successfully confirmed!</p>

    <!-- Optionally, you can provide a link to go back to the home page or the spot view page -->
    <div style="margin-top: 20px;">
        <button onclick="window.location.href='bookspots.jsp'">View All Spots</button>
        <button onclick="window.location.href='touristhome.jsp'">Go to Home</button>
    </div>
</div>

</body>
</html>
    
</head>
<body>
    <%
    // Check for session and tourist object
    Tourist tourist = null;
    boolean sessionValid = false;
    try {
        tourist = (Tourist) session.getAttribute("tourist");
        if (tourist != null) {
            sessionValid = true;
        }
    } catch (Exception e) {
        sessionValid = false;
    }

    // If session is invalid, redirect to session expiry page
    if (!sessionValid) {
        response.sendRedirect("touristsessionexpiry");
        return;
    }
    %>

    <% if (sessionValid) { %>
        <%@ include file="touristnavbar.jsp" %>

        <div class="main-content">
            <div class="profile-container">
                <div class="profile-card">
                    <div class="profile-header">
                        <h1>My Profile</h1>
                    </div>
                    
                    <div class="profile-details">
                        <div class="label">Tourist ID:</div>
                        <div class="value"><%= tourist.getId() %></div>
                        
                        <div class="label">Name:</div>
                        <div class="value"><%= tourist.getName() %></div>
                        
                        <div class="label">Gender:</div>
                        <div class="value"><%= tourist.getGender() %></div>
                        
                        <div class="label">Date of Birth:</div>
                        <div class="value"><%= tourist.getDateofbirth() %></div>
                        
                        <div class="label">Email:</div>
                        <div class="value"><%= tourist.getEmail() %></div>
                        
                        <div class="label">Contact:</div>
                        <div class="value"><%= tourist.getContact() %></div>
                    </div>

                    
                </div>
            </div>
        </div>
    <% } else { %>
        <div class="main-content">
            <div class="profile-container">
                <div class="session-expired">
                    <h2>Session Expired</h2>
                    <p>Your session has timed out. Please log in again.</p>
                    <a href="touristlogin" class="action-button">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </div>
            </div>
        </div>
    <% } %>
</body>
</html>