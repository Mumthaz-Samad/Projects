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
            margin-top: 20px;
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

    <div style="width: 300px" class="hd">
        <h2><b></b></h2>
        <br>
    </div>
    <div class="content">
    <form action="orderaction.jsp" method="post">
        <input name="username" type="text" placeholder="Enter Name">
        <input name="email" type="email" placeholder="Enter email">
        <input name="mobilenumber" type="text" placeholder="Enter Mobile Number">
        <input name="address" type="text" placeholder="Enter Address">
        <input name="city" type="text" placeholder="Enter City">
        <input name="state" type="text" placeholder="Enter State">
        <input name="country" type="text" placeholder="Enter Country">
        <select class="car" name="paymentmethod" >
        <option disabled selected>Select payment Method</option>
        <option>Credit card</option>
        <option>Paypal</option>
        <option>Bank transfer</option>
        <option>Cash on delivery</option>
        </select>
        <br>
     
        <button onclick="valid()">Place Order</button>
        
    </form>
    
    </div>
    </div>
</body>
</html>