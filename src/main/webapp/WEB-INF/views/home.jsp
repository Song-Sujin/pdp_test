<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Penta Data Platform</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8" />
</head>
<body>
	
	<h1>Login Page</h1>

	<form method="post" action="${pageContext.request.contextPath }/login_ok.do">
		<div>Username</div>
		<div><input type="text" class="form-control" name="userName"></div>
		<div>Password</div>
		<div><input type="text" class="form-control" name="passWord"></div>
		<div><button type="submit" class="btn btn-primary">login</button></div>
	</form>

</body>
</html>
