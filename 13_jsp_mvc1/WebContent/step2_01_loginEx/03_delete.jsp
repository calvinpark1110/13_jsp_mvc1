<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave</title>
</head>
<body>
	<% 
		String id = (String)session.getAttribute("id");
	%>

	<h2>Delete Member '<%=id %>'</h2>
	<form action="04_deletePro.jsp" method="post">
		<fieldset>
			<p>
				<label for="id">Id: </label> 
				<input type="text" value="<%=id %>" id="id" name="id" readonly>
			</p>		
			<p>
				<label for="pwd">Password: </label> 
				<input type="password" id="pwd" name="pwd">
			</p>		
			<input type="submit" value="leave">
		</fieldset>	
	</form>

</body>
</html>




