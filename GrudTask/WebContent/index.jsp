<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.*" %>
<%@ page import = "entities.*" %>
<%@ page import = "model.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Person list</title>
</head>
<body>
	<% PeopleModel pm = new PeopleModel(); %>
	<table>
		<tr>
			<th>Id</th>
			<th>FullName</th>
			<th>Pin</th>
		</tr>
		<c:forEach var="p" items="<%=pm.findAll() %>">
		
			<tr>
				<td>${p.id}</td>
				<td>${p.fullName}</td>
				<td>${p.pin}</td>
			</tr>
		</c:forEach>

		
	</table>
</body>
</html>