<%@page import="step4_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<% 
		BoardDAO.getInstance().setDummy();
	%>
	<script>
		alert("테스트 파일을 생성하였습니다.");
		location.href="04_bList.jsp";
	</script>
</body>
</html>