<%@page import="com.example.Connectionprovider"%>
    <%@page import=" java.sql.*"%>
<%@ include file="adminheader.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add product</title>
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
        background-color:rgba(239, 222, 205, 0.7);
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
        margin-left: 40%;
        font-size: 20px;
        color: #4d1f00;
    }
    .content
    {
         margin-left: 70px;
         margin-top: 10px;
         display: block;
         
    }
    .field
    {
         display:flex;
         align-items:center;
         margin-bottom:15px;
    
    }
    .field h4
    {
      margin-left:90px;
      width:150px;
      color:#4d1f00;
     
    }
    .field input,select
    {
         width:300px;
         height:40px;
         margin-left:30px;
    
    }
    .field input:hover
    {
         border-color: green;
    
    }
    .bt
    {
          width:250px;
          height:30px;
          background-color:#4d1f00;
          font-size: 16px;
          color:#EFDECD;
          margin-left: 26%;
          border-radius: 9px;
    
    }
    .hd h5
    {
    color:olive;
    margin-left:-15px;
    
    }
    
</style>
<body>
 
<%
    int id = 1;
    try {
        Connection con = Connectionprovider.getCon();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT max(id) FROM products");
        while(rs.next()) {
            id = rs.getInt(1);
            id = id + 1;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="border">


    <div style="width: 300px" class="hd">
        <h3><b>PRODUCT ID: <% out.println(id); %></b></h3><br>
        <%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
        <h5>Product Added Successfully</h5>
<% } else if ("wrong".equals(msg)) { %>
        <h5>Something went wrong! Try again!</h5>
<% } %>
    </div>
    <form action="addproductaction.jsp" method="post" >
        <div class="content">
            <input type="hidden" name="id" value="<%out.println(id); %>">
            <div class="field">
                <h4>Enter category:</h4>
                <input type="text" name="category" placeholder="Enter category of product" required>
            </div>
            <div class="field">
                <h4>Enter name:</h4>
                <input type="text" name="name" placeholder="Enter product name" required>
            </div>
            <div class="field">
                <h4>Enter price:</h4>
                <input type="text" name="price" placeholder="Enter product price" required>
            </div>
            
            <div class="field">
                <h4>Active:</h4>
                <select name="active" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
            </div>
          
            
            <button type="submit" class="bt">Upload</button>
            
        </div>
    </form>
   
</div>
</body>
</html>