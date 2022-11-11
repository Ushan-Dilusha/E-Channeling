<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Login</title>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
</head>
<body>
<%@include file="main_header.jsp" %>
		<section class="vh-100">
			  <div class="container-fluid">
			    <div class="row">
			      <div class="col-sm-6 px-0 d-none d-sm-block">
			        <img src="image/loginscreen.jpg" alt="Login image" class="w-100 vh-100" style="opacity: 0.6;object-fit: cover; object-position: left;box-sizing: 1px">
			      </div>
                                 <div class="col-sm-6 text-black">
                                  <div class="row vh-100 align-items-center">
                                  
                                  <!-- div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5" -->
                                  
			        <div class="d-flex justify-content-center">
                                    
                                    <div style="height: 75vh; width: 23rem; overflow-y: auto; overflow-x: visible">
			          <form action="Login" method="post" style="width: 85%;">
			
			            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Patient Log-in</h3>
                                    <!--<div class="alert alert-danger">
                                    <strong>Warning!</strong>Wrong username or password.
                                    </div>-->
			            <div class="form-outline mb-4">
                                      
                                      <input type="text" id="form2Example18" placeholder="Email address" class="form-control form-control-lg" name="uname"/>
			            </div>
			
			            <div class="form-outline mb-4">
                                        
                                        <input type="password" id="form2Example28" placeholder="Password" class="form-control form-control-lg" name="pass"/>
			              
			            </div>
			
			            <div class="pt-1 mb-4">
			            	<input class="btn btn-outline-primary" type="submit" name="UserLogin" value="&nbsp;&nbsp;Login&nbsp;&nbsp;">
			              <!--<button class="btn btn-info btn-lg btn-block" type="button">Login</button>-->
			            </div>
			
			           
			            <p>Don't have an account? <a href="userRegister.jsp" style="font-family: sans-serif; text-decoration: none">Register here</a></p>
			        
			
			          </form>
                                    </div>
                                </div>
			        </div>
			
			      </div>
                            </div>
			  </div>
		</section>
		
		<%@include file="footer.jsp" %>	
</body>
</html>