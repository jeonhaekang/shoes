<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>shoes shop</title>

<script>
	function checkValue() {
		var inputForm = eval("document.loginInfo");

		if (!inputForm.id.value) {
			alert("아이디를 입력하세요.");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요.");
			inputForm.password.focus();
			return false;
		}
	}
</script>
</head>
<body style="background-color:rgb(250,250,250);">
	<div style="width: 450px; margin: 0 auto;">
		<div style="margin: 70px 0; padding-right:30px;" class="text-center">
			<a class="pacifico navtitle" href="Main">
				<img src="image/icon/title.png">
			</a>
		</div>
		<form name="loginInfo" action="LoginAction" method="post"
			onsubmit="return checkValue()">
			<table class="basictable">
				<tr>
					<td class="titletd text-center" width="100px"><img src="image/icon/mail.png" width="30px;"></td>
					<td class="contenttd"><input value="${ data.id }" type="text"
						class="form-control" placeholder="아이디" name="id" autofocus>
					</td>
				</tr>
				<tr>
					<td class="titletd text-center"><img src="image/icon/lock.png" width="30px;"></td>
					<td class="contenttd"><input type="password"
						class="form-control" placeholder="비밀번호" name="password"></td>
				</tr>
			</table>
			<br>
			<input type="submit" class="btn loginbtn" value="로그인" />
			<div
				style="margin-top: 10px; border-top: 1px solid rgb(170, 170, 170)">
				<br> <a class="btn loginjoin" href="Join" role="button">회원가입</a>
			</div>
			<br>
		</form>
	</div>
	<%@ include file="../include/smallFooter.jsp"%>
</body>
</html>