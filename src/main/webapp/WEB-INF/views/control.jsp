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
<style>
	th, td {
		text-align: center;
	}	
</style>
<body>
	<h1>Control</h1>

	<c:forEach var="service" items="${services }">
		<li class="service">${service.service_name }</li>
	</c:forEach>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>서비스명</th>
								<th>상태</th>
								<th>설치</th>
								<th>시작</th>
								<th>중지</th>
							</tr>
						</thead>
						<tbody>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="service" items="${services }">
							
							<c:choose>
							
								<c:when test="${service.install_ny eq 'y' && service.start_ny eq 'y'}">
								<tr>
									<td align="center">${service.service_name }</td>
									<td align="center" id="strStatus">실행중</td>
									<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
									<td><button type="button" class="btn btn-success startBtn" id="strStart" value="${service.service_name }" disabled>start</button></td>
									<td><button type="button" class="btn btn-danger stopBtn" id="strStop" value="${service.service_name }">stop</button></td>
								</tr>
								</c:when>
								
								<c:when test="${service.install_ny eq 'y' && service.start_ny eq 'n'}">
								<tr>
									<td align="center">${service.service_name }</td>
									<td align="center" id="stpStatus">중지됨</td>
									<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
									<td><button type="button" class="btn btn-success startBtn" id="stpStart" value="${service.service_name }">start</button></td>
									<td><button type="button" class="btn btn-danger stopBtn" id="stpStop" value="${service.service_name }" disabled>stop</button></td>
								</tr>
								</c:when>
								
								<c:when test="${service.install_ny eq 'n' && service.start_ny eq 'n'}">
								<tr>
									<td align="center">${service.service_name }</td>
									<td align="center" id="insStatus">미설치</td>
									<td><button type="button" class="btn btn-primary installBtn" id="insInstall" value="${service.service_name }">install</button></td>
									<td><button type="button" class="btn btn-success startBtn" id="insStart" value="${service.service_name }" disabled>start</button></td>
									<td><button type="button" class="btn btn-danger stopBtn" value="${service.service_name }" disabled>stop</button></td>
								</tr>
								</c:when>
							
							</c:choose>
							
							</c:forEach>
							
						</tbody>
					</table>
					
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

	$(function() {
		
		listAjax();
		
		$(document).on("click", ".installBtn", function() {
			alert("install Btn 클릭");
			var params = "service_name=" + $(this).val();
			alert(params);
			
			$.ajax({
				type : "GET",
				url : "./install.do",
				data : params,
				dataType: "JSON",
				async : true,
				cache : false,
				success : function(data) {
					
					if(data.install_ny == "y") {
						
						
					} else {
						alert("실패");
					}
					
				},
				error : function(e) {
					alert("errer" + e.responseText);
				}
			});
			
		});
		
		
		
	});
	
	function listAjax() {
		
		$.ajax({
			type : "GET",
			url : "./control.do",
			success : function(data) {
				alert("리스트 ajax");
				
			},
			error : function(e) {
				alert("errer" + e.responseText);
			}
		});
		
	}
	
	
	
</script>
</body>
</html>
