<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>leave</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
	#login_wrapper {
		position: absolute;
		top:25%;
		left:50%;
		margin-left:-150px;		
	}
</style>
</head>
<body>
	<% 
		String id = (String)session.getAttribute("id");
	%>
	<div id="login_wrapper">
		<h2 align="center">Delete Account '<%=id %>'</h2>
		<form action="04_deletePro.jsp" method="post">
			<div class="form-group">
				<label for="id">Id</label>
				<input type="text" class="form-control" value="<%=id %>" name="id" readonly>
			</div>
			<div class="form-group">
				<label for="passwd">Password</label>
				<input type="password" class="form-control"  name="passwd" >
			</div>
			<div class="form-group" align="right">	
				<button type="submit" class="btn btn-primary">Leave</button>
			</div>		 
		</form> 
	</div>   
</body>
</html>