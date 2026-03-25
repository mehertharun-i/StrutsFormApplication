<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
		/* Reset and general body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            text-align: center;
        }

        /* Heading styling */
        h2 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.05);
        }

        /* Anchor tag reset */
        a {
            text-decoration: none;
        }

        /* Modern button styling */
        .btn { 
            padding: 12px 32px; 
            margin: 10px; 
            cursor: pointer; 
            font-size: 16px; 
            font-weight: 600;
            color: #ffffff;
            background-color: #3182ce; /* Matches the registration button */
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        /* Hover and active effects for interactivity */
        .btn:hover {
            background-color: #2b6cb0;
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
        }

        .btn:active {
            transform: translateY(1px);
            box-shadow: 0 3px 6px rgba(50, 50, 93, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
    </style>
</head>
<body>
    <h2>Welcome to the Application</h2>
    <a href="showRegister.action"><button class="btn">Register</button></a>
    <a href="showLogin.action"><button class="btn">Login</button></a>
</body>
</html>