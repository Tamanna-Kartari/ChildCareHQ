<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="ConnectionFiles.ParentInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Patients</title>
<link rel="stylesheet" href="style.css">
</head>

<style>
.container {
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
	font-size: 20px;
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

h2 {
	padding-left: 10px;
}

h2, h3 {
	color: black;
}

.record-table {
	width: 107%;
	border-collapse: collapse;
	margin-top: 20px;
}

.record-table th, .record-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.record-table th {
	background-color: #f8f9fa;
	font-weight: bold;
}

.record-table td {
	vertical-align: top;
	background-color: #f8f9fa;
	opacity: 0.7;
	color: black;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	font-size: 16px;
	color: #333;
	background-image: url(images/yojima.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<body>
	<header>
	<h1>My Patients</h1>
	</header>
	<h2>Welcome Doctor</h2>
	<div class="container">
		<table class="record-table">
			<h3>My Patients :</h3>
			<tr>
				<th>Sr. no.</th>
				<th>Patient Name</th>
				<th>Date &amp; Time of Appointment</th>
				<th>Cause of Appointment</th>
				<th>Fees Paid</th>
				<th>Status</th>
			</tr>
			
			<%
			Connection con = ParentInterface.con; 
			Statement smt =con.createStatement(); 
			ResultSet rs = smt.executeQuery("select * from patientrecord where id =" + session.getAttribute("LoginId")); 
			while(rs.next()) 
			{
			 %>
			<tr>
				<td>1</td>
				<td>Paras Dongre</td>
				<td>April 16, 2023 at 10:30 AM</td>
				<td>Fever and cough</td>
				<td>300 Rs</td>
				<td>Done</td>
			</tr>
			
			<%
					}
					rs.close();
					smt.close();
			%>
			
			<tr>
				<td>2</td>
				<td>Harshal Yadav</td>
				<td>April 17, 2023 at 2:00 PM</td>
				<td>Check-up</td>
				<td>250 Rs</td>
				<td>Done</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Om Tayde</td>
				<td>April 25, 2023 at 11:00 AM</td>
				<td>Common cold</td>
				<td>-</td>
				<td>-</td>
			</tr>
		</table>
	</div>
</body>
</html>
