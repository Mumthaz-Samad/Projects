<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  

    try {
        String id=request.getParameter("id");
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String active = request.getParameter("active");
        Connection con = Connectionprovider.getCon();
        String sql = "INSERT INTO products (category, name, price, active) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, category);
        pstmt.setString(2, name);
        pstmt.setString(3, price);
        pstmt.setString(4, active); 
        pstmt.executeUpdate();
       
        response.sendRedirect("addnewproduct.jsp?msg=done" );
    
       
    } catch (Exception e) {
    	response.sendRedirect("addnewproduct.jsp?msg=wrong" );
    	System.out.println(e);
    }

    
%>