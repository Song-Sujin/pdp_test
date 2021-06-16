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
	
	<h1>temp Page</h1>
	
	<div>
		<button type="button" class="btn btn-primary" id="welcomeBtn">Welcome page</button>
	</div>
	<div>
		<button type="button" class="btn btn-primary" id="installerBtn">Installer page</button>
	</div>
	<div>
		<button type="button" class="btn btn-primary" id="dashboardBtn">Dashboard page</button>
	</div>
	<div>
		<button type="button" class="btn btn-primary" id="controlBtn">Service control page</button>
	</div>
	
	

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#welcomeBtn").click(function(){
			location.href="./welcome.do"
		});
		
		$("#installerBtn").click(function(){
			location.href="./login_ok_tmp.do"
		});
		
		$("#dashboardBtn").click(function(){
			location.href="./dashboard.do"
		});
		
		$("#controlBtn").click(function(){
			location.href="./control_tmp.do"
		});
		
	});
	
</script>
</body>

</html>
