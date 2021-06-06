<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
	#login_wrapper {
		position: absolute;
		top:25%;
		left:50%;
		margin-left:-150px;
	}
</style>
<script>

	function formValidationCheck() {
		
		var pwd = document.joinForm.pwd;
		 if (pwd.value.length == 0) {
	            alert("enter your password!");
	            pwd.focus();
	            return false;
	     }
	  
		if (pwd.value.length < 8) {
			alert("password must be at least 8 characters.");
			pwd.focus();
			return false;
		}
		
		if (!checkConfirmPwd()){
			alert("check your passwd.");
			return false;
		}
		
		return true;
     
	}

	function checkConfirmPwd(){
		
		var pwd = document.joinForm.pwd; 
		var confirmPwd = document.joinForm.confirmPwd;
		if (pwd.value == confirmPwd.value) {
			confirmPwd.className="form-control is-valid";
			return true;
		}
		else {	
			confirmPwd.className="form-control is-invalid";
			return false;
		}
		
		return true;
	
	}
	
</script>

</head>
<body>
	<div id="login_wrapper">
		<h2 align="center">Join Form</h2>
		<form name="joinForm" action="02_insertPro.jsp" method="post" onsubmit="return formValidationCheck();">
			<div class="form-group">
				<label for="id">Id</label>
				<input type="text" class="form-control" id="id" name="id" autofocus>
			</div>
			<div class="form-group">
				<label for="pwd">Password</label>
				<input type="password" class="form-control" id="pwd"  name="pwd" placeholder="min 8 character" >
			</div>
			<div class="form-group">
				<label for="confirmPwd">Confirm Password</label>
				<input type="password" class="form-control" id="confirmPwd" name="confirmPwd" placeholder="confirm your password" onblur="checkConfirmPwd();">
			</div>	
			<div class="form-group">
				<label class="col-form-label" for="name">Name</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="form-group" align="right">	
				<button type="submit" class="btn btn-primary">Join</button>
				<button type="reset" class="btn btn-primary">Reset</button>
			</div>		 
		</form> 
	</div>   
</body>
</html>