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
				<%@ include file="CustomerServiceNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">나의 문의내역</label>
				</div>
				<c:if test="${empty list}">
					<div class="row" style="margin-top: 100px">
						<img class="mx-auto" src="image/icon/pencil-square.svg"
							style="width: 100px; height: 100px;"></img>
					</div>
					<div class="row">
						<label class="mx-auto"
							style="margin-top: 20px; margin-bottom: 100px">문의내역이 없습니다</label><br>
					</div>
				</c:if>
				<c:if test="${!empty list}">
				<br>
				<table class="basictable listth">
					<tr height="40px">
						<th width="100px">문의번호</th>
						<th width="150px">카테고리</th>
						<th>제목</th>
						<th width="150px">작성일</th>
						<th width="100px">답변여부</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr class="listtd text-center">
							<td>${list.num}</td>
							<td>${list.category}</td>
							<td align="left">${list.title}</td>
							<td><fmt:formatDate value="${list.reg}" pattern="yyyy.MM.dd"/></td>
							<td>
								<c:if test="${list.answer == null}">
									<a class="delbtn" style="color:white">답변대기</a>
								</c:if>
								<c:if test="${list.answer != null}">
									<a class="delbtn backblue2 white" href="QnaDetail?num=${list.num}">답변보기</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>