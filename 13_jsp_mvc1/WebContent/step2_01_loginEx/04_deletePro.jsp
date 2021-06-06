<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
	
		String id  = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		boolean isLeave = MemberDAO.getInstance().leaveMember(id,pwd);
		
		if (isLeave) {
			session.invalidate();
	%>
			<script>
				alert("Your account has been deleted successfully.");
				location.href="00_main.jsp";
			</script>
	<% 
		}
		else {
	%>	
			<script>
				alert("Check your Id or Password");
				history.go(-1);
			</script>
	<% 		
		}
	%>


</body>
</html>