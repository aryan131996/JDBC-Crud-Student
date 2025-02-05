<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.conn.DBConnect"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_css.jsp"%>
</head>
<body class="bg-light">
	<%@ include file="navbar.jsp"%>

	<%-- used for DB connection purpose
	<% Connection conn=DBConnect.getConn();
	out.println(conn);%> --%>


	<div class="container p-3">
		<p class="text-center fs-1">Student Details</p>
		<c:if test="${not empty sucMsg }">
			<p class="text-center text-success">${sucMsg }</p>
			<c:remove var="sucMsg" />
		</c:if>

		<c:if test="${not empty errorMsg }">
			<p class="text-center text-success">${errorMsg }</p>
			<c:remove var="errorMsg" />
		</c:if>
		<div class="card">
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Date Of Birth</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

						<%
						StudentDao dao = new StudentDao(DBConnect.getConn());
						List<Student> list = dao.getAllStudent();
						for (Student s : list) {
						%>
						<tr>
							<th scope="row"><%=s.getFullName()%></th>
							<td><%=s.getDob()%></td>
							<td><%=s.getAddress()%></td>
							<td><%=s.getQualification()%></td>
							<td><%=s.getEmail()%></td>
							<td><a href="edit_student.jsp?id=<%=s.getId()%>"
								class="btn btn-sm btn-primary">Edit</a> <a
								href="delete_student?id=<%=s.getId()%>"
								class="btn btn-sm btn-danger ms-1">Delete</a></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>





</body>
</html>