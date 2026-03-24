<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
</head>
<body>
    <h1>Welcome <s:property value="username.contains('@') ? username.substring(0, username.indexOf('@')) : username"/>!</h1>
    <br/>
    <a href="showLogin.action">Logout</a>
</body>
</html>