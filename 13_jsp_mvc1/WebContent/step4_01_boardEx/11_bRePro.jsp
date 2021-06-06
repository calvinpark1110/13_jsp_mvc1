<%@page import="step4_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="boardDTO" class="step4_00_boardEx.BoardDTO">
			<jsp:setProperty name="boardDTO" property="*" />
		</jsp:useBean>
	<%
	 	BoardDAO.getInstance().reWriteBoard(boardDTO);
		response.sendRedirect("04_bList.jsp");
	%>

</body>
</html>