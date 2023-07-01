<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="ConnectionFiles.ParentInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	style="text/css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Medical Records</title>
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

/* Additional styles for readability */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	font-size: 16px;
	color: #333;
	background-image:
		url(https://www.roswellpark.org/sites/default/files/2020-10/adobestock_257046917.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<body>
	<div class="container">
		<table class="record-table" id="myTable">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Blood Group</th>
					<th scope="col">Medicine</th>
					<th scope="col">No. of Appointments</th>

				</tr>
			</thead>

			<tbody>
				<%
				
					Connection con = ParentInterface.con;
					Statement smt = con.createStatement();
					ResultSet rs = smt.executeQuery("select * from patientrecord where id =" + session.getAttribute("LoginId"));

					while (rs.next()) {
				%>

				<tr>
					<th scope="row"><%=rs.getInt("id")%></th>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("BloodGroup")%></td>
					<td><%=rs.getString("Medicine")%></td>
					<td><%=rs.getInt("NumberOfAppointments")%></td>

				</tr>
				<%
					}
					rs.close();
					smt.close();
				%>
			</tbody>
		</table>
	</div>
</body>
</html>