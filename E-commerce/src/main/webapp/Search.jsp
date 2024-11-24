<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="userheader.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
        margin-left: 50px;
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
            border: 1px solid #4d1f00;
            margin: 10px;
            padding: 15px;
            height:200px;
            box-shadow: 0px 0px 5px 2px #4d1f00;
            width: calc(33.33% - 20px); 
            box-sizing: border-box; 
            background-color: rgba(239, 222, 205, 0.7);
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
           
        }
        .product a:hover
        {
            background-color: brown;
        }
        .border1 h3
        {
        margin-left:35%;
        color:brown;
        
        }
.product:hover {
	transform:scale(1.1);
	
}
    </style>
<body>
<div class="border">
<%
int z=0;
try
{
	String search=request.getParameter("search");
	Connection con = Connectionprovider.getCon();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from products WHERE name like '%"+search+"%' or category like'%"+search+"%' and active='yes'");

    while(rs.next()) {
    	z=1;
%>
        <div class="product">
                    <h4>Product ID: <%= rs.getString(1) %></h4>
                    <p><strong>Category:</strong> <%= rs.getString(2) %></p>
                    <p><strong>Name:</strong> <%= rs.getString(3) %></p>
                    <p><strong>Price:</strong> <%= rs.getString(4) %></p>
                    <p><strong>Status:</strong> <%= rs.getString(5) %></p>
                    <a href="Cartaction.jsp?id=<%=rs.getString(1) %>">Add to Cart</a>
                </div>
                
<%
    }	
}
catch(Exception e)
{
	
}

%>

<%if(z==0)
{
%>
<h1>Nothing to Show</h1>
<%} %>
</div>
</body>
</html>