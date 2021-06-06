<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	
		String id 	  = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	
		Connection conn 		= null;
		PreparedStatement pstmt = null;
		ResultSet rs			= null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			String dbId    = "root";
			String dbPass  = "1234";
			
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
			pstmt = conn.prepareStatement("select id,passwd from member where id=? and passwd=?");
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();	// select문의 결과를 저장할 객체
			
			if (rs.next()) { // rs.next(); 반환된 결과물이 있으면
				
				String sql = "delete from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
		%>
				<script>
					alert("회원 탈퇴었습니다.");
					location.href = "00_main.jsp";
				</script>
		<% 	
				
			}
			else {
				
		%>
				<script>
					alert("아이디와 비밀번호를 확인하세요.");
					history.go(-1);		// 한페이지 이전으로 이동
				</script>
		<% 	
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    try {rs.close();} catch (Exception e){}
			if (pstmt != null) try {pstmt.close();} catch (Exception e){}
			if (conn != null)  try {conn.close();} catch (Exception e){}		
		}
		
		
	
	%>



</body>
</html>