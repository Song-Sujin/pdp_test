<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Penta Data Platform</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Karla:400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet"  type="text/css" href="./resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8" />
</head>
<body>
	
	<%-- <h1>Login Page</h1>
	
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
	</c:if> --%>
	<main>
    <div class="container-fluid">
      <div class="row">
        <div class="col-6 login-section-wrapper">
          <div class="brand-wrapper">
            <!-- <img src="assets/images/logo.svg" alt="logo" class="logo"> -->
            <!-- <img src="./asset/main_logo.png" alt="logo" class="logo"> -->
            <img src="./resources/images/penta_systems_horizontal.svg" alt="logo" class="logo" style="height: 100%;">
          </div>
          <div class="login-wrapper my-auto">
            <h1 class="login-title">Log in</h1>
            <form action="#!">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="email@example.com">
              </div>
              <div class="form-group mb-4">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="enter your passsword">
              </div>
              <a href="./dashboard.do">
              <input name="login" id="login" class="btn btn-block login-btn" type="button" value="Login">
              </a>
            </form>
            <a href="#!" class="forgot-password-link">Forgot password?</a>
            <p class="login-wrapper-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
          </div>
        </div>
        <div class="col-6 px-0 d-none d-sm-block">
          <img src="./resources/images/main_img.jpg" alt="login image" class="login-img">
          <p class="text-white font-weight-medium text-right flex-grow align-self-end footer-link">
            Contact <a href="https://www.bootstrapdash.com/" target="_blank" class="text-white">Pentasystem</a>
          </p>
        </div>
      </div>
    </div>
  </main>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>

</html>
