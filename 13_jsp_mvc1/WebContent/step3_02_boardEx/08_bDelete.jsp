<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08_bDelete</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bdto =  BoardDAO.getInstance().getOneUpdateBoard(num);	
	%>

	<div align="center" style="padding-top: 100px">
		<form action="09_bDeletePro.jsp" method="post">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h1>게시글 삭제</h1>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px">
								<tr class="table-default">
									<td>작성자</td>
									<td><%=bdto.getWriter()%></td>
								</tr>
								<tr class="table-default">
									<td>작성일</td>
									<td><%=bdto.getRegDate()%></td>
								</tr>
								<tr class="table-default">
									<td>제목</td>
									<td><%=bdto.getSubject()%></td>
								</tr>
								<tr class="table-default">
									<td>패스워드</td>
									<td><input type="password" class="form-control" name="password" size="60"></td>
								</tr>
								<tr class="table-default" align="right">
									<td colspan="4">
										<input type="hidden" name="num" value="<%=num%>">
										<input type="submit" class="btn btn-primary btn-sm" value="글삭제">
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='04_bList.jsp'" value="목록보기">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>