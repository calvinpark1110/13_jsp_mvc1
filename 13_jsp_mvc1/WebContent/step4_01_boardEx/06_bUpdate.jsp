<%@page import="step4_00_boardEx.BoardDTO"%>
<%@page import="step4_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_bUpdate</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));	
		BoardDTO bdto = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>
	<div align="center" style="padding-top: 100px">
		<form action="07_bUpdatePro.jsp" method="post">
			<h1>게시글 수정</h1>
			<br>
			<table style="width: 700px;" border="1">
				<tr>
					<td>작성자</td>
					<td><%=bdto.getWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=bdto.getRegDate()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="<%=bdto.getSubject()%>" /></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea rows="10" cols="60" name="content"><%=bdto.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" name="num" value="<%=bdto.getNum()%>" /> 
						<input type="submit" value="글수정" />
						<input type="button" onclick="location.href='04_bList.jsp'" value="전체글보기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
</body>
</html>