<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO"%>
<%@page import="com.crud.bean.BoardVO"%>
<%@page import="com.crud.common.FileUpload"%>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);

	int i = boardDAO.updateBoard(u);
	String msg = "데이터 수정 성공";
	if(i == 0) msg = "[에러] 데이터 수정 실패";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>