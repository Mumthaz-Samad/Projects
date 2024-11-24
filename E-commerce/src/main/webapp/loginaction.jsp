<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.Connectionprovider"%>
    <%@page import=" java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email)&&"admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("adminhome.jsp");
}
else
{
	
	try
	{
		Connection con=Connectionprovider.getCon();
		PreparedStatement pstmt=con.prepareStatement("select * from users where email=? AND password=?");
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		ResultSet res=pstmt.executeQuery();
		if(res.next())
		{
			
			session.setAttribute("email", email);
			response.sendRedirect("userhome.jsp");
			
		}
		else
		{
			response.sendRedirect("login.jsp?msg=notexist");
			
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>