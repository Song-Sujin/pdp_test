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
	
	<h1>Dashboard Page</h1>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>서비스명</th>
			</tr>
		</thead>
		<tbody>
			<%-- 조회 결과에 따른 반복 처리 --%>
			<c:forEach var="service" items="${services }">
				<tr>
					<td><button type="button" class="btn btn-link serviceName" value="${service.service_name }">${service.service_name }</button></td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
<script type="text/javascript">
	
	$(function() {
		
		$(".serviceName").click(function(){
			alert("버튼 클릭");
			location.href="/control.do";
		});
	});

</script>

</body>
</html>
