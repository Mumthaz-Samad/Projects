<%@page import="com.jsp.crud.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int id=Integer.parseInt(request.getParameter("id"));
int st=UserDAO.deletebyid(id);
response.sendRedirect("viewuserform.jsp");



%>