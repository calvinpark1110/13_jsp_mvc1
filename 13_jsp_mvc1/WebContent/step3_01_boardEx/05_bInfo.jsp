<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_bInfo</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
		int bNum = Integer.parseInt(request.getParameter("num"));	
		BoardDTO bdto = BoardDAO.getInstance().getOneBoard(bNum);
		
	%>
	<h1>게시글 보기</h1>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td><%=bdto.getNum() %></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=bdto.getReadCount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=bdto.getWriter() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=bdto.getRegDate() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=bdto.getEmail() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=bdto.getSubject() %></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><%=bdto.getContent() %></td>
		</tr>
	</table>
	<p>
		<input type="button" value="수정하기" onclick="location.href='06_bUpdate.jsp?num=<%=bdto.getNum()%>'">
		<input type="button" value="삭제하기" onclick="location.href='08_bDelete.jsp?num=<%=bdto.getNum()%>'">
		<input type="button" value="목록보기" onclick="location.href='04_bList.jsp'">
	</p>
</body>
</html>


