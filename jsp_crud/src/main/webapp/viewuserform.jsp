<%@page import="com.jsp.crud.DAO.UserDAO"%>
<%@page import="com.jsp.crud.Bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>VIEW USERS</h1>
<% List<User> l1=UserDAO.getUser(); %>
<table border="1" style="width:80%">
<tr>
<th>ID</th>
<th>Name</th>
<th>password</th>
<th>email</th>
<th>country</th>
<th>Edit</th>
<th>Delete</th>
</tr>
<%for(User d:l1)
    {%>
<tr>
<td><%=d.getId() %></td><td><%=d.getName() %></td><td><%=d.getPwd() %></td><td><%=d.getEmail() %></td><td><%=d.getCtry() %></td>
<td><a href="edituserform.jsp?id=<%=d.getId() %>">edit</a></td><td><a href="deleteuserform.jsp?id=<%=d.getId()%>">delete</a></td></tr> 
<%} %>
</table>
</body>
</html>