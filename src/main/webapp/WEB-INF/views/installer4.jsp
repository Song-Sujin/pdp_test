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
          <a href="#" class="disable"> 5. Assign Masters</a>
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
      <form method="post" action="${pageContext.request.contextPath }/installer4.do">
      <div class="">
        <h2 class="mb-3">Choose File System</h2>
        <div class="mb-2">
          Choose which file system you want to install on your cluster.
        </div>
        <table class="table  table-striped">
          <thead>
            <tr>
              <th scope="col">Service</th>
              <th scope="col">Version</th>
              <th scope="col">Description</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">HDFS</label>
                </div>
              </th>
              <td>3.1.1.3.1</td>
              <td>Apache Hadoop Distributed File System</td>
            </tr>

          </tbody>
        </table>



        <h2 class="mb-3">Choose Services</h2>
        <div class="mb-2">
          Choose which services you want to install on your cluster.
        </div>
        <table class="table  table-striped">
          <thead>
            <tr>
              <th scope="col">Service</th>
              <th scope="col">Version</th>
              <th scope="col">Description</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">YARN + MapReduce2</label>
                </div>
              </th>
              <td>3.1.0</td>
              <td>Apache Hadoop NextGen MapReduce (YARN)</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">Tez</label>
                </div>
              </th>
              <td>0.9.0.3.1</td>
              <td>Tez is the next generation Hadoop Query Processing framework written on top of YARN</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">Hive</label>
                </div>
              </th>
              <td>3.0.0.3.1</td>
              <td>Data warehouse system for ad-hoc queries & analysis of large datasets and table & storage management service</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">HBase</label>
                </div>
              </th>
              <td>2.0.0.3.1</td>
              <td>Non-relational distrivuted database and centralized service for configuration management & synchronization</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">pig</label>
                </div>
              </th>
              <td>0.16.1.3.1</td>
              <td>Scripting platform for analyzing large datasets</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">Sqoop</label>
                </div>
              </th>
              <td>1.4.7</td>
              <td>Tool for transferring bulk data between Apache Hadoop and structured data stores such as relational databases</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">Oozie</label>
                </div>
              </th>
              <td>4.4.0</td>
              <td>System for workflow coordination and execution of Apache Hadoop jobs. This also includes the installation of the optional Oozie Web Console which relies on and will install the ExtJS Library.</td>
            </tr>

            <tr>
              <th scope="row">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                  <label class="form-check-label" for="inlineCheckbox1">Zookeeper</label>
                </div>
              </th>
              <td>3.4.9.3.1</td>
              <td>Centralized service which provides highly reliable distributed coordination</td>
            </tr>

            
          </tbody>
        </table>

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
