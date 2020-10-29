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
	var msg = '${msg}';
	if (msg != null && msg != "") {
		alert(msg);
	}
	function checkValue() {
		if (!document.userInfo.address.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		if (!document.userInfo.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		if (!document.userInfo.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}
		if (document.userInfo.gender.value == "noSelect") {
			alert("성별을 입력하세요.");
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
					<br> <label class="pagetitle godic m0">회원정보 수정</label>
				</div>
				<form name="userInfo" action="ModifyAction" method="post"
					onsubmit="return checkValue();">
					<br>
					<input type="hidden" value="${data.password}">
					<table class="basictable">
						<tr>
							<td class="titletd" width="150px">아이디</td>
							<td class="contenttd"><input type="text" class="form-control" placeholder="아이디"
								name="name" value="${data.id}" disabled="disabled">
								<input type="hidden" class="form-control" name="id" value="${data.id}">
							</td>
						</tr>
						<tr>
							<td class="titletd">이름</td>
							<td class="contenttd"><input type="text" class="form-control" placeholder="이름"
								name="name" value="${data.name}">
							</td>
						</tr>
						<tr>
							<td class="titletd">주소</td>
							<td class="contenttd"><input type="text" class="form-control" placeholder="주소"
								name="address" value="${data.address}">
							</td>
						</tr>
						<tr>
							<td class="titletd">이메일</td>
							<td class="contenttd"><input type="email" class="form-control" placeholder="이메일"
								name="email" value="${data.email}">
							</td>
						</tr>
						<tr>
							<td class="titletd">핸드폰</td>
							<td class="contenttd"><input type="text" class="form-control"
								placeholder="전화번호(숫자만 입력하세요)" name="phone" value="${data.phone}">
							</td>
						</tr>
						<tr>
							<td class="titletd">성별</td>
							<td class="contenttd">
							<select class="form-control" name="gender">
								<option selected="selected" value="noSelect">성별을 선택해주세요</option>
								<option value=1>남성</option>
								<option value=2>여성</option>
							</select>
							</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">회원정보 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>