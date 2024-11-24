<%@page import="com.example.Connectionprovider"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Message Page</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: rgba(239, 222, 205, 0.7);
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        .chat-container {
            max-width: 600px;
            margin: 0 auto;
            border: 2px solid #4d1f00;
            border-radius: 10px;
            background: #fff;
            padding: 10px;
            height:500px;
            box-shadow: 0px 0px 10px 2px #4d1f00;
            display:flex;
            flex-direction:column;
        }
        .message-form {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        textarea {
            width: 80%;
            padding: 10px;
            border: 1px solid #4d1f00;
            border-radius: 5px;
            resize: none;
        }
        .msg{
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4d1f00;
            color: white;
            cursor: pointer;
            
        }
      .msg:hover {
            background-color: #brown;
        }
        .messages {
            margin: 10px 0;
            max-height: 400px;
            overflow-y: auto;
            flex-grow:1;
        }
        .message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 10px;
        }
        .user-message {
            background-color: rgba(165,42,42,0.5);
            align-self: flex-end;
            text-align: right;
        }
        .admin-message {
            background-color: #f1f1f1;
            align-self: flex-start;
        }
    </style>
</head>
<body>

    <div class="chat-container">
        <div class="messages">
            <%
            String email = (String) session.getAttribute("email");
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    conn = Connectionprovider.getCon();
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String message = request.getParameter("message");
                        boolean isAdmin = false; 
                        String sql = "INSERT INTO messages (email, message, is_admin) VALUES (?, ?, ?)";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, email);
                        pstmt.setString(2, message);
                        pstmt.setBoolean(3, isAdmin);
                        pstmt.executeUpdate();
                        out.println("<p>Message sent successfully!</p>");
                    }
                    String selectSql = "SELECT email, message, sentat, is_admin FROM messages ORDER BY sentat ASC";
                    pstmt = conn.prepareStatement(selectSql);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        String msg = rs.getString("message");
                        boolean senderIsAdmin = rs.getBoolean("is_admin");
                        out.println("<div class='message " + (senderIsAdmin ? "admin-message" : "user-message") + "'>" + msg + "</div>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } 
            
            %>
        </div>
        <form action="" method="post" class="message-form">
            <textarea name="message" required placeholder="Type your message here..."></textarea>
            <input type="hidden" name="is_admin" value="false">
            <input class="msg"type="submit" value="Send Message">
        </form>
    </div>
</body>
</html>