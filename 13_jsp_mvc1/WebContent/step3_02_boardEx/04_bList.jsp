<%@page import="java.util.ArrayList"%>
<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_bList</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h1>게시글 보기</h1>
						<br>
					</div>
					<div class="bs-component">
						<table class="table table-hover">
							<colgroup>
								<col width="10%">
								<col width="40%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<tr class="table-primary"  align="center">
								<td>번호</td>
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
							<tr class="table-default" align="center">
								<td><%=bdto.getNum() %></td>
								<td><a href="05_bInfo.jsp?num=<%= bdto.getNum() %>"><%= bdto.getSubject() %></a></td>
								<td><%= bdto.getWriter() %></td>
								<td><%= bdto.getRegDate() %></td>
								<td><%= bdto.getReadCount() %></td>
							</tr>
			<%
				}
			%>
							<tr class="table-default" align="right">
								<td colspan="5">
									<input type="button" class="btn btn-primary btn-sm" style="float: right" value="글쓰기"
										   onclick="location.href='02_bWrite.jsp'">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>