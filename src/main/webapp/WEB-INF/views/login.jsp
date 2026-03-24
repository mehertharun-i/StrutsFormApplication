<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure User Login</title>
    <script type="text/javascript">
        // Show pop-up if redirected from successful registration
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('regSuccess') === 'true') {
                alert("Successfully registered.");
            }
        };
    </script>
</head>
<body>
    <h2>Login to Your Account</h2>

    <s:actionerror cssStyle="color: red; font-weight: bold;" />

    <s:form action="login" method="post">
        <s:textfield name="email" label="Email ID" required="true" type="email" title="Please enter a valid email address." />
        <s:password name="password" label="Password" required="true" minlength="8" pattern="(?=.*\d)(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one uppercase letter and one number."  />
        <s:submit value="Login" />
    </s:form>
    
    <br/>
    <p>Don't have an account? <a href="showRegister.action">Register here</a></p>
</body>
</html>