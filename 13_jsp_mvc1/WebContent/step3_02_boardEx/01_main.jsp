<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_main</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<%--

	CREATE DATABASE STEP3_BOARD_EX;
	
	USE STEP3_BOARD_EX;
	
	CREATE TABLE BOARD(
		NUM INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	    WRITER VARCHAR(50),
	    EMAIL VARCHAR(50),
	    SUBJECT VARCHAR(50),
	    PASSWORD VARCHAR(20),
	    REG_DATE DATE,
        READ_COUNT INT,
	   	CONTENT VARCHAR(200)
	);
	
	SELECT * FROM BOARD;

--%>

<body>
	<div align="center" style="padding-top: 100px">
		<img src="../img/jsp.PNG" alt="jsp심볼" width="800px" height="500px"><br><br><br><br>
		<input type="button" value="게시판 보기" class="btn btn-primary" onclick="location.href='04_bList.jsp'">
	</div>
</body>
</html>