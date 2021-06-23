<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Penta Data Platform</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Karla:400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet"  type="text/css" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/style2.css">
<script data-search-pseudo-elements="" defer="" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<meta charset="utf-8" />
</head>
<style>
	th, td {
		text-align: center;
	}

</style>
<body>
<nav class="navbar navbar-default mb-0 pb-0">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" id="sidebarCollapse" href="#">
          <h5><div class="logo">Penta PDP</div></h5>
        </a>
      </div>

      <div class="navbar-header">
        <a class="navbar-brand" id="sidebarCollapse" href="#">
          <h5>Login User</h5>
        </a>
      </div>

    </div>
  </nav>
<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar" class="">
      <ul class="list-unstyled components mb-5 mt-5">
        <li class="active">
          <a href="#"><span class="fa fa-home"></span> Home</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-user"></span> About</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-sticky-note"></span> Blog</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-cogs"></span> Services</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-paper-plane"></span> Contacts</a>
        </li>
      </ul>
    </nav>

    <div id="content" class="p-3 p-md-5">

      <div class="" style="height:90%;">

        <div class="container">
        
        <!-- 여기부터 -->
        <h2>Dashboard Page</h2>
	
		<%-- <div><span>${member.id }로 로그인 중</span></div>
		<div>
			<button type="button" class="btn btn-primary" id="signoutBtn">Sign out</button>
		</div> --%>
        
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
						<td><input type="text" class="btn btn-link serviceName" value="${service.service_name }"/></td>
						<td align="center" class="statusTxt">실행중</td>
						<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
						<td><button type="button" class="btn btn-success startBtn" value="${service.service_name }" disabled>start</button></td>
						<td><button type="button" class="btn btn-danger stopBtn" value="${service.service_name }">stop</button></td>
					</tr>
					</c:when>
					
					<c:when test="${service.install_ny eq 'y' && service.start_ny eq 'n'}">
					<tr>
						<td><input type="text" class="btn btn-link serviceName" value="${service.service_name }"/></td>
						<td align="center" class="statusTxt">설치완료</td>
						<td><button type="button" class="btn btn-primary installBtn" value="${service.service_name }" disabled>install</button></td>
						<td><button type="button" class="btn btn-success startBtn" value="${service.service_name }">start</button></td>
						<td><button type="button" class="btn btn-danger stopBtn" value="${service.service_name }" disabled>stop</button></td>
					</tr>
					</c:when>
					
					<c:when test="${service.install_ny eq 'n' && service.start_ny eq 'n'}">
					<tr>
						<td><input type="text" class="btn btn-link serviceName" value="${service.service_name }"/></td>
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
		
		<h3>Result Text</h3>
		<div>
			<textarea class="form-control resultTxt" rows="12" readonly>
			</textarea>
		</div>
        
          <!-- 여기부터 -->
          <%-- <h2 class="mb-4">DashBoard Monitoring</h2>
          <div class="row mb-4">
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart1" style="max-width: 500px;"></canvas>
                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart2" style="max-width: 500px;"></canvas>

                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart3" style="max-width: 500px;"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart4" style="max-width: 500px;"></canvas>
                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart5" style="max-width: 500px;"></canvas>
                </div>
              </div>
            </div>
            <div class="col-4">
              <div class="card">
                <div class="card-body">
                  <canvas id="chart6" style="max-width: 500px;"></canvas>
                </div>
              </div>
            </div>
          </div> --%>
        </div>


        <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> -->
      </div>

    </div>

  </div>
  
<footer class="footer">
  <p class="pt-3">
    Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved by PentaSystems
  </p>
</footer>

<script type="text/javascript">
	
	$(function() {
		
		// logout버튼 클릭 시
		$("#signoutBtn").click(function() {
			location.href="./logout.do";
		});
		
		// 서비스명 클릭 시
		$(".serviceName").click(function(){
			
			var service_name = $(this).val();
			
			location.href="./control.do?service_name=" + service_name;
		});
		
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
			
			// 로딩 이미지
			var loadingHtml = '<div id="loading" style="width: 100%; height: 100%; top: 0%; left: 0%; z-index: 1005;position: absolute; text-align:center;"> ';
		    loadingHtml += '<div class="loading_box" style="margin-top: 20%;"><img src="<c:url value="/resources/images/loading1.gif"/>"  /></div></div>';
			
			$.ajax({
				type : "GET",
				url : "./install.do",
				data : params,
				dataType: "JSON",
				async : true,
				success : function(data) {
					
					// 받아온 전체 리스트 돌리기
					for(var i=0;i<data.length;i++) {
						// 선택한 service_name과 일치할 경우 변경하기
						if(data[i].service_name == service_name) {
							if(data[i].install_ny == "y") {
								
								// install 버튼을 비활성화
								$(installBtn).attr("disabled", true);
								// 상태값 변경
								$(tds.eq(1)).text("설치완료");
								// start 버튼 활성화								
								$(tds.eq(3).children()).attr("disabled", false);
								
								// 해당하는 hadoop 서비스의 resultTxt를 뿌려주기
								$(".resultTxt").text("Start here\n" + data[i].result_txt + "\n\n");
								
							} else {
								console.log("변경 안됨");
							}
						}
					}
					
				},
				beforeSend : function() {
					// 로딩 이미지 보여주기 처리
					$("body").fadeTo("fast", 0.4).append(loadingHtml);
				},
				complete : function() {
					// 로딩 이미지 감추기 처리
					$("body").fadeTo("slow", 1).find("#loading").remove();
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
			
			// 로딩 이미지
			var loadingHtml = '<div id="loading" style="width: 100%; height: 100%; top: 0%; left: 0%; z-index: 1005;position: absolute; text-align:center;"> ';
		    loadingHtml += '<div class="loading_box" style="margin-top: 20%;"><img src="<c:url value="/resources/images/loading1.gif"/>"  /></div></div>';
			
			$.ajax({
				type : "GET",
				url : "./start.do",
				data : params,
				dataType: "JSON",
				async : true,
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
								
								// 해당하는 hadoop 서비스의 resultTxt를 뿌려주기
								$(".resultTxt").text("Start here\n" + data[i].result_txt + "\n\n");
							} else {
								console.log("변경 안됨");
							}
						}
					}
					
					//$(".resultTxt").text("START HERE\n" + data[data.length-1].resultTxt + "\n\n");
				},
				beforeSend : function() {
					// 로딩 이미지 보여주기 처리
					$("body").fadeTo("fast", 0.4).append(loadingHtml);
				},
				complete : function() {
					// 로딩 이미지 감추기 처리
					$("body").fadeTo("slow", 1).find("#loading").remove();
				},
				error : function(e) {
					alert("start errer" + e.responseText);
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
								$(tds.eq(1)).text("설치완료");
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2/dist/chart.min.js"></script> -->

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="./resources/js/chart.js"></script>
  <script type="text/javascript">
  (function($) {

    "use strict";

    var fullHeight = function() {

      $('.js-fullheight').css('height', $(window).height());
      $(window).resize(function(){
        $('.js-fullheight').css('height', $(window).height());
      });

    };
    fullHeight();

    $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
    });

  })(jQuery);
  </script>
</body>
</html>
