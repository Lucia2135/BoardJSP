<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
	<link href="./stylesheet.css" rel="stylesheet">

</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="${vo.getSeq()}"/>
<table>
	<tr><td>Category:</td><td><input type="text" name="category" value="${vo.getCategory()}"/></td></tr>
	<tr><td>Title:</td><td><input type="text" name="title" value="${vo.getTitle()}"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="${vo.getWriter()}" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content">${vo.getContent()}</textarea></td></tr>
	<tr><td>Photo:</td><td><input type="file" name="photo" value="${vo.getPhoto()}"/></td></tr>
	<c:if test="${vo.getPhoto() ne ''}"><br />
		<img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
<tr><br><td colspan="2"><br><input type="button" value="Cancel" onclick="history.back()"/>
<input type="submit" value="Edit Post"/></td></tr>
</table>
</form>

</body>
</html>