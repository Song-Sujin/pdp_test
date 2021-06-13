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
	
	<c:if test="${member == null }">
		<form method="post" id="loginForm" action="${pageContext.request.contextPath }/login_ok.do">
			<div>Username</div>
			<div><input type="text" class="form-control" id="id" name="id"></div>
			<div>Password</div>
			<div><input type="password" class="form-control" id="pw" name="pw"></div>
			<div><button type="button" class="btn btn-primary" id="signinBtn">Sign in</button></div>
		</form>
	</c:if>
	<c:if test="${member != null }">
		<div><span>${member.id }로 로그인 중</span></div>
		<div>
			<button type="button" class="btn btn-primary" id="signoutBtn">Sign out</button>
		</div>
	</c:if>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#signinBtn").click(function() {
			
			if($("#id").val()=="" || $("#pw").val()=="") {
				alert("모든 항목을 입력해 주세요.");
				return;
			}
			
			$("#loginForm").submit();
			
		});
		
		$("#signoutBtn").click(function() {
			location.href="./logout.do";
		});
		
	});
	
</script>
</body>

</html>
