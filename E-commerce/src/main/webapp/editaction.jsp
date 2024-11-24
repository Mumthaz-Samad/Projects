<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.example.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminheader.jsp" %>
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
        margin-left: 3%;
        font-size: 20px;
        color: #4d1f00;
        background-color: #EFDECD;
        width:50px;
        display:flex;
        justify-content: center;
        align-items:center;
         box-shadow: 0px 0px 5px 1px #4d1f00;
    }
    .hd a
    {
       text-decoration:none;
       color: #4d1f00;
    }
    .hd:hover
    {
          transform:scale(1.1);
          transition:transform 0.3s ease-in-out;
          display:inline-block;
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
          box-shadow: 0px 0px 5px 1px #4d1f00;
    
    }
    .bt:hover
    {
          transform:scale(1.1);
          transition:transform 0.3s ease-in-out;
          display:inline-block;
    }
    
</style>
<body>
<div class="border">
    <%
      
        String id = request.getParameter("id");

      
        if (id != null) {
    %>
    <div style="width: 60px" class="hd">
        <p><b><a href="viewandedit.jsp">Back</a></b><p>
    </div>
    <%
        } else {
            out.println("No Product ID received.");
        }

        try {
            Connection con = Connectionprovider.getCon();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE id='" + id + "'");
            if (!rs.next()) {
                out.println("No product found for ID: " + id);
            } else {
               
    %>
    <form action="editactionperforming.jsp" method="post">
        <div class="content">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="field">
                <h4>Enter category:</h4>
                <input type="text" name="category" value="<%= rs.getString(2) %>" required>
            </div>
            <div class="field">
                <h4>Enter name:</h4>
                <input type="text" name="name" value="<%= rs.getString(3) %>" required>
            </div>
            <div class="field">
                <h4>Enter price:</h4>
                <input type="text" name="price" value="<%= rs.getString(4) %>" required>
            </div>
            <div class="field">
                <h4>Status:</h4>
                <select name="active">
                    <option value="yes" <%= rs.getString(5).equals("yes") ? "selected" : "" %>>Yes</option>
                    <option value="no" <%= rs.getString(5).equals("no") ? "selected" : "" %>>No</option>
                </select>
            </div><br>
            <input type="submit" value="Save" class="bt">
        </div>
    </form>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
    %>
</div>
</body>
</html>