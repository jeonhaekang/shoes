<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Join</title>

<script type="text/javascript">
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (document.userInfo.id.value.length <= 5) {
			alert("아이디는 6글자 이상을 입력하세요.");
			return false;
		}
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.pwcheck.value) {
			alert("비밀번호 재확인을 입력하세요.");
			return false;
		}
		if (!document.userInfo.name.value) {
			alert("이름를 입력하세요.");
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
		if (!(document.userInfo.password.value == document.userInfo.pwcheck.value)) {
			alert("비밀번호가 서로 다릅니다.");
			return false;
		}

		var idChecked = $('#check_hidden').val();
		if (idChecked != "yes") {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
	}

	function idCheck() {
		var user_id = $('#input_userId').val();

		if (!user_id) {
			alert("아이디를 입력하세요.");
			return false;
		}

		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$.ajax({
			/* url : 'http://localhost:8080/servlet3_LoginJoinDB/IdCheckAction.do?id='+ user_id, */
			url : '${pageContext.request.contextPath}/IdCheckAction?id='
					+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복됨, 0 = 중복안됨 : " + data);

				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					alert("아이디가 중복됩니다.");
					$('#check_hidden').val("no");
				} else {
					// 0 : 아이디가 안됨.
					alert("아이디가 사용가능합니다.");
					$('#check_hidden').val("yes");
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	}
</script>

</head>
<body style="background-color:rgb(250,250,250);">
<div style="width: 500px; margin: 0 auto">
	<div style="margin: 70px 0; padding-right:30px;" class="text-center">
		<a class="pacifico navtitle" href="Main">
			<img src="image/icon/title.png">
		</a>
	</div>
	<br>
	<form name="userInfo" action="JoinAction"
		method="post" onsubmit="return checkValue();">
		<table class="basictable">
		<tr>
			<td class="titletd">아이디</td>
			<td class="contenttd">
				<input value="${ data.id }" id="input_userId" type="text"
					class="form-control" placeholder="아이디는 6자 이상을 사용하세요" name="id"
					style="width: 68%; display: inline-block;" autofocus>
				<input id="input_userId_check" type="button" value="중복확인"
					onclick="idCheck()" style="width: 30%; vertical-align: top;"
					class="btn btn-info">
				<input id="check_hidden" type="hidden" value="no" />
			</td>
		</tr>
		<tr>
			<td class="titletd" width="130px">비밀번호</td>
			<td class="contenttd">
				<input type="password" class="form-control" placeholder="문자,숫자,기호를 조합한 8자 이상을 사용하세요"
					name="password">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">비밀번호 확인</td>
			<td class="contenttd">
				<input type="password" class="form-control" placeholder="비밀번호 재확인"
					name="pwcheck">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">이름</td>
			<td class="contenttd">
				<input value="${ data.name }" type="text" class="form-control"
					placeholder="이름" name="name">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">주소</td>
			<td class="contenttd">
				<input value="${ data.address }" type="text" class="form-control"
					placeholder="주소" name="address">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">이메일</td>
			<td class="contenttd">
				<input value="${ data.email }" type="email" class="form-control"
					placeholder="이메일" name="email">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">핸드폰</td>
			<td class="contenttd">
				<input value="${ data.phone }" type="text" class="form-control"
					placeholder="전화번호(숫자만 입력하세요)" name="phone">
			</td>
		</tr>
		<tr>
			<td class="titletd" width="100px">성별</td>
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
		<input type="submit" class="btn joinbtn" value="회원가입" />
		<br>
	</form>
</div>
<%@ include file="../include/smallFooter.jsp"%>


</body>
</html>