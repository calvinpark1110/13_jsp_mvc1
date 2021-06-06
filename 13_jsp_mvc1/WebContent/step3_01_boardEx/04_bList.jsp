<%@page import="step3_00_boardEx.BoardDAO"%>
<%@page import="step2_00_loginEx.MemberDAO"%>
<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_bList</title>
</head>
<body>
	<h1>게시글 보기</h1>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<% 
			ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getAllBoard();
			for (int i=0; i<boardList.size(); i++){
				BoardDTO bdto = boardList.get(i);
		%>
				<tr>
					<td><%=bdto.getNum() %></td>
					<td><a href="05_bInfo.jsp?num=<%=bdto.getNum()%>"><%=bdto.getSubject() %></a></td>
					<td><%=bdto.getWriter() %></td>
					<td><%=bdto.getRegDate() %></td>
					<td><%=bdto.getReadCount() %></td>
				</tr>
		<% 
			}
		%>
	</table>
	<p>
		<input type="button" value="글쓰기" onclick="location.href='02_bWrite.jsp'";>
	</p>
</body>
</html>