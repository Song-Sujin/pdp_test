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
          <a href="#" class="disable"> 6. Assign Slaves and Clients</a>
        </li>
        <li>
          <a href="#" class="disable"> 7. Customize Services</a>
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
      <form method="post" action="${pageContext.request.contextPath }/installer5.do">
      <div class="" style="height:100%;">

        <h2 class="mb-4">Assign Masters</h2>
        <p>
          Assign master components to hosts you want to run them on.
        </p>



        <div class="card">
          <div class="card-body">

            <div class="mr-3" style="align-self: center;">
              <b>SNameNode : </b>
            </div>
            <div class="btn-group mb-5" role="group" style="width:80%;">

              <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                original.localdomain(31.3 GB, 1 cores)
              </button>
              <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width:80%;">
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
              </ul>

            </div>


            <div class="mr-3" style="align-self: center;">
              <b>NameNode : </b>
            </div>
            <div class="btn-group mb-5" role="group" style="width:80%;">
              <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                original.localdomain(31.3 GB, 1 cores)
              </button>
              <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width:80%;">
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
              </ul>

            </div>


            <div class="mr-3" style="align-self: center;">
              <b>Zookeeper Server : </b>
            </div>
            <div class="btn-group mb-5" role="group" style="width:80%;">
              <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                original.localdomain(31.3 GB, 1 cores)
              </button>
              <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width:80%;">
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
              </ul>

            </div>

            <div class="mr-3" style="align-self: center;">
              <b>Metrics Collector : </b>
            </div>
            <div class="btn-group mb-5" role="group" style="width:80%;">
              <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                original.localdomain(31.3 GB, 1 cores)
              </button>
              <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width:80%;">
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
              </ul>

            </div>

            <div class="mr-3" style="align-self: center;">
              <b>Grafana : </b>
            </div>
            <div class="btn-group mb-5" role="group" style="width:80%;">
              <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                original.localdomain(31.3 GB, 1 cores)
              </button>
              <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width:80%;">
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
                <li class="dropdown-item">  original.localdomain(31.3 GB, 1 cores)</li>
              </ul>

            </div>
          </div>
        </div>

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
