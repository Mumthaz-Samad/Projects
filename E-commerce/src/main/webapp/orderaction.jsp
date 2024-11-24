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
long timestamp=System.currentTimeMillis();
long randomnumber=(long)(Math.random()*10000);
long transactionid= timestamp+randomnumber;
Date orderdate=new Date(System.currentTimeMillis());
Date deliverdate=new Date(System.currentTimeMillis()+7*24*60*60*1000);
String status="yes";
try {
	
    
    Connection con = Connectionprovider.getCon();
    String query = "UPDATE cart SET address = ?, city = ?, state = ?, country = ?, paymentmethod = ?, mobilenumber = ?,transactionid=?,orderdate=?,deliverdate=?,status=? WHERE email = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
   
    pstmt.setString(1, address);
    pstmt.setString(2, city);
    pstmt.setString(3, state);
    pstmt.setString(4, country);
    pstmt.setString(5, paymentmethod);
    pstmt.setString(6, mobilenumber);
    pstmt.setLong(7, transactionid);
    pstmt.setDate(8,orderdate);
    pstmt.setDate(9,deliverdate);
    pstmt.setString(10,status);
    pstmt.setString(10, email); 

    
   pstmt.executeUpdate();     
   response.sendRedirect("transaction.jsp?transactionid="+transactionid);
   
 

       
} catch (Exception e) {
    e.printStackTrace();
}



%>