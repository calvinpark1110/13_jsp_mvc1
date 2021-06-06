<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
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
		<h2 align="center">Modify '<%=id %>'</h2>
		<form action="06_updatePro.jsp" method="post">
			<div class="form-group">
				<label for="id">Id</label>
				<input type="text" class="form-control" id="id" name="id" value="<%=id %>" readonly>
			</div>
			<div class="form-group">
				<label for="passwd">Password</label>
				<input type="password" class="form-control" id="passwd"  name="passwd" autofocus>
			</div>
			<div class="form-group">
				<label for="name">Name</label>
				<input type="text" class="form-control" id="name"  name="name" >
			</div>
			<div class="form-group" align="right">	
				<button type="submit" class="btn btn-primary">Modify</button>
			</div>		 
		</form> 
	</div>   
</body>
</html>