<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>InfoModify</title>
<script type="text/javascript">
	function checkValue() {

		if (!document.userInfo.nowPassword.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.pwcheck.value) {
			alert("비밀번호 재확인을 입력하세요.");
			return false;
		}
		if (!(document.userInfo.password.value == document.userInfo.pwcheck.value)) {
			alert("비밀번호가 서로 다릅니다.");
			return false;
		}
		if (document.userInfo.nowPassword.value == document.userInfo.password.value) {
			alert("변경할 비밀번호와 현재 비밀번호가 같습니다.");
			return false;
		}

	}
</script>
</head>
<body class="Site">
	<%@ include file="../include/nav.jsp"%>
	<div class="wrap Site-content">
		<div class="row">
			<div class="col-2 listnav">
				<%@ include file="MyPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">비밀번호 변경</label>
				</div>
				<br>
				<form name="userInfo" action="PasswordChangeAction" method="post"
					onsubmit="return checkValue();">
					<table class="basictable">
						<tr>
							<td class="titletd" width="200px">현재 비밀번호</td>
							<td class="contenttd"><input type="password"
								class="form-control" placeholder="현재 비밀번호" name="nowPassword">
							</td>
						</tr>
						<tr>
							<td class="titletd">변경 비밀번호</td>
							<td class="contenttd"><input type="password"
								class="form-control" placeholder="변경할 비밀번호" name="password">
							</td>
						</tr>
						<tr>
							<td class="titletd">변경 비밀번호 재입력</td>
							<td class="contenttd"><input type="password"
								class="form-control" placeholder="변경할 비밀번호 확인" name="pwcheck">
							</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">비밀번호 변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>