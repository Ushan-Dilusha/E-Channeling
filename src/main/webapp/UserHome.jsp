<%@page import="dB.DoctorDB"%>
<%@page import="dB.AppointmentDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Home</title>
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
</head>
<body>

	<%
	if (session.getAttribute("userId") == null) {
		response.sendRedirect("userLogin.jsp");
	}
	%>
	<%@include file="user_header.jsp" %>
	<div align="center">
<section style="background-color: #eee;opacity: 0.8;min-height: 100vh" >
                    
		  <div class="container pt-5">
		  	<h2 class="container pt-5">List of Docter</h2>
			<%
			DoctorDB Ddb = new DoctorDB();
			ResultSet rs = Ddb.getDetails();
			int i=0;
			while (rs.next()) {
			%>
			 <% if(i%3==0){ %>
			 <div class="row justify-content-middle p-2">
			 <%} %>
			  <div class="col-lg-4 col-md-5">
		     
		        <div class="card"  style="border-radius: 10px; background-color:#d7f0f4">
		          <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light text-center "
		            data-mdb-ripple-color=dark>
		            <img src="image/logo.png" width=300 height =290
		              style="border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px"  class="img-fluid"
		              alt="Laptop" />
		            <a href="#!">
		       
		            </a>
		          </div>
		          <div class="card-body pb-2">
		            <div class="d-flex justify-content-between ripple-surface-light ripple">
		             <div>
		                <h4><a href="#!" style="color:#150E56; text-decoration: none">Docter : <%=rs.getString("name")%></a></h4>
		                <p style="color:#150E56">Specialization : <%=rs.getString("specialization")%></p>
		              </div>
		            </div>
		          </div>
		          <hr class="my-0"/>
		          <div class="card-body pb-0">
		            <div class="d-flex justify-content-between text-dark">
		              <p>Contact Number :</p>
		              <p class="text-dark"><%=rs.getString("contact")%></p>
		            </div>
		            <div class="d-flex justify-content-between text-dark">
		              <p>Age : </p>
                           
		             <p class="text-dark"><%=rs.getString("age")%></p>
		            </div>
		             <div class="d-flex justify-content-between text-dark">
		              <p>Gender : </p>
                           
		             <p class="text-dark"><%=rs.getString("gender")%></p>
		            </div>
		          </div>
		          <hr class="my-0" />
		          <div class="card-body">
		            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
		              <form method="POST" action="<%=request.getContextPath()%>/User">
						<input type="text" name="doctorid" value="<%=rs.getInt("id")%>" hidden=true />
						<input type="submit" name="makeAppointment" value="Make Appointment"
							class="btn btn-outline-primary" />
					</form>
		             
		            </div>
		          </div>
		        </div>
		     </div>
			 <% if(i%3==0 && i!=0){ %>
	</div>
	     <%}i++;}
			%>
	</div>
	
	</section>
			 
			 
			 
			 
				
					
			
			
		
		
	</div>
<%@include file="footer.jsp" %>	
</body>
</html>