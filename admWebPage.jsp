<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
  <title>Admin</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/button.css">
  <link rel="stylesheet" type="text/css" href="css/nav2.css">
  <link rel="stylesheet" type="text/css" href="css/navbutton.css">
  
</head>
<style>
  body{
	
	/* background-image:url("https://www.myfreetextures.com/wp-content/uploads/2014/11/waves-abstract-blue-background.jpg"); */
  background-image: url(https://t4.ftcdn.net/jpg/02/55/77/03/360_F_255770374_rbmJO9gkkIhMBcyVPc3iW016BCLDvcWc.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

a{
	font-size: 1.5rem;
	letter-spacing: 1px;
	font-weight: 600;
	
  }
</style>

<body onload="adminPortal()">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
          data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav"> -->
          <nav class="navbar">
            <ul class="nav-list">
                <li class="nav-item nav-item-home"><a href="index.html"><button class="nav-button">Home</button></a></li>
                
                <li class="nav-item nav-item-contact" ><a href="adminlogout.jsp"><button class="nav-button" style="width: 160px;">Log out</button></a></li>
            </ul>
        </nav>
          
    </div><!-- /.container-fluid -->
  </nav>
  
  <div class = "row ">
  <div class = "col-md-4">
  <h1>WELCOME,<br>
  <%=session.getAttribute("LoginUsername")!=null?session.getAttribute("LoginUsername"):"" %>
  </h1>
  </div>
  </div>
  <br><br><br>
  
  <a href="admProfile.jsp">
    <button class="my-button">My Profile</button><br><br><br>
  </a>
  <a href="admmanageApps.html">
    <button class="my-button">Manage Appointments</button><br><br><br>
  </a>

  <a href="admmakeAnn.html">
    <button class="my-button">Make an Announcement</button>
  </a>
  

  <footer>
    <div style="text-align: center; background-color: hsl(182, 100%, 35%);; color: rgb(0, 0, 0); font-family: 'Rubik',sans-serif; width: 100%; position: fixed;  bottom: 0;">
      ChildCareHQ &COPY; All Rights Reserved. <br>
    </div>
  </footer>
  <script type="text/javascript" src="js/main.js"></script>
</body>

</html>