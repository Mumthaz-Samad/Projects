<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jsp.crud.DAO.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="us" class="com.jsp.crud.Bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="us"/>
<%int i=UserDAO.SaveUser(us);
if(i>0)
{
	response.sendRedirect("Success.jsp");
	
}
else
{
	
	response.sendRedirect("failure.jsp");
}
%>
</body>
</html>