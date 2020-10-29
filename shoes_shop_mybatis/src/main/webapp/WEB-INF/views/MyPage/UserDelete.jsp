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
<title>Delete</title>
<script>
	function checkValue() {
		if($("input:checkbox[name=check]").is(":checked") == false) {
			alert("처리사항을 확인해주세요");
			return false;
		}
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>
<style>
.info{
	list-style: none;
	font-size:12px;
}
.info2{
	font-size:12px;
	border:1px solid rgb(168,168,168);
	background-color:rgb(253,253,253);
	padding:15px;
}
.info2 ul{
	list-style:none;
}
.check{
	color: rgb(0,91,219);
	font-size:12px;
	border:1px solid rgb(168,168,168);
	background-color:rgb(245,245,245);
	padding:15px;
	border-top:0;
}
b, li{color:rgb(102,102,102);}
</style>
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
					<br> <label class="pagetitle godic m0">회원탈퇴</label>
				</div>
				<hr>
				<ul class="info">
					<li><b>회원님 서비스를 이용하시는데 불편함이 있으셨나요?</b></li>
					<li>이용불편 및 각종 문의 사항은 고객센터로 문의 주시면 성심 성의껏 답변 드리겠습니다.</li>
				</ul>
				<div class="info2">
				<b>1. 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</b>
				<ul>
					<li>- 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.</li>
					<li>- 거래정보가 있는 경우, 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존 됩니다.</li>
					<li>- 유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.</li>
					<li>- 유효기간 내 사용하지 못한 미사용 쿠폰은 구매금액의 70%를 쿠팡캐시로 적립해 드리나, 탈퇴시 적립 받을 수 없습니다.</li>
					<li>- 보유하셨던 포인트는 탈퇴와 함께 삭제되며 환불되지 않습니다.</li>
					<li>- 회원탈퇴 후 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 불가능 합니다.</li>
					<li>- 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
				</ul>
				</div>
				<div class="check">
					<input type="checkbox" id="check" style="vertical-align:-3px;" name="check">
					<label for="check">상기 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</label>
				</div>
				<br>
				<form name="userInfo" action="UserDeleteAction" method="post"
					onsubmit="return checkValue();">
					<table class="basictable">
						<tr>
							<td class="titletd" width="150">비밀번호</td>
							<td class="contenttd"><input type="password"
								class="form-control" placeholder="비밀번호 입력" name="password">
							</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">회원탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>