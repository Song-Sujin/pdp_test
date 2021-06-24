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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Karla:400,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet"  type="text/css" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/style2.css">
<script data-search-pseudo-elements="" defer="" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<meta charset="utf-8" />
</head>
<body>
  <div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar" class="">
      <button type="button" id="sidebarCollapse" class="btn btn-primary test"><h5 class="logo">Penta PDP</h5></button>
      <ul class="list-unstyled components mb-5">
        <li class="active">
          <a href="#"> 0. Get Started</a>
        </li>
        <li>
          <a href="#"> 1. Select Version</a>
        </li>
        <li>
          <a href="#" > 2. Install Options</a>
        </li>
        <li>
          <a href="#" > 3. Confirm Hosts</a>
        </li>
        <li>
          <a href="#" > 4. Choose Services</a>
        </li>
        <li>
          <a href="#" > 5. Assign Masters</a>
        </li>
        <li>
          <a href="#" > 6. Assign Slaves and Clients</a>
        </li>
        <li>
          <a href="#" > 7. Customize Services</a>
        </li>
        <li>
          <a href="#" class="disable"> 8. Review</a>
        </li>
        <li>
          <a href="#" class="disable"> 9. Install,Start and Test</a>
        </li>
        <li>
          <a href="#" class="disable"> 10. Summary</a>
        </li>
      </ul>

    </nav>

    <div id="content" class="p-3 p-md-5">
      <form method="post" action="${pageContext.request.contextPath }/installer7.do">
      <div class="" style="height:90%;">
        <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-primary">
        <i class="fa fa-bars"></i>
        <span class="sr-only">Toggle Menu</span>
      </button>
      <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <i class="fa fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="nav navbar-nav ml-auto">
    <li class="nav-item active">
    <a class="nav-link" href="#">Home</a>
  </li>
  <li class="nav-item">
  <a class="nav-link" href="#">About</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#">Portfolio</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#">Contact</a>
</li>
</ul>
</div>
</div>
</nav> -->
<h2 class="mb-4">Sidebar #07</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
      <div class="d-flex justify-content-between">
        <a href="#"><button class="btn btn-secondary" type="button" name="button">cancle</button></a>
        <button class="btn btn-success" type="submit" name="button">next</button>
      </div>
      </form>
    </div>

  </div>
  <footer class="footer">
    <p class="pt-3">
      Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved by PentaSystems
    </p>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
