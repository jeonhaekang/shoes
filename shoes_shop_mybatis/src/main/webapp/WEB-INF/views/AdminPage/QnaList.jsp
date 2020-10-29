<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
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
					<br> <label class="pagetitle godic m0">문의답변</label>
				</div>
				<br>
				<table class="basictable listth">
					<tr height="40px">
						<th width="100px">문의번호</th>
						<th width="100px">카테고리</th>
						<th width="100px">아이디</th>
						<th width="100px">작성자</th>
						<th>제목</th>
						<th width="150px">작성일</th>
						<th width="100px">답변여부</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr class="listtd text-center">
							<td>${list.num}</td>
							<td>${list.category}</td>
							<td>${list.id}</td>
							<td>${list.writer}</td>
							<td align="left">${list.title}</td>
							<td><fmt:formatDate value="${list.reg}" pattern="yyyy.MM.dd"/></td>
							<td>
								<c:if test="${list.answer == null}">
									<a class="delbtn backblue2 white" href="QnaAnser?num=${list.num}">답변대기</a>
								</c:if>
								<c:if test="${list.answer != null}">
									<a class="delbtn white" href="QnaDetail?num=${list.num}">답변완료</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>