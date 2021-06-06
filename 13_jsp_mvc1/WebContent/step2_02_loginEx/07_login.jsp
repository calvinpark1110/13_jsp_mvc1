<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
	<div id="login_wrapper">
		<h2 align="center">Log In</h2>
		<form action="08_loginPro.jsp">
			<div class="form-group">
				<label for="id">Id</label>
				<input type="text" class="form-control" id="id" name="id" autofocus>
			</div>
			<div class="form-group">
				<label for="passwd">Password</label>
				<input type="password" class="form-control" id="passwd"  name="passwd" >
			</div>
			<div class="form-group" align="right">	
				<button type="submit" class="btn btn-primary">LogIn</button>
			</div>		 
		</form> 
	</div>   
</body>
</html>