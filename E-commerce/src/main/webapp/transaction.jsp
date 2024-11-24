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
            justify-content:center;
            align-items: center;
        }
        .border {
            background-color:brown;
            width: 600px;
            height: 230px;
            border-left: 2px solid #4d1f00;
            border-top: 2px solid #4d1f00;
            border-bottom: 2px solid #4d1f00;
            box-shadow: 0px 0px 10px 2px #4d1f00;
            border-radius: 5px 0px 0px 5px;
            color:white;
            margin-top:15%;
            font-size:15px;
        }
        .border h1
        {
          margin-left:8%;
          margin-top:12%;
        
        }
        .border h4
        {
         margin-left:20%;
        }
        .border button
        {
           width:120px;
           height:37px;
           margin-left:36%;
           background-color:rgba(239, 202, 205, 0.7);
           border:1px solid white;
           border-radius:8px;
           color:#4d1f00;
           
          
        }
        .border button:hover {
	border:2px solid #4d1f00;
}
        
 </style>
<body>
<% 
String transactionid=request.getParameter("transactionid");
%>
<div class="border">

<input type="hidden" name="transactionid" value="<%=transactionid %>">
<h1>ORDER PLACED SUCCESSFULLY!</h1><br>
<h4>YOUR TRANSACTION ID: <%= transactionid %></h4><br>
<button><h3>keep ordering</h3></button>


</div>
</body>
</html>