<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String status=request.getParameter("status");
String productid=request.getParameter("productid");
try
{
	Connection con=Connectionprovider.getCon();
	String query = "UPDATE cart SET status=? WHERE productid = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
   
    pstmt.setString(1, status);
    pstmt.setString(2, productid);
    pstmt.executeUpdate();
    response.sendRedirect("deliv.jsp");
	
}
catch(Exception e)
{
	
	
}
%>