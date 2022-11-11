<%@page import="dB.EditorDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Admin Home</title>
</head>

<body>
<%@include file="admin_header.jsp" %>
<section class="vh-100">
	 <div class="container py-5">
                        <a href="addEditor.jsp"><button type="button" class="btn btn-outline-primary ">Add New Editor</button></a>
                

		<h2>List of Editors</h2>
<div class="m-5">
		<table class="table align-middle mb-0 bg-white ">
			<tr  class="bg-light">
				<th>User ID</th>
				<th>name</th>
				<th>age</th>
				<th>conact</th>
				<th>nic</th>
				<th>gender</th>
				<th>uname</th>
				<th></th>
			</tr>
			<%
			EditorDB Edb = new EditorDB();
			ResultSet rs = Edb.getDetails();

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("age")%></td>
				<td><%=rs.getString("contact")%></td>
				<td><%=rs.getString("Nic")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getString("uName")%></td>

				<td>
					<form method="POST" action="<%=request.getContextPath()%>/Editor">
						<input type="text" name="id" value="<%=rs.getInt("id")%>"
							hidden=true /> <input type="submit" name="edit" value="&nbsp;&nbsp;Edit&nbsp;&nbsp;"
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