<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_main</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<%--

	CREATE DATABASE STEP4_BOARD_EX;
	
	USE STEP4_BOARD_EX;
	
	CREATE TABLE BOARD(
		NUM INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	    WRITER VARCHAR(20),
	    EMAIL VARCHAR(20),
	    SUBJECT VARCHAR(50),
	    PASSWORD VARCHAR(20),
	    REG_DATE DATE,
	    REF INT(10),             
	    RE_STEP INT(10),     	  
	    RE_LEVEL INT(10),		  
	    READ_COUNT INT(10),
	    CONTENT VARCHAR(20)
	);
	
	SELECT * FROM BOARD;

--%>

<body>	
	<div align="center">
		<img src="../img/jsp.PNG" alt="jsp심볼" width="800px" height="500px"><br><br><br><br>
		<input type="button" value="게시판 보기" class="btn btn-primary" onclick="location.href='04_bList.jsp'">
	</div>
</body>
</html>