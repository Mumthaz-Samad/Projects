<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try {
	
    String productid=request.getParameter("productid");
    Connection con = Connectionprovider.getCon();
    String query = "delete from cart WHERE productid=?";
    PreparedStatement pstmt = con.prepareStatement(query);
   
    pstmt.setString(1, productid);
    pstmt.executeUpdate();
    response.sendRedirect("myorders.jsp");
    }
    catch(Exception e)
    {
    
    }
%>