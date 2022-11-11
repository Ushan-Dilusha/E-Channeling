<%@page import="dB.AppointmentDB"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Appointment</title>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%@include file="user_header.jsp" %>
	<section >
                    <div class="container pt-2 vh-100">
		   <h1 class="container pt-5 mb-4">Edit your Appointment</h1>
                   <div style="margin-left:5%">
		<%
		String id = (String) request.getAttribute("id");
		AppointmentDB Adb = new AppointmentDB();
		ResultSet rs = Adb.getDetails(id);

		while (rs.next()) {
		%>
		

		<form method="POST" action="<%=request.getContextPath()%>/Appointment" class="contact-form row">
		
		
		
		      <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Appointment ID : </label></h5>
		         <input id="name" class="form-control" type="text"  name="id" value="<%=rs.getInt("id")%>" disabled>
		      </div>
		
		
		      <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Doctor name : </label></h5>
		         <input id="name" class="form-control" type="text"  name="name" value="<%=rs.getString("name")%>" disabled>
		      </div>
		
		 	<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Doctor Specialization : </label></h5>
		         <input id="name" class="form-control" type="text"  name="specialization" value="<%=rs.getString("specialization")%>" disabled>
		      </div>
		
		 	<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Patient name: : </label></h5>
		         <input id="name" class="form-control" type="text"  name="name" value="<%=rs.getString("username")%>">
		      </div>
		      
		      <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Appointment Date : </label></h5>
		         <input id="name" class="form-control" type="date"  name="date" value="<%=rs.getString("date")%>">
		      </div>
			
			 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Patient Age : </label></h5>
		         <input id="name" class="form-control" type="text"  name="age" value="<%=rs.getString("age")%>">
		      </div>
			
			 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Patient Contact : </label></h5>
		         <input id="name" class="form-control" type="text" name="contact" value="<%=rs.getString("contact")%>">
		      </div>
			
			 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Patient Address : </label></h5>
		         <input id="name" class="form-control" type="text" name="address" value="<%=rs.getString("address")%>">
		      </div>
			
			
		
			<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
			<h5><label class="form-label" for="phone">Enter Gender : </label></h5>
	

						<%
			if (rs.getString("gender").equals("male")) {
			%>

			Male<input type="radio" id="male" name="gender" value="male" checked="checked"  class="form-check-input">
			
			Female<input type="radio" id="female" name="gender" value="female"  class="form-check-input"> 
				
			Other<input type="radio" id="other" name="gender" value="other"  class="form-check-input">
			<%
			}

			else if (rs.getString("gender").equals("female")) {
			%>

			Male<input type="radio" id="male" name="gender" value="male"  class="form-check-input">

			Female<input type="radio" id="female" name="gender" value="female" checked="checked"  class="form-check-input"> 
			
			Other<input type="radio" id="other" name="gender" value="other"  class="form-check-input">
			<%
			}

			else {
			%>

			Male<input type="radio" id="male" name="gender" value="male"  class="form-check-input">

			Female<input type="radio" id="female" name="gender" value="female"  class="form-check-input">

			Other<input type="radio" id="other" name="gender" value="other" checked="checked"  class="form-check-input">
			<%
			}
			%>
			</div>
			

			<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
			<br><br><br><br>
			<input type="text" name="id" value="<%=rs.getInt("id")%>" hidden=true />
				<input type="submit" name="update" value="Save Changes" class="btn btn-outline-success">
				<input type="submit" name="delete" value="Cancle Appintment" class="btn btn-outline-danger" />
			</div>

			<%
			}
			%>
		</form>
	</div>
	</div>
	</section>
	<%@include file="footer.jsp" %>	
</body>
</html>