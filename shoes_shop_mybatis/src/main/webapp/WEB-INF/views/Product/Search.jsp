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
<title>Search Result</title>
</head>
<body class="Site">
	<%@ include file="../include/nav.jsp"%>
	<div class="wrap Site-content">
		<div class="row">
			<div class="col-2 listnav">
				<br> <label class="big bold godic">카테고리</label>
				<hr>
				<ul class="normal listnavul">
					<li><a href="All?page=new">신상품</a></li>
					<li><a href="All?page=men">남성신발</a></li>
					<li><a href="All?page=women">여성신발</a></li>
				</ul>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">검색결과</label> <label
						class="normal gray">(${fn:length(list)})</label>
				</div>
				<div class="alignnav">"${data}" 로 검색한 결과입니다</div>
				<c:if test="${empty list}">
					<div class="row" style="margin-top: 100px">
						<img class="mx-auto" src="image/icon/search.svg"
							style="width: 100px; height: 100px;"></img>
					</div>
					<div class="row">
						<label class="mx-auto" style="margin-bottom: 100px">검색결과가없습니다</label>
					</div>
				</c:if>
				<div class="row">
					<c:forEach var="list" items="${list}">
						<div class="col-3">
							<a class="listAtag" href="Detail?productname=${list.name}">
								<img
								src="image/newbalance/${list.category}/${list.name}_1.jpg"
								class="img-thumbnail"> <c:if
									test="${list.arrival eq 1}">
									<label class="new">NEW</label>
								</c:if> <c:if test="${list.best ne null }">
									<label class="best">BEST</label>
								</c:if> <c:if test="${list.category eq 1 }">
									<label class="men">MEN</label>
								</c:if> <c:if test="${list.category eq 1 }">
									<label class="women">WOMEN</label>
								</c:if>
								<br>
								<label class="big godic">${list.name}</label><br>
								<c:if test="${list.sale != 0 }">
									<label class="normal">${list.sale}%</label>
									<label class="gray small" style="text-decoration:line-through;">
										<fmt:formatNumber value="${list.price}" pattern="#,###" />원
									</label><br>
									<label class="normal bold">
										<fmt:formatNumber value="${list.price-((list.price/100)*list.sale)}" pattern="#,###" />원
									</label>
								</c:if>
								<c:if test="${list.sale == 0 }">
									<label class="normal bold">
										<fmt:formatNumber value="${list.price}" pattern="#,###" />원
									</label>
								</c:if>
							</a><br> <br> <br>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<br>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>