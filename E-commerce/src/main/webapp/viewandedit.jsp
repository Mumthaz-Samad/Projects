<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View and  edit</title>
</head>
<style>
    *
    {
        margin:0;
        padding:0;
        font-family:'poppins',sans-serif;
        box-sizing: border-box;
    }
    html,body
    {
       
        height:100%;
        margin:0;
     }
     body
     {
     display:flex;
     flex-direction: column;
     justify-content: space-between;
     
     }
     .border
    {
        background-color:#EFDECD;
        width:850px;
        height:410px;
        margin-bottom:40px;
        margin-left: 200px;
        border:1px solid #4d1f00;
         box-shadow: 0px 0px 10px 1px #4d1f00;
       border-radius:6px;
        display:block;
    }
    .hd
    {
        margin-top: 25px;
        margin-left: 20%;
        font-size: 20px;
        color: #4d1f00;
      
    }
    .border table
    {
      border:2px solid #4d1f00;
      margin-left:80px;
      border-collapse: collapse;
      width:80%;
     
    }
    .border table th
    {
    border:2px solid #4d1f00;
    }
    .border table tr
    {
    border:1px solid #4d1f00;
    }
     .border table td
    {
    border:1px solid #4d1f00;
    }
    .border h4
    {
        margin-left:250px;
        color:olive;
    
    }
    img {
            width: 100px;
            height: auto;
        }
    
</style>
<body>
 <div class="border">
        <div class="hd">
            <h3><b>All Products and Edit Products</b></h3><br>
        </div>

        <%
            String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>
            <h4>Product edited successfully</h4>
        <% } else if ("wrong".equals(msg)) { %>
            <h4>Something went wrong! Try again!</h4>
        <% } %>

        <table>
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Name</th>
                <th>Price</th>
                <th>Edit</th>
            </tr>
            <%
                try {
                    Connection con = Connectionprovider.getCon();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getDouble("price") %></td>
                            <td><a href="editaction.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<h4 style='color: red;'>Error fetching products. Please try again later.</h4>");
                }
            %>
        </table>
    </div>

</body>
</html>