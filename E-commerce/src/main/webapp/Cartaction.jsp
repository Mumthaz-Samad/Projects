<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String emailid = "";
if (session.getAttribute("email") != null) {
    emailid = session.getAttribute("email").toString();
} else {
    response.sendRedirect("login.jsp?msg=loginrequired");
    return;
}

String productid = request.getParameter("id"); 
int quantity = 1;
int productprice = 0;
int producttotal = 0;
int carttotal = 0;
int z = 0;

try {
    Connection con = Connectionprovider.getCon();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE id='" + productid + "'");
    if (rs.next()) {
        productprice = rs.getInt("price"); 
        producttotal = productprice * quantity;
    } else {
        response.sendRedirect("userhome.jsp?msg=productnotfound");
        return;
    }
    ResultSet rs1 = stmt.executeQuery("SELECT * FROM cart WHERE productid='" + productid + "' AND email='" + emailid + "' AND address IS NULL");
    if (rs1.next()) {
        carttotal = rs1.getInt("total") + producttotal;
        quantity = rs1.getInt("quantity") + 1; 
        z = 1; 
    }
    if (z == 1) {
        stmt.executeUpdate("UPDATE cart SET total='" + carttotal + "', quantity='" + quantity + "' WHERE productid='" + productid + "' AND email='" + emailid + "' AND address IS NULL");
        response.sendRedirect("userhome.jsp?msg=exist");
    }
    else {
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO cart(email, productid, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
        pstmt.setString(1, emailid);
        pstmt.setString(2, productid);
        pstmt.setInt(3, quantity); 
        pstmt.setInt(4, productprice); 
        pstmt.setInt(5, producttotal);
        pstmt.executeUpdate();
        response.sendRedirect("userhome.jsp?msg=added");
    }

} catch (Exception e) {
    e.printStackTrace(); 
    response.sendRedirect("userhome.jsp?msg=error");
}
%>