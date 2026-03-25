<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0); 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success - Text Compare</title>
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* Header alignment: Welcome left, Logout right */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #ffffff;
            border-bottom: 2px solid #ddd;
        }
        
        .header h1 {
            margin: 0;
            color: #333;
        }

        .logout-link {
            text-decoration: none;
            padding: 8px 16px;
            background-color: #dc3545;
            color: white;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .logout-link:hover {
            background-color: #c82333;
        }

        /* Container for the comparator tool */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        /* Message formatting: Centered above text areas */
        #resultMessage {
            text-align: center;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 20px;
            min-height: 25px; /* Prevents layout shifting when empty */
        }

        /* Layout for textareas and button */
        .compare-section {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px; /* Gap between the elements */
        }

        /* 4x6 ratio sizing */
        textarea {
            width: 400px;
            height: 600px; 
            padding: 15px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .compare-btn {
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .compare-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Welcome <s:property value="fullname"/>!</h1>
        <a href="showLogin.action" class="logout-link">Logout</a>
    </div>

    <div class="container">
        <div id="resultMessage"></div>

        <form class="compare-section" onsubmit="event.preventDefault(); compareTexts();">
            <textarea id="text1" required placeholder="Enter the first text here..."></textarea>
            
            <button type="submit" class="compare-btn">Compare</button>
            
            <textarea id="text2" required placeholder="Enter the second text here..."></textarea>
        </form>
    </div>

    <script>
        function compareTexts() {
            // Get values from the textareas (Validation is now handled by HTML)
            var text1 = document.getElementById("text1").value.toLowerCase().normalize();
            var text2 = document.getElementById("text2").value.toLowerCase().normalize();
            var resultMessage = document.getElementById("resultMessage");

            // Compare the text and set message/color accordingly
            if (text1 === text2) {
                resultMessage.innerText = "Both texts are the same";
                resultMessage.style.color = "green";
            } else {
                resultMessage.innerText = "Both texts are different";
                resultMessage.style.color = "red";
            }
        }
    </script>
</body>
</html>