<%@page import="dB.DoctorAppointmentDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Doctor Home</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 400px;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<%@include file="doctor_header.jsp" %>

<section class="main background" style="min-height:100vh">
	<%
	if (session.getAttribute("DoctorId") == null) {
		response.sendRedirect("DoctorLogin.jsp");
	}

	DoctorAppointmentDB Ddb = new DoctorAppointmentDB();
	String id = "" + session.getAttribute("DoctorId");
	%>

	<div align="center">
		<h2>My Appointment Requests</h2>
<div  class="m-5">
		<table class="table align-middle mb-0 bg-white ">
			<tr  class="bg-light">
				<th>Appintment Id</th>
				<th>date</th>
				<th>Patient Name</th>
				<th>age</th>
				<th>contact</th>
				<th>address</th>
				<th>gender</th>
				<th>Status</th>
				<th>time</th>
				<th></th>
			</tr>
			<%
			ResultSet ars = Ddb.getAllDetails(id);
			while (ars.next()) {
			%>
			<tr>
				<td><%=ars.getInt("id")%></td>
				<td><%=ars.getString("date")%></td>
				<td><%=ars.getString("username")%></td>
				<td><%=ars.getString("age")%></td>
				<td><%=ars.getString("contact")%></td>
				<td><%=ars.getString("address")%></td>
				<td><%=ars.getString("gender")%></td>
				<td><%=ars.getString("Status")%></td>
				<td><%=ars.getString("time")%></td>

				<td>
					<%
					if (ars.getString("Status").equals("Pending...")) {
					%>

					<button onclick="myFunction(''+ <%=ars.getInt("id")%> +'')" class="btn btn-outline-secondary">Confirm
						Appointment</button> <%
 } else {
 %>

					<button onclick="myFunction(''+ <%=ars.getInt("id")%> +'')"
						disabled>Confirm Appointment</button> <%
 }
 %>
				</td>
			</tr>
			<%
			}
			%>
		</table>
</div>
		<h2>My Appointments</h2>
<div class="m-5">
		<table class="table align-middle mb-0 bg-white ">
			<tr class="bg-light">
				<th>Appintment Id</th>
				<th>time</th>
				<th>Status</th>
				<th></th>
			</tr>
			<%
			ResultSet ar = Ddb.getAllAppointments(id);
			while (ar.next()) {
			%>
			<tr>
				<td><%=ar.getString("appintmentid")%></td>
				<td><%=ar.getString("time")%></td>
				<td><%=ar.getString("status")%></td>

				<td>

					<form method="POST" action="<%=request.getContextPath()%>/DocAppointment">
						<input type="text" name="id" value="<%=ar.getInt("id")%>" hidden='hidden' />
						<input type="text" name="appid" value="<%=ar.getInt("appintmentid")%>" hidden='hidden' />
						 <input type="submit" name="delete" value="Cancel Appointment" class="select-button" class="btn btn-outline-secondary"/>
					</form>


				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span><br> <br> <br>
			<form action="<%=request.getContextPath()%>/DocAppointment"
				method="post">

				<table>
					<tr>
						<td width="100%"><label>status:</label></td>
						<td width="100%"><input type="text" name="status"
							value="Confirmed" disabled></td>
					</tr>
					<tr>
						<td><label for="lname">Appointment time:</label></td>
						<td><input type="time" name="time"><br></td>
					</tr>
					<tr>
						<td></td>
						<td id=myDIV></td>
					</tr>
				</table>

			</form>
		</div>
		</div>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		function myFunction(parameter) {
			
			const div = document.getElementById("myDIV")
			div.innerHTML = "";
			modal.style.display = "block";
			
			// Create element: <input type="button" value="Click me" />
			const para = document.createElement("input");
			para.type = "button";
			para.value = "Cancel";
			para.style = "float: right; margin:5px; padding:2px;";
			para.onclick = function() { modal.style.display = "none";};
			
			const para1 = document.createElement("input");
			para1.type = "text";
			para1.name = "appId";
			para1.value = parameter;
			para1.style.visibility = "hidden"
			
			const para3 = document.createElement("input");
			para3.type = "text";
			para3.name = "docId";
			para3.value = <%=id%>;
			para3.style.visibility = "hidden"
			
			const para2 = document.createElement("input");
			para2.type = "submit";
			para2.name = "Add";
			para2.value = "confirm";
			para2.style = "float: right; margin:5px; padding:2px;";
			
			// Append to another element:
			document.getElementById("myDIV").appendChild(para1);
			document.getElementById("myDIV").appendChild(para2);
			document.getElementById("myDIV").appendChild(para);
			document.getElementById("myDIV").appendChild(para3);
			
			
			}


		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</section>
<%@include file="footer.jsp" %>
</body>
</html>