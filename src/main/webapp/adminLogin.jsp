<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
 

<section class="vh-100 background">
			  <div class="container-fluid">
			    <div class="row">
			     
                                 <div class="col-sm-6 text-black">
                                  <div class="row vh-100 align-items-center">
                                  
                                  <!-- div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5" -->
                                  
			        <div class="d-flex justify-content-center">
                                    
                                    <div style="height: 75vh; width: 23rem; overflow-y: auto; overflow-x: visible">
			          <form action="Login" method="post" style="width: 85%;">
			
			            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Editor Login</h3>
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
			            	<input class="btn btn-outline-primary" type="submit" name="AdminLogin" value="&nbsp;&nbsp;Login&nbsp;&nbsp;">
			              <!--<button class="btn btn-info btn-lg btn-block" type="button">Login</button>-->
			            </div>
			
			           
			       
			        
			
			          </form>
                                    </div>
                                </div>
			        </div>
			
			      </div>
                            </div>
			  </div>
		</section>
</body>