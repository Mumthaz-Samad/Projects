<%@page import="com.jsp.crud.Bean.User"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.crud.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EDIT USERS</h1>
<%int id=Integer.parseInt(request.getParameter("id"));
User emp=UserDAO.getbyid(id);%>

<form action="update.jsp" method="post">
<input type="hidden" name="id"value="<%=id %>">
<table style="width:30%;">
<tr><td>Name: </td><td><input type="text" name="name"value="<%=emp.getName()%>"></td></tr>
<tr><td>Password: </td><td><input type="password" name="pwd"value="<%=emp.getPwd()%>"></td></tr>
<tr><td>Email: </td><td><input type="email" name="email"value="<%=emp.getEmail()%>"></td></tr>
<tr><td>Country: </td><td><select name="ctry">
<option>India</option>
<option>Usa</option>
<option>China</option>
<option>Others</option>
</select></td></tr>
<tr><td><input type="submit" value="Update user"></td></tr>
</table>
</form>
</body>
</html>