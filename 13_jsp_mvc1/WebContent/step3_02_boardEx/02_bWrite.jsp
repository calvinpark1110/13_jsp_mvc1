<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_boardWrite</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script>

	function formValidationCheck() {
		
		var writer = document.f.writer;
		if (writer.value.length == 0){
			alert("작성자를 입력하세요.");
			writer.focus();
			return false;
		}
		
		var subject = document.f.subject;
		if (subject.value.length == 0){
			alert("제목을 입력하세요.");
			subject.focus();
			return false;
		}
		
		var password = document.f.password;
		if (password.value.length == 0){
			alert("비밀번호를 입력하세요.");
			password.focus();
			return false;
		}
		
		var email = document.f.email;
		if (email.value.length == 0){
			alert("이메일을 입력하세요.");
			email.focus();
			return false;
		}	
		
		return true;
		
	}
</script>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<form action="03_bWritePro.jsp" name="f" method="post" onsubmit="return formValidationCheck()">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h2>게시글 쓰기</h2>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 작성자</td>
									<td><input type="text" class="form-control" id="writer" name="writer"/></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 제목</td>
									<td><input type="text" class="form-control" id="subject" name="subject" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 이메일</td>
									<td><input type="email" class="form-control" id="email" name="email" /></td>
								</tr>
								<tr class="table-default">
									<td align="center"><span style="color: red">*</span> 비밀번호</td>
									<td><input type="password" class="form-control" id="password" name="password" /></td>
								</tr>
								<tr class="table-default">
									<td align="center">글내용</td>
									<td><textarea class="form-control" rows="10" cols="50" id="content" name="content"></textarea></td>
								</tr>
								<tr align="center">
									<td colspan=2>
										<input type="submit" class="btn btn-primary btn-sm" value="글쓰기" />
										<input type="reset"  class="btn btn-primary btn-sm" value="다시작성" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='04_bList.jsp'" value="전체게시글보기">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>