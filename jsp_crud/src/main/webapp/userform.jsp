<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ADD USERS</h1>
<form action="adduser.jsp" method="post">
<table style="width:30%;">
<tr><td>Name: </td><td><input type="text" name="name"></td></tr>
<tr><td>Password: </td><td><input type="password" name="pwd"></td></tr>
<tr><td>Email: </td><td><input type="email" name="email"></td></tr>
<tr><td>Country: </td><td><select name="ctry">
<option>India</option>
<option>Usa</option>
<option>China</option>
<option>Others</option>
</select></td></tr>
<tr><td><input type="submit" value="save user"></td></tr>
</table>
</form><br>
<a href="viewuserform.jsp">view employee</a>

</body>
</html>