<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Header</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'poppins', sans-serif;
            box-sizing: border-box;
        }
        nav {
            background-color: #4d1f00;
            position: sticky;
            top: 0;
            width: 100%;
            height: 85px;
            z-index:9999;
        }
        .h {
            color: #EFDECD;
            font-size: 28px;
            align-items: center;
            justify-content: center;
            display: flex;
            height:100%;
        }
        .catalog {
            width: 100%;
            height: 30px;
            background-color: rgba(239, 222, 205, 0.7);
            margin-top:0;
            display:flex;
            margin-bottom:0;
            padding-bottom:0;
            justify-content: space-between;
            align-items:center;
            color:#4d1f00;
            
            
        }
        .catalog div a
        {
        text-decoration: none;
        color:#4d1f00;
        
        }
        .catalog div
        {
        margin:0 6px;
        border-radious:8px;
        }
        .catalog div a:hover 
        {
          
          transform:scale(1.1);
          transition:transform 0.3s ease-in-out;
          display:inline-block;
          color:brown;
          
	
        }
    </style>
    <script src="https://kit.fontawesome.com/cf0d2718c3.js" ></script>
</head>
<body>
<nav>
<% String name=session.getAttribute("email").toString(); %>
    <div class="h"><b><i>Onlineshopy</i></b></div>
    <div class="catalog">
    <div><a href="mypage.jsp"><%out.println(name); %><i class="fa-solid fa-user"></i></a></div>
    <div><a href="userhome.jsp">Home<i class="fa-solid fa-house"></i></a></div>
    <div><a href="mycart.jsp">My Cart<i class="fa-solid fa-cart-shopping"></i></a></div>
    <div><a href="myorders.jsp">My Orders<i class="fa-solid fa-bag-shopping"></i></a></div>
    <div><a href="Change.jsp">Change Details<i class="fa-solid fa-pen-to-square"></i></a></div>
    <div><a href="msg.jsp">Message Us<i class="fa-solid fa-message"></i></a></div>
    <div><a href="about.jsp">About<i class="fa-solid fa-address-card"></i></a></div>
    <div><a href="logout.jsp">Logout<i class="fa-solid fa-right-from-bracket"></i></a></div>
    <div>
    <form action="Search.jsp">
    <input type="text" name="search" style="border:1 px solid brown;">
    <button type="submit" style="background-color:#EFDECD;border:none;"><i class="fa-solid fa-magnifying-glass"></i></button>
    </form>
    </div>
    </div>
</nav>
</body>
</html>