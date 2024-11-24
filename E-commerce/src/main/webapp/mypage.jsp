<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        box-sizing: border-box;
    }
    body {
       background-color:rgba(239, 222, 205, 0.7);
       margin:0;
       height:100vh;
       display:flex;
       justify-content:center;
       align-items:center;
    }
    .border {
        position:relative;
        background-color: white;
        width: 600px;
        padding: 20px;
        border-left: 2px solid #4d1f00;
        border-top: 2px solid #4d1f00;
        border-bottom: 2px solid #4d1f00;
        box-shadow: 0px 0px 10px 2px #4d1f00;
        border-radius: 5px 0px 0px 5px;
    }
    .border h3 {
        color: #4d1f00;
        text-align: center;
        margin-bottom: 20px;
    }
    .content h5 {
        margin: 10px 0;
        color: #333;
    }
</style>
<body>
<div class="border">
    <h3>My Profile</h3>
    <div class="content">
    <%
        String email = (String) session.getAttribute("email");
        if (email != null) {
            try {
                Connection con = Connectionprovider.getCon();
                String userQuery = "SELECT name FROM users WHERE email = ?";
                PreparedStatement userPst = con.prepareStatement(userQuery);
                userPst.setString(1, email);
                ResultSet userRs = userPst.executeQuery();
                
                String name = "";
                if (userRs.next()) {
                    name = userRs.getString("name");
                }
                String cartQuery = "SELECT * FROM cart WHERE email = ?";
                PreparedStatement cartPst = con.prepareStatement(cartQuery);
                cartPst.setString(1, email);
                ResultSet cartRs = cartPst.executeQuery();

                if (cartRs.next()) {
    %>
                    <h5><b>Name:</b> <%= name %></h5>
                    <h5><b>Email:</b> <%= cartRs.getString("email") %></h5>
                    <h5><b>Mobile No:</b> <%= cartRs.getString("mobilenumber") %></h5>
                    <h5><b>Address:</b> <%= cartRs.getString("address") %>, <%= cartRs.getString("city") %>, <%= cartRs.getString("state") %>, <%= cartRs.getString("country") %></h5>
    <%
                } else {
                    out.print("<h5>No address found for this user in the cart.</h5>");
                }
            } catch (Exception e) {
                out.print("<h5>Error: " + e.getMessage() + "</h5>");
            }
        } else {
            out.print("<h5>Please log in to view your profile.</h5>");
        }
    %>
    </div>
</div>
</body>
</html>