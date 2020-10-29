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
<title>MyInfo</title>
<style>
.mynb li{
	display: inline-block;
	padding: 0 15px;
}
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
				<br>
				<label class="pagetitle godic m0">MyNB</label>
				<a href="MyInfoModify" class="normal gray">내정보수정</a>
				<div class="message text-center">
					<ul style="list-style: none; margin:0;" class="mynb">
						<li>등급:
							<c:if test="${data.rank eq 0}">
								<img src="image/rank/bronze.png" width="20">브론즈
							</c:if>
							<c:if test="${data.rank eq 1}">
								<img src="image/rank/silver.png" width="20">실버
							</c:if>
							<c:if test="${data.rank eq 2}">
								<img src="image/rank/gold.png" width="20">골드
							</c:if>
							<c:if test="${data.rank eq 3}">
								<img src="image/rank/special.png" width="20">스페셜
							</c:if>
						</li>
						<li>적립율:${data.save}%</li>
						<li>할인율:${data.sale}%</li>
						<li>포인트:
							<fmt:formatNumber value="${data.point}" pattern="#,###" />p
						</li>
					</ul>
				</div>
				
				
				<div class="p0">
					<br> <label class="pagetitle godic m0">내정보</label>
				</div>
				<table class="basictable">
					<tr>
						<td class="titletd" width="150px">아이디</td>
						<td class="contenttd">${data.id}</td>
					</tr>
					<tr>
						<td class="titletd">이름</td>
						<td class="contenttd">${data.name}</td>
					</tr>
					<tr>
						<td class="titletd">주소</td>
						<td class="contenttd">${data.address}</td>
					</tr>
					<tr>
						<td class="titletd">이메일</td>
						<td class="contenttd">${data.email}</td>
					</tr>
					<tr>
						<td class="titletd">전화번호</td>
						<td class="contenttd">${data.phone}</td>
					</tr>
					<tr>
						<td class="titletd">성별</td>
						<td class="contenttd">
							<c:if test="${data.gender eq 1}">
							남성
							</c:if>
							<c:if test="${data.gender eq 2}">
							여성
							</c:if>
						</td>
						
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>