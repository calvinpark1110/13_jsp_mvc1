<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
	
	# 실습을 위한 데이터베이스 구성
	
	CREATE DATABASE LOGIN_EX;
	
	USE LOGIN_EX;
	
	CREATE TABLE MEMBER(
		ID VARCHAR(20),
	    PASSWD VARCHAR(20),
	    NAME VARCHAR(20),
		JOINDATE DATETIME
	);
	
 
 --%>
 
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Main</title>

 <!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet"> 
<link href="../css/new-age.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<%
		String id = (String)session.getAttribute("id");	
	%>
	  <header class="masthead">
	    <div class="container h-100">
	      <div class="row h-100">
	        <div class="col-lg-7 my-auto">
	          <div class="header-content mx-auto">
	<%
       			if (id == null) {
	%>
         			<h1 class="mb-5">JUST DO IT!</h1>
         			<a href="01_insert.jsp" class="btn btn-outline btn-xl js-scroll-trigger">Join!</a>
         			<a href="07_login.jsp" class="btn btn-outline btn-xl js-scroll-trigger">Login!</a>			         
	<% 
       			} 
       			else { 
	%>
					<h1 class="mb-5">Welcome!<%=id %></h1>
         			<a href="05_update.jsp" class="btn btn-outline btn-xl js-scroll-trigger">Modify!</a>
         			<a href="03_delete.jsp" class="btn btn-outline btn-xl js-scroll-trigger">Delete!</a>
         			<a href="09_logout.jsp" class="btn btn-outline btn-xl js-scroll-trigger">Logout!</a>
	<% 			          	
       			} 
	%>
		  	 </div>
           </div>
         <div class="col-lg-5 my-auto">
          <div class="device-container">
            <div class="device-mockup iphone6_plus portrait white">
              <div class="device">
                <div class="screen">
                  <img src="../img/main_image.PNG" class="img-fluid" alt="nike store">
                </div>         
              </div>
            </div>
          </div>
         </div>
      </div>
    </div>
  </header>				
</body>
</html>

