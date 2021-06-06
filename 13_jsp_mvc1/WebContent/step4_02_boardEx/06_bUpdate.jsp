<%@page import="step4_00_boardEx.BoardDTO"%>
<%@page import="step4_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_bUpdate</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));	
		BoardDTO bdto = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>
	<div align="center" style="padding-top: 100px">
		<form action="07_bUpdatePro.jsp" method="post">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h1>게시글 수정</h1>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<tr class="table-default">
									<td>작성자</td>
									<td><%=bdto.getWriter()%></td>
								</tr>
								<tr  class="table-default">
									<td>작성일</td>
									<td><%=bdto.getRegDate()%></td>
								</tr>
								<tr class="table-default">
									<td>제목</td>
									<td><input type="text" class="form-control" name="subject" value="<%=bdto.getSubject()%>" /></td>
								</tr>
								<tr class="table-default">
									<td>패스워드</td>
									<td><input type="password" class="form-control" name="password" /></td>
								</tr>
								<tr class="table-default">
									<td>글내용</td>
									<td><textarea rows="10" cols="60" name="content"><%=bdto.getContent()%></textarea></td>
								</tr>
								<tr class="table-default" align="center">
									<td colspan="4">
										<input type="hidden" name="num" value="<%=bdto.getNum()%>" /> 
										<input type="submit" class="btn btn-primary btn-sm" value="글수정" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='04_bList.jsp'" value="전체글보기" />
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
</body>
</html>