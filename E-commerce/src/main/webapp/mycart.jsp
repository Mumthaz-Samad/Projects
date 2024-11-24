<%@ include file="userheader.jsp" %>

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
          
       
        width:1050px;
        margin-left: 100px;
        margin-top:30px;
       
       
        }
        .product-container {
            display: block;
             
            justify-content: space-between;
            
            
            
        }
        .catalog2 {
            width: 100%;
            background-color: #EFDECD;
            position: sticky;
            bottom: 0;
         
            color:#4d1f00;
        }
        .product
        {
            border: 2px solid #4d1f00;
            margin: 10px;
            padding: 15px;
            height:150px;
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
        .product a
        {
            text-decoration: none;
            color: white;
            background-color: #4d1f00;
            padding: 5px 10px;
            margin-left:450px;
           
           
        }
        .product a:hover
        {
            background-color: brown;
        }
        .catalog2 a
        {
            text-decoration: none;
            color: white;
            background-color: #4d1f00;
            padding: 5px 10px;
            margin-left:1150px;
        
        }
       .pr
       {
         display:flex;
        
       }
        .catalog2 a:hover
        {
            background-color: brown;
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
            
            
            ResultSet rs = stmt.executeQuery(
                "SELECT cart.*, products.name, products.category FROM cart " +
                "INNER JOIN products ON cart.productid = products.id " +
                "WHERE cart.email = '" + emailid + "'"
            );
           
            while(rs.next()) {
        %>
                <div class="product">
                
                    
                    <h4><%= rs.getString("name") %> <%= rs.getString("category") %></h4>
                    <p>Product ID: <%= rs.getString("productid") %></p>
                    <p>Quantity: <%= rs.getInt("quantity") %></p>
                    <p>Price: <%= rs.getInt("price") %></p>
                    <a href="">Remove</a>
                    <% ttl += rs.getInt("total"); %>                
                   </div>
        <%
            }
        } catch(Exception e) {
            e.printStackTrace(); 
        }
        %>
    </div>
</div>
<div class="catalog2">
    <h3>Total: <%= ttl %></h3>
    <a href="order.jsp">Continue </a>
    <div class="pr">
    <p> view price details</p>
    </div>
</div>

</body>
</html>
