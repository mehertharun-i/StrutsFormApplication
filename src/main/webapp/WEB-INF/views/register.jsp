<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Secure User Registration</title>
</head>
<body>
	<h2>Register a New Account</h2>

	<s:actionerror cssStyle="color: red; font-weight: bold;" />

	<s:form action="register" method="post">
		<s:textfield name="fullname" label="Fullname" required="true" minlength="4" maxlength="30" title= "Username must be between 4 and 30 characters." />
		<s:password name="password" label="Password" required="true" minlength="8" pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one uppercase letter and one number." />
		<s:textfield name="email" label="Email ID" type="email" required="true" title="Please enter a valid email address." />
		<s:submit value="Register" />
	</s:form>
</body>
</html>