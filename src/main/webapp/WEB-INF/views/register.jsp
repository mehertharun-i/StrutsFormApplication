<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Secure User Registration</title>
</head>
<body>
	<h2>Register a New Account</h2>

	<s:actionerror />

	<s:form action="register" method="post">
		<s:textfield name="username" label="Username" />
		<s:password name="password" label="Password" />
		<s:textfield name="email" label="Email Address" />
		<s:submit value="Register" />
	</s:form>
</body>
</html>