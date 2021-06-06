<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<h2>회원정보 수정</h2>
	<form method="post" action="06_updatePro.jsp">
		아이디   : <input type="text" id="id" name="id" ><br>
		패스워드 : <input type="password" id="passwd" name="passwd"><br>
		이름     : <input type="text" id="name" name="name" ><br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>