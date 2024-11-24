<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.Connectionprovider"%>
    <%@page import=" java.sql.*"%>
<%
String name=request.getParameter("username");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");
int check=0;
try
{
	Connection con=Connectionprovider.getCon();
	PreparedStatement pstmt=con.prepareStatement("select * from users where email=? AND mobilenumber=? AND securityquestion=? AND answer=?");
	pstmt.setString(1,email);
	pstmt.setString(2,mobilenumber);
	pstmt.setString(3,securityquestion);
	pstmt.setString(4,answer);
	ResultSet res=pstmt.executeQuery();
	if(res.next())
	{
		check=1;
		PreparedStatement stmt=con.prepareStatement("update users set password=? where email=?");
		stmt.setString(1, newpassword);
		stmt.setString(2, email);
		stmt.executeUpdate();
		response.sendRedirect("forgetpassword.jsp?msg=done");
	}
	if (check==0)
	{
		response.sendRedirect("forgetpassword.jsp?msg=invalid");
	}
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("forgetpassword.jsp?msg=invalid");
}

%>
    