<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>게시물</title>
  <link href="./stylesheet.css" rel="stylesheet">
</head>
<body>
<%
  BoardDAO boardDAO = new BoardDAO();
  String id=request.getParameter("id");
  BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
  request.setAttribute("vo",u);
%>

<h1>게시물</h1>
  <table id="edit" width="90%">
    <tr><td>Id:</td><td><td>${vo.getSeq()}</td>
    <tr><td>Category:</td><td><td>${vo.getCategory()}</td>
    <tr><td>Title:</td><td><td>${vo.getTitle()}</td>
    <tr><td>Writer:</td><td><td>${vo.getWriter()}</td>
    <tr><td>Content:</td><td><td>${vo.getContent()}</td>
    <tr><td>Photo:</td><td><td><c:if test="${vo.getPhoto() ne ''}"><br /> <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
    <tr><td>Regdate:</td><td><td>${vo.getRegdate()}</td><br>
    <tr><td>Update:</td><td><td>${vo.getUpdate()}</td><br>
    <td><a href="editform.jsp?id=${vo.getSeq()}">Edit</a></td>
    <td><a href="javascript:delete_ok('${vo.getSeq()}')">Delete</a></td>
    <tr><td><br><a href="posts.jsp">View All Records</a></td></tr>
  </table>
</body>
</html>