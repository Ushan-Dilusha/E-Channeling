<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<%@include file="editor_header.jsp" %>
	<section class="" >
                    <div class="container pt-2 vh-100">
                    
		   <h1 class="container pt-5 mb-4">Add New Doctor Doctor</h1>
                   <div style="margin-left:5%">
	<form action="<%= request.getContextPath() %>/Doctor" method="post" class="contact-form row">
	
	
	
		<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Doctor Name :</label></h5>
		         <input id="name" class="form-control" name="name" type="text" >
		      </div>
		      
		      <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Doctor Age :</label></h5>
		         <input id="name" class="form-control" name="age" type="number" >
		      </div>
		      
		       <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Contact :</label></h5>
		         <input id="name" class="form-control" name="contact" type="text" >
		      </div>
	
		 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">National Identification Number :</label></h5>
		         <input id="name" class="form-control" name="Nic" type="text" >
		      </div>
		
		 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">E Mail Address :</label></h5>
		         <input id="name" class="form-control" name="Uname" type="email" >
		      </div>
	
	 <div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">Password :</label></h5>
		         <input id="name" class="form-control" name="pass" type="password" >
		      </div>
		
		<div class="form-outline flex-fill mb-2 col-lg-6">
                          <h5><label class="form-label" for="form3Example1c">specialization :</label></h5>
		         <input id="name" class="form-control" name="specialization" type="text" >
		      </div>
		
		
		<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
			<h5><label class="form-label" for="phone"> Gender : </label></h5>

		
		<label for="male">Male</label>
		<input type="radio" id="male" name="gender" value="male" class="form-check-input">
		
		<label for="female">Female</label>
		<input type="radio" id="female" name="gender" value="female" class="form-check-input">
		
		<label for="other">Other</label>
		<input type="radio" id="other" name="gender" value="other" class="form-check-input">
		
		<div class="form-outline flex-fill mb-0 col-lg-6 mt-3">
		<br><br><br><br>
		<input type="submit" name="Add" value="Add Doctor" class="btn btn-outline-primary">
		</div>
		</div>
	</form>
	</div>
	</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>