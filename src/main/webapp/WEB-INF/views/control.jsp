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

	<form method="post" action="${pageContext.request.contextPath }/installer9.do">
		
		<div><button type="submit" class="btn btn-primary">dashboard</button></div>
	</form>
	
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
									<td align="center" class="statusTxt">실행중</td>
									<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
									<td><button type="button" class="btn btn-success startBtn" value="${service.service_name }" disabled>start</button></td>
									<td><button type="button" class="btn btn-danger stopBtn" value="${service.service_name }">stop</button></td>
								</tr>
								</c:when>
								
								<c:when test="${service.install_ny eq 'y' && service.start_ny eq 'n'}">
								<tr>
									<td align="center">${service.service_name }</td>
									<td align="center" class="statusTxt">중지됨</td>
									<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
									<td><button type="button" class="btn btn-success startBtn" value="${service.service_name }">start</button></td>
									<td><button type="button" class="btn btn-danger stopBtn" value="${service.service_name }" disabled>stop</button></td>
								</tr>
								</c:when>
								
								<c:when test="${service.install_ny eq 'n' && service.start_ny eq 'n'}">
								<tr>
									<td align="center">${service.service_name }</td>
									<td align="center" class="statusTxt">미설치</td>
									<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }">install</button></td>
									<td><button type="button" class="btn btn-success startBtn" value="${service.service_name }" disabled>start</button></td>
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
		
		// install 버튼 클릭 시 
		$(document).on("click", ".installBtn", function() {
			var params = "service_name=" + $(this).val();
			
			// 현재 선택된 서비스명
			var service_name = $(this).val();
			// 방금 선택된 install 버튼
			var installBtn = $(this);
			var td = installBtn.parent();
			var tr = td.parent();
			
			// 현재 선택된 서비스의 td들
			var tds = tr.children();
			
			$.ajax({
				type : "GET",
				url : "./install.do",
				data : params,
				dataType: "JSON",
				async : false,
				success : function(data) {
					
					// 받아온 전체 리스트 돌리기
					for(var i=0;i<data.length;i++) {
						// 선택한 service_name과 일치할 경우 변경하기
						if(data[i].service_name == service_name) {
							if(data[i].install_ny == "y") {
								
								// install 버튼을 비활성화
								$(installBtn).attr("disabled", true);
								// 상태값 변경
								$(tds.eq(1)).text("중지됨");
								// start 버튼 활성화								
								$(tds.eq(3).children()).attr("disabled", false);
								
							} else {
								console.log("변경 안됨");
							}
						}
					}
					
				},
				error : function(e) {
					alert("errer" + e.responseText);
				}
			});
			
		});
		
		// start 버튼 클릭 시
		$(document).on("click", ".startBtn", function() {
			
			var params = "service_name=" + $(this).val();
			var service_name = $(this).val();
			
			var startBtn = $(this);
			var td = startBtn.parent();
			var tr = td.parent();
			
			var tds = tr.children();
			
			$.ajax({
				type : "GET",
				url : "./start.do",
				data : params,
				dataType: "JSON",
				async : false,
				success : function(data) {
					
					// 받아온 전체 리스트 돌리기
					for(var i=0;i<data.length;i++) {
						// 선택한 service_name과 일치할 경우 변경하기
						if(data[i].service_name == service_name) {
							if(data[i].start_ny == "y") {
								
								console.log(tds);
								// start 버튼을 비활성화
								$(startBtn).attr("disabled", true);
								// 상태값 변경
								$(tds.eq(1)).text("실행중");
								// stop 버튼 활성화								
								$(tds.eq(4).children()).attr("disabled", false);
								
							} else {
								console.log("변경 안됨");
							}
						}
					}
					
				},
				error : function(e) {
					alert("errer" + e.responseText);
				}
			});
			
		});
		
		// stop 버튼 클릭 시
		$(document).on("click", ".stopBtn", function() {
			var params = "service_name=" + $(this).val();
			var service_name = $(this).val();
			
			var stopBtn = $(this);
			var td = stopBtn.parent();
			var tr = td.parent();
			
			var tds = tr.children();
			
			$.ajax({
				type : "GET",
				url : "./stop.do",
				data : params,
				dataType: "JSON",
				async : false,
				success : function(data) {
					
					// 받아온 전체 리스트 돌리기
					for(var i=0;i<data.length;i++) {
						// 선택한 service_name과 일치할 경우 변경하기
						if(data[i].service_name == service_name) {
							if(data[i].start_ny == "n") {
								
								// stop 버튼을 비활성화
								$(stopBtn).attr("disabled", true);
								// 상태값 변경
								$(tds.eq(1)).text("중지됨");
								// start 버튼 활성화								
								$(tds.eq(3).children()).attr("disabled", false);
								
							} else {
								console.log("변경 안됨");
							}
						}
					}
					
				},
				error : function(e) {
					alert("errer" + e.responseText);
				}
			});
			
		});
		
	});
	
	
	
</script>
</body>
</html>
