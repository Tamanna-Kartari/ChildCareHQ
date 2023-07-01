<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Patient</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/button.css">
  <link rel="stylesheet" type="text/css" href="css/nav2.css">
  <link rel="stylesheet" type="text/css" href="css/navbutton.css">


  <script type="text/javascript" src="js/main.js"></script>
</head>
<style>
body
{
    background-image:url("https://www.roswellpark.org/sites/default/files/2020-10/adobestock_257046917.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

a
{
	font-size: 2rem;
	letter-spacing: 1px;
	font-weight: 600;
}
</style>

<body onload="patientPortal()">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
          data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <nav class="navbar">
        <ul class="nav-list">
            <li class="nav-item nav-item-home"><a href="index.html"><button class="nav-button">Home</button></a></li>
           
            <li class="nav-item nav-item-contact" ><a href="patientlogout.jsp"><button  class="nav-button" style="width: 160px;">Log out</button></a></li>
        </ul>
    </nav>

    </div>
  </nav>
<!-- 
  <div class="container">
    <h2 id="wel">WELCOME <%=session.getAttribute("LoginUsername")!=null?session.getAttribute("LoginUsername"):"" %>
    </h2>
  </div><br>
   -->
  <div class = "row ">
  <div class = "col-md-4">
  <h1>WELCOME,<br>
  <%=session.getAttribute("LoginUsername")!=null?session.getAttribute("LoginUsername"):"" %>
  </h1>
  </div>
  </div>
  <br><br><br>
  
<a href="patProfile.jsp">
  <button class="my-button">My Profile</button><br><br><br>
</a>
<a href="patbookapp.jsp">
  <button class="my-button">Book Appointment</button><br><br><br>
</a>
<a href="patmedrecord.jsp">
  <button class="my-button">My Medical Record</button>
</a>

</body>
<jsp:include page="zfooter.jsp"/>

</html>