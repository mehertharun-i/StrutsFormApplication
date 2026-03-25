<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Secure User Registration</title>
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
    }

    /* Form container styling */
    form {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        box-sizing: border-box;
    }

    h2 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 25px;
        margin-top: 0;
    }

    /* Targeting Struts2 default table rendering */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        display: block;
        width: 100%;
        padding: 0;
    }

    /* Label styling */
    td.tdLabel {
        text-align: left;
        padding-bottom: 5px;
        padding-top: 15px;
    }

    td.tdLabel label {
        font-weight: 600;
        color: #4a5568;
        font-size: 14px;
    }

    /* Input field styling */
    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cbd5e0;
        border-radius: 6px;
        font-size: 15px;
        color: #2d3748;
        box-sizing: border-box;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #4299e1;
        outline: none;
        box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.2);
    }

    /* Submit button styling */
    td[colspan="2"] {
        padding-top: 25px !important;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #3182ce;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #2b6cb0;
    }
    
    /* Error message spacing */
    .errorMessage {
        text-align: center;
        margin-bottom: 15px;
        display: block;
    }
</style>
</head>
<body>
	<h2>Register a New Account</h2>

	<s:actionerror cssStyle="color: red; font-weight: bold; text-align: center; margin-bottom: 15px; list-style-type: none; padding: 0;" />

	<s:form action="register" method="post">
		<s:textfield name="fullname" label="Fullname" required="true" minlength="4" maxlength="30" pattern="[a-zA-Z ]+" title= "Full Name must be Character value only and between 4 and 30 characters." />
		<s:textfield name="email" label="Email ID" type="email" required="true" title="Please enter a valid email address." />
		<s:password name="password" label="Password" required="true" minlength="8" pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one uppercase letter and one number." />
		<s:submit value="Register" />
	</s:form>
</body>
</html>