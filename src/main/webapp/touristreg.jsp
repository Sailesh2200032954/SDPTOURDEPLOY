<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourist Registration</title>
    <style> 
* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f2fe 0%, #f0f9ff 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
            color: #0f172a;
        }

        /* Navbar Styles */
        .navbar {
            width: 100%;
            background: linear-gradient(to right, #0284c7, #0ea5e9);
            padding: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-weight: 500;
            margin: 0 0.5rem;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-1px);
        }

        /* Page Title */
        h2 {
            color: #0c4a6e;
            font-size: 2.2rem;
            margin: 6rem 0 1rem 0;
            font-weight: 700;
            text-align: center;
        }

        h2 u {
            text-decoration: none;
            border-bottom: 4px solid #0ea5e9;
            padding-bottom: 5px;
        }

        /* Message Styles */
        .message {
            margin: 1rem auto;
            text-align: center;
            padding: 0.8rem;
            border-radius: 10px;
            font-weight: 500;
            width: 100%;
            max-width: 600px;
        }

        .message.error {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .message.success {
            background-color: #d1fae5;
            color: #047857;
        }

        /* Form Container */
        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
                        0 2px 4px -1px rgba(0, 0, 0, 0.06);
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-container table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 1.2rem;
        }

        .form-container label {
            color: #334155;
            font-weight: 500;
            font-size: 1rem;
            display: block;
            margin-bottom: 0.5rem;
        }

        /* Input Fields */
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"],
        .form-container input[type="date"],
        .form-container input[type="number"] {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8fafc;
        }

        .form-container input:focus {
            outline: none;
            border-color: #0ea5e9;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.1);
        }

        /* Radio Buttons */
        .form-container input[type="radio"] {
            margin-right: 0.5rem;
        }

        /* Button Styles */
        .button-container {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 1rem;
        }

        .form-container input[type="submit"],
        .form-container input[type="reset"] {
            padding: 0.75rem 1.5rem;
            border-radius: 10px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .form-container input[type="submit"] {
            background-color: #0284c7;
            color: white;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0369a1;
        }

        .form-container input[type="reset"] {
            background-color: #f1f5f9;
            color: #475569;
        }

        .form-container input[type="reset"]:hover {
            background-color: #e2e8f0;
        }

        /* Responsive Design */
        @media (max-width: 640px) {
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            h2 {
                font-size: 1.8rem;
            }

            .button-container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>

    <h2><u>Tourist Registration</u></h2>

    <!-- Display dynamic message from session -->
    <% 
        String message = (String) session.getAttribute("message");
        String messageType = (String) session.getAttribute("messageType");
        if (message != null && messageType != null) {
    %>
        <div style="text-align: center; margin: 1rem auto; padding: 0.8rem; border-radius: 10px; font-weight: 500; width: 100%; max-width: 600px; background-color: <%= "error".equals(messageType) ? "#fee2e2" : "#d1fae5" %>; color: <%= "error".equals(messageType) ? "#b91c1c" : "#047857" %>;">
            <%= message %>
        </div>
    <% 
            session.removeAttribute("message");
            session.removeAttribute("messageType");
        } 
    %>

    <div style="background: white; padding: 2.5rem; border-radius: 20px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); width: 100%; max-width: 600px; margin: 0 auto;">
        <form method="post" action="inserttourist">
            <table style="width: 100%; border-collapse: separate; border-spacing: 0 1.2rem;">
                <tr>
                    <td><label for="ename">Enter Name</label></td>
                    <td><input type="text" id="ename" name="ename" placeholder="Full Name" required style="width: 100%; padding: 0.75rem 1rem; border: 2px solid #e2e8f0; border-radius: 10px; font-size: 1rem;"/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="egender" value="MALE" required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="egender" value="FEMALE" required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="egender" value="OTHERS" required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="edob">Enter Date of Birth</label></td>
                    <td><input type="date" id="edob" name="edob" required style="width: 100%; padding: 0.75rem 1rem; border: 2px solid #e2e8f0; border-radius: 10px; font-size: 1rem;"/></td>
                </tr>
                <tr>
                    <td><label for="eemail">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="eemail" placeholder="example@example.com" required style="width: 100%; padding: 0.75rem 1rem; border: 2px solid #e2e8f0; border-radius: 10px; font-size: 1rem;"/></td>
                </tr>
                <tr>
                    <td><label for="epwd">Enter Password</label></td>
                    <td><input type="password" id="epwd" name="epwd" placeholder="Password" required style="width: 100%; padding: 0.75rem 1rem; border: 2px solid #e2e8f0; border-radius: 10px; font-size: 1rem;"/></td>
                </tr>
                <tr>
                    <td><label for="econtact">Enter Contact</label></td>
                    <td><input type="number" id="econtact" name="econtact" placeholder="1234567890" required style="width: 100%; padding: 0.75rem 1rem; border: 2px solid #e2e8f0; border-radius: 10px; font-size: 1rem;"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Register" style="padding: 0.75rem 1.5rem; border-radius: 10px; font-weight: 500; font-size: 1rem; background-color: #0284c7; color: white; border: none; cursor: pointer; margin-right: 10px;"/>
                        <input type="reset" value="Clear" style="padding: 0.75rem 1.5rem; border-radius: 10px; font-weight: 500; font-size: 1rem; background-color: #f1f5f9; color: #475569; border: none; cursor: pointer;"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
