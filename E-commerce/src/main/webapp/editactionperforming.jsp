<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.Connectionprovider"%>
    <%@page import=" java.sql.*"%>
<%
   
    String id = request.getParameter("id");
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String active = request.getParameter("active");

  

    
        try {
            
            Connection con = Connectionprovider.getCon();
            String query = "UPDATE products SET category=?, name=?, price=?, active=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            
            pstmt.setString(1, category);
            pstmt.setString(2, name);
            pstmt.setString(3, price);
            pstmt.setString(4, active);
            pstmt.setString(5, id);

           
            pstmt.executeUpdate();
            response.sendRedirect("viewandedit.jsp?msg=done");

        } catch (Exception e) {
            
            e.printStackTrace();
            response.sendRedirect("editaction.jsp?msg=wrong");
        }
   
%>