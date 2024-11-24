<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.Connectionprovider"%>

<%
String email = (String) session.getAttribute("email"); 
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String paymentmethod = request.getParameter("paymentmethod");
String mobilenumber = request.getParameter("mobilenumber"); 
try {
	
    
    Connection con = Connectionprovider.getCon();
    String query = "UPDATE cart SET address = ?, city = ?, state = ?, country = ?, paymentmethod = ?, mobilenumber = ? WHERE email = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
   
    pstmt.setString(1, address);
    pstmt.setString(2, city);
    pstmt.setString(3, state);
    pstmt.setString(4, country);
    pstmt.setString(5, paymentmethod);
    pstmt.setString(6, mobilenumber);
    pstmt.setString(7, email); 

    
   pstmt.executeUpdate();     
   response.sendRedirect("Change.jsp?msg=done");
   
 

       
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("Change.jsp?msg=invalid");
}



%>