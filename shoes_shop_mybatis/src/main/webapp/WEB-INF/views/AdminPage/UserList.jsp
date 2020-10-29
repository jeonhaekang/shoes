<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>UserList</title>
</head>
<body class="Site">
	<%@ include file="../include/nav.jsp"%>
	<div class="wrap Site-content">
		<div class="row">
			<div class="col-2 listnav">
				<%@ include file="AdminPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">회원목록</label> <label
						class="normal gray">(${fn:length(list)})</label>
				</div>
				<br>
				<table class="basictable">
					<tr height="40px" class="listth">
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>주소</th>
						<th>성별</th>
						<th>이메일</th>
						<th>핸드폰</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr class="text-center listtd" height="30px">
							<td>${list.id}</td>
							<td>${list.password}</td>
							<td>${list.name}</td>
							<td>${list.address}</td>
							<td>${list.gender}</td>
							<td>${list.email}</td>
							<td>${list.phone}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<br>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>