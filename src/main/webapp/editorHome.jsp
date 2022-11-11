<%@page import="dB.DoctorDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Editor Home</title>
</head>
<body>
<section class="vh-100">
	<%@include file="editor_header.jsp" %>
	 <div class="container py-5">
                        <a href="addDoctor.jsp"><button type="button" class="btn btn-outline-primary ">Add New Docter</button></a>
                
		<h2>List of Doctors</h2>

<div class="m-5">
		<table class="table align-middle mb-0 bg-white ">
			<tr  class="bg-light">
				<th>User ID</th>
				<th>name</th>
				<th>age</th>
				<th>conact</th>
				<th>nic</th>
				<th>specialization</th>
				<th>gender</th>
				<th>uname</th>
				<th></th>
			</tr>
			<%
			DoctorDB Ddb = new DoctorDB();
			ResultSet rs = Ddb.getDetails();

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("age")%></td>
				<td><%=rs.getString("contact")%></td>
				<td><%=rs.getString("nic")%></td>
				<td><%=rs.getString("specialization")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getString("uName")%></td>

				<td>
					<form method="POST" action="<%=request.getContextPath()%>/Doctor">
						<input type="text" name="id" value="<%=rs.getInt("id")%>"
							hidden=true /> <input type="submit" name="edit" value="edit"
							class="btn btn-primary" />
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>