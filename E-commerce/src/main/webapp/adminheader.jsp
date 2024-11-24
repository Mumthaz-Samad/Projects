<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/cf0d2718c3.js" ></script>
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
        }
        .h {
            color: #EFDECD;
            font-size: 28px;
            align-items: center;
            justify-content: center;
            display: flex;
            padding: 2px;
            margin-top: 2%;
        }
        .catalog {
            width: 100%;
            height: 30px;
            background-color: rgba(239, 222, 205, 0.7);
            margin-top: 1.8%;
            display:flex;
            justify-content: space-between;
            color:#4d1f00;
            
            
        }
        .catalog div a
        {
        text-decoration: none;
        color:#4d1f00;
        
        }
        .catalog div
        {
        margin-top:4px;
        margin-left: 6px;
        margin-right:6px;
        }
        .catalog div a:hover 
        {
          
          transform:scale(1.1);
          transition:transform 0.3s ease-in-out;
          display:inline-block;
	
        }
    </style>
</head>
<body>
<nav>
    <div class="h"><b><i>Onlineshopy</i></b></div>
    <div class="catalog">
    <div><a href="addnewproduct.jsp">Add new product</a><i class="fa-solid fa-plus"></i></div>
    <div><a href="viewandedit.jsp">All Products | Edit products<i class="fa-regular fa-eye"></i></a></div>
    <div><a href="adminmsg.jsp">Message recieved<i class="fa-solid fa-message"></i></a></div>
    <div><a href="orderrecieve.jsp">Orders recieved<i class="fa-solid fa-bag-shopping"></i></a></div>
    <div><a href="admincancel.jsp">cancel orders<i class="fa-solid fa-xmark"></i></a></div>
    <div><a href="deliverd.jsp">Deliverd orders<i class="fa-solid fa-cart-shopping"></i></a></div>
    <div><a href="logout.jsp">Logout<i class="fa-solid fa-right-from-bracket"></i></a></div>
    </div>
</nav>
</body>
</html>