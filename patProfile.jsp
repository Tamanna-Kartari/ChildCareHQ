<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="ConnectionFiles.ParentInterface"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>My Profile</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <link rel="stylesheet" href="styles.css">
</head>

<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    /* background: linear-gradient(to right, #3d6af1, #ca5bec); */
    background-image: url("https://www.roswellpark.org/sites/default/files/2020-10/adobestock_257046917.jpg");
     background-repeat: no-repeat;
    background-size: cover;
}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

h1 {
    margin: 0;
}

.profile-container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.profile-header {
    text-align: center;
}

.profile-picture {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 10px;
    border: 4px solid #fff;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.profile-name {
    margin: 0;
    color: #000000;
}

.profile-bio {
    font-style: italic;
    color: #000000;
    margin-top: 0;
}

.profile-details {
    list-style-type: none;
    padding: 0;
    margin-top: 20px;
}

.profile-details li {
    margin-bottom: 10px;
}

.profile-details strong {
    display: inline-block;
    width: 100px;
    color: #030303;
}

.profile-social {
    text-align: center;
    margin-top: 20px;
}

.profile-social img {
    width: 30px;
    margin: 0 10px;
    opacity: 0.6;
    transition: opacity 0.3s ease-in-out;
    filter: grayscale(100);
}
</style>
<body>
    <header>
        <h1>My Profile</h1>
    </header>
    <main>
    <%
    String id = session.getAttribute("LoginId").toString();
    Connection con = ParentInterface.con;
   Statement smt =  con.createStatement();
  ResultSet rs =  smt.executeQuery("select * from  patientsignup where status = 1 and id="+id);
  if(rs.next())
  {
   
    
    %>
        <div class="profile-container">
            <div class="profile-header">
                <img class="profile-picture" src="images/avatar.png" alt="Profile Picture">
                <h2 class="profile-name"><%=rs.getString("username") %></h2>
                <p class="profile-bio">Patient</p>
            </div>
            <ul class="profile-details">
                <li><strong>Email:</strong> <%=rs.getString("email") %></li>
                <li><strong>Address:</strong>  <%=rs.getString("address") %></li>
                <li><strong>Phone:</strong>  <%=rs.getString("phone") %></li>
            </ul>
            
        </div>
        <%
        
  }
  else
  {
	  
  }
        %>
    </main>
</body>
</html>
