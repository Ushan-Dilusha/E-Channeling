<%@page import="dB.DoctorDB"%>
<%@page import="dB.AppointmentDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
</head>
<body>
	<%@include file="CheckUser.jsp" %>
	<%@include file="user_header.jsp" %>
<h2>My Appointments</h2>
<div class="m-5">
		<table class="table align-middle mb-0 bg-white ">
			<thead class="bg-light">
			<tr>
				<th>Appintment Id</th>
				<th>Doctor</th>
				<th>Doctor specialization</th>
				<th>date</th>
				<th>Name</th>
				<th>age</th>
				<th>contact</th>
				<th>address</th>
				<th>gender</th>
				<th>Status</th>
				<th>time</th>
				<th></th>
				</tr>
			</thead>
			<%
			AppointmentDB Adb = new AppointmentDB();
			String id = "" + session.getAttribute("userId");
			ResultSet ars = Adb.getAllDetails(id);
			while (ars.next()) {
			%>
			<tr>
				<td><%=ars.getInt("id")%></td>
				<td><%=ars.getString("name")%></td>
				<td><%=ars.getString("specialization")%></td>
				<td><%=ars.getString("date")%></td>
				<td><%=ars.getString("username")%></td>
				<td><%=ars.getString("age")%></td>
				<td><%=ars.getString("contact")%></td>
				<td><%=ars.getString("address")%></td>
				<td><%=ars.getString("gender")%></td>
				<td><%=ars.getString("status")%></td>
				<td><%=ars.getString("time")%></td>

				<td>
					<form method="POST" action="<%=request.getContextPath()%>/Appointment">
						<input type="text" name="id" value="<%=ars.getInt("id")%>" hidden=true />
						<input type="submit" name="edit" value="Edit Appointment" class="btn btn-outline-primary" />
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		</div>
</body>
</html>