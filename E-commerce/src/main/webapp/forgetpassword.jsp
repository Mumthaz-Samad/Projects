<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
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
            width: 330px;
            height: 530px;
            margin-top: 3%;
            margin-left: 16%;
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
        .border1 {
            background-color: white;
            width: 530px;
            height: 530px;
            margin-top: 3%;
            border-right: 2px solid #4d1f00;
            border-top: 2px solid #4d1f00;
            border-bottom: 2px solid #4d1f00;
            box-shadow: 0px 0px 10px 0px #4d1f00;
            border-radius: 0px 5px 5px 0px;
            position: relative;
            overflow: hidden;
        }
        .img-container {
            width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
        }
        .img-container img {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0; 
            transition: opacity 1s ease; 
        }
        .img-container img.active {
            opacity: 1; 
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
            width: 200px;
            height: 40px;
        }
        .content input::placeholder
        {
        color:black;
        opacity:1;
        }
        .car
        {
         width:200px;
         height: 40px;
         border:none;
         border-bottom: 2px solid #4d1f00;
        }
    </style>
</head>
<body>
<div class="border">

    <div style="width: 300px" class="hd">
        <h2><b>SIGN-UP</b></h2>
        <br>
    </div>
    <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
	<h3>Successfully Registerd</h3>
<% }%>
<%if("invalid".equals(msg))
{%>
<h3>Something went wrong!try again!</h3>
<% }%>
    <div class="content">
    <form action="forgetpasswordaction.jsp" method="post">
        <input name="username" type="text" placeholder="Enter Name">
        <input name="email" type="email" placeholder="Enter email">
        <input name="mobilenumber" type="number" placeholder="Enter Mobile Number">
        <select class="car" name="securityquestion">
        <option>What was your first car?</option>
        <option>What is the name of your first pet?</option>
        <option>What elementary school did you attend?</option>
        <option>What is the name of the town you were born?</option>
        </select>
        <input name="answer" type="text" placeholder="Enter Answer">
        <input name="newpassword" type="password" placeholder="Enter New Password"><br>
     
        <button onclick="valid()" style="color:floralwhite;background-color:#4d1f00;width:200px;height:40px;border-color: #4d1f00">Sign-up</button>
        
    </form>
    <a href="login.jsp">login</a><br>
    
    </div>
    </div>

<div class="border1">
    <div class="img-container" id="imgContainer">
        <img src="images/image1.jpg" alt="Image 1" class="active">
        <img src="images/image2.jpg" alt="Image 2">
        <img src="images/image3.jpg" alt="Image 3">
    </div>
</div>
<script>
let currentIndex = 0; 
const images = document.querySelectorAll('.img-container img');

function showImage(index) {
    images.forEach((img, i) => {
        img.classList.remove('active'); 
        if (i === index) {
            img.classList.add('active'); 
        }
    });
}


function showNextImage() {
    currentIndex = (currentIndex + 1) % images.length; 
    showImage(currentIndex);
}


setInterval(showNextImage, 3000);
</script>

</body>
</html>