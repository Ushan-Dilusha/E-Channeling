<%@page import="dB.EditorDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Edit Editor</title>
</head>
<body>
<%@include file="editor_header.jsp" %>
	<section >
                    <div class="container pt-2 vh-100">
		   <h1 class="container pt-5 mb-4">Edit Editor</h1>
                   <div style="margin-left:5%">
                   
                   
		<%
		String ids = (String) request.getAttribute("id");
		EditorDB Edb = new EditorDB();
		ResultSet rs = Edb.getDetails(ids);

		while (rs.next()) {
		%>


		<form method="POST" action="<%=request.getContextPath()%>/Editor"  class="contact-form row">
		
		
		<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">ID :</label></h5>
		         <input id="name" class="form-control" type="text"  value="<%=rs.getString("ID")%>" disabled >
		      </div>
		
		<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Name :</label></h5>
		         <input id="name" class="form-control"   type="text" name="name" value="<%=rs.getString("name")%>" >
		      </div>
		
		
		<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Age :</label></h5>
		         <input id="name" class="form-control"  type="number"  name="age" value="<%=rs.getString("age")%>" >
		      </div>
		
		
			<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Contact Number :</label></h5>
		         <input id="name" class="form-control"   type="text" name="contact" value="<%=rs.getString("contact")%>">
		      </div>
		
			<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">National Identification Number  :</label></h5>
		         <input id="name" class="form-control"   type="text" name="Nic" value="<%=rs.getString("Nic")%>">
		      </div>
			
			<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">User Name :</label></h5>
		         <input id="name" class="form-control"   type="text" name="Uname" value="<%=rs.getString("uName")%>">
		      </div>
			
			<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">User Name :</label></h5>
		         <input id="name" class="form-control"  type="password" name="pass" value="<%=rs.getString("pass")%>">
		      </div>
			
			
		
	
			<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
			<h5><label class="form-label" for="phone"> Gender : </label></h5>

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
			
			<br> 
			<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
			<input type="text" name="id" value="<%=rs.getInt("id")%>" hidden='hidden' /> 
			<input type="submit" name="update" value="update" class="btn btn-outline-success" /> 
			<input type="submit" name="delete" value="delete"class="btn btn-outline-danger" />

			<%
			}
			%>
			</div>
		</form>
	</div>
	</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>