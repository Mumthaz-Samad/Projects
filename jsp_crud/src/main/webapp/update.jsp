<%@page import="com.jsp.crud.Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jsp.crud.DAO.UserDAO" %>
<%int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String ctry=request.getParameter("ctry");

User user=new User();
user.setId(id);
user.setName(name);
user.setPwd(pwd);
user.setEmail(email);
user.setCtry(ctry);

int upd=UserDAO.updatebyid(user);
response.sendRedirect("viewuserform.jsp");



%>