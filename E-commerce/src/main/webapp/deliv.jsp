<%@ include file="adminheader.jsp" %>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        *
        {
            margin:0;
            padding:0;
            font-family:'Poppins', sans-serif;
            box-sizing: border-box;
        }
        html, body
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
          
        justify-content:space-between;
        width:1150px;
        height:410px;
        margin-bottom:40px;
        margin-left: 90px;
        display:flex;
        flex-wrap:wrap;
       
        }
       
        .product-container {
             display: flex;
            flex-wrap: wrap; 
            justify-content: space-between; 
            margin-top:0px;
            
        }

        .product
        {
            border: 2px solid #4d1f00;
            margin: 10px;
            padding: 15px;
            height:270px;
            box-shadow: 0px 0px 5px 2px #4d1f00;
            width: calc(33.33% - 20px);
            box-sizing: border-box; 
            background-color:  rgba(239, 222, 205, 0.4);
            width:650px;
            margin-left: 200px;
           
            
        }
       
        .product h4
        {
            margin: 0;
            color: olive;
        }
        .product p
        {
            margin: 5px 0;
        }
        .product button
        {
            text-decoration: none;
            color: white;
            background-color: #4d1f00;
            padding: 5px 10px;
            margin-left:450px;
            
           
           
        }
        .product button:hover
        {
            background-color: brown;
        }
        a
        {
        text-decoration:none;
        color:white;
        }
      
       
        
    </style>
    
<body>
<div class="border">
    <% String emailid = (String)session.getAttribute("email"); %>

    <div class="product-container">
        <%
        int ttl = 0;
        
        try {
            Connection con = Connectionprovider.getCon();
            Statement stmt = con.createStatement();
            String query="SELECT cart.*, products.name, products.category FROM cart " +
                    "INNER JOIN products ON cart.productid = products.id and cart.status='delivered'" ;
               
            
            ResultSet rs = stmt.executeQuery(query );
           
            while(rs.next()) {
        %>
                <div class="product">
                
                   
                    <h4><%= rs.getString("name") %> <%= rs.getString("category") %></h4>
                    <p>Product ID: <%= rs.getString("productid") %></p>
                    <p>Quantity: <%= rs.getInt("quantity") %></p>
                    <p>Price: <%= rs.getInt("price") %></p>
                    <p>Ordered on: <%= rs.getDate("orderdate") %></p>
                    <p>Delivery at: <%= rs.getDate("deliverdate") %></p>
                     <p>Transaction ID: <%= rs.getLong("transactionid") %></p>
                     <p>Status:<%= rs.getString("status") %></p>
                     <% ttl += rs.getInt("total"); %> 
                    
                    <input type="hidden" name="productid" value="<%=rs.getInt("productid")%>">
                    <p style="color:brown;">Price: <%= rs.getInt("price") %></p> 
                             
                   </div>
                  
        <%
            }
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        %>
    </div>
</div>


</body>
</html>