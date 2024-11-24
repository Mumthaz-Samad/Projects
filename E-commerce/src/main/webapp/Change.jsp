<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.Connectionprovider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            display: flex;
        }
        .border {
            background-color: white;
            width: 600px;
            height: 530px;
            margin-top: 3%;
            margin-left: 26%;
            border-left: 2px solid #4d1f00;
            border-top: 2px solid #4d1f00;
            border-bottom: 2px solid #4d1f00;
            box-shadow: 0px 0px 10px 2px #4d1f00;
            border-radius: 5px 0px 0px 5px;
        }
        .border h3
        {
        margin-left:16%;
        color:red;
        }
        .border a
        {
        margin-left: 90px;
        color:blue;
        }
        .hd {
            margin-top: 20px;
            margin-left: 35%;
        }
       
        .content {
            margin-left: 50px;
            margin-top: 50px;
        }
        .content input {
            display: block;
            border:none;
            border-bottom: 2px solid #4d1f00;
            width: 500px;
            height: 40px;
        }
        .content input::placeholder
        {
        color:black;
        opacity:1;
        }
        .car
        {
         width:500px;
         height: 40px;
         border:none;
         border-bottom: 2px solid #4d1f00;
        }
        .content button:hover
        {
        background-color: brown;
        }
        .content button
        {
        color:floralwhite;
        background-color:#4d1f00;
        width:300px;
        height:40px;
        border-color: #4d1f00;
        margin-top:50px;
        margin-left:90px;
        }
    </style>
<body>
    <div class="border">
        <%
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        String msg = request.getParameter("msg");
        if ("done".equals(msg)) {
        %>
            <h3>Successfully Changed</h3>
        <%
        } else if ("invalid".equals(msg)) {
        %>
            <h3>Something went wrong! Try again!</h3>
        <%
        }

        try {
            Connection con = Connectionprovider.getCon();
            String query = "SELECT c.*, u.name AS username FROM cart c JOIN users u ON c.email = u.email WHERE c.email = ? LIMIT 1";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
        %>
           <div class="content">
             <form action="changeaction.jsp" method="post">
               <input name="username" type="text" placeholder="Enter Name" value="<%= rs.getString("username") %>" required>
               <input name="email" type="email" placeholder="Enter email" value="<%= rs.getString("email") %>" required>
               <input name="mobilenumber" type="text" placeholder="Enter Mobile Number" value="<%= rs.getString("mobilenumber") %>" required>
               <input name="address" type="text" placeholder="Enter Address" value="<%= rs.getString("address") %>" required>
               <input name="city" type="text" placeholder="Enter City" value="<%= rs.getString("city") %>" required>
               <input name="state" type="text" placeholder="Enter State" value="<%= rs.getString("state") %>" required>
               <input name="country" type="text" placeholder="Enter Country" value="<%= rs.getString("country") %>" required>
               <select class="car" name="paymentmethod" required>
                  <option disabled selected>Select Payment Method</option>
                  <option>Credit Card</option>
                  <option>Paypal</option>
                  <option>Bank Transfer</option>
                  <option>Cash on Delivery</option>
               </select>
               <br>
               <button type="submit">Change Details</button>
               </form>
             </div>
        <%
            } else {
                out.println("<h3>User not found!</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error while fetching user details.</h3>");
        }
        %>
    </div>
</body>
</html>