<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Jeon's NewBalance</title>
</head>
<body class="Site">
	<%@ include file="include/nav.jsp"%>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/main/main1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="image/main/main2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="image/main/main3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


	<div class="wrap Site-content">
		<p class="pagetitle godic">신상품</p>

		<%
			int count = 0;
		%>
			<ul class="mainul">
				<c:forEach var="list" items="${list}">
					<%
						if (count < 5) {
					%>
					<c:if test="${list.arrival eq 1}">
						<%
							count++;
						%>
						<li><a class="listAtag"
							href="Detail?productname=${list.name}"> <img
								src="image/newbalance/${list.category}/${list.name}_1.jpg"
								class="mainimg">
								<br>
									<c:if test="${list.arrival != 0 }">
										<label class="new">NEW</label>
									</c:if>
									<c:if test="${list.best != 0 }">
										<label class="best">BEST</label>
									</c:if>
									<c:if test="${list.category eq 1 }">
										<label class="men">MEN</label>
									</c:if>
									<c:if test="${list.category eq 2 }">
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
									<label class="normal bold ">
										<fmt:formatNumber value="${list.price}" pattern="#,###" />원
									</label>
								</c:if>
						</a></li>
					</c:if>
					<%
						}
					%>
				</c:forEach>

			</ul>
		<br>
		<div class="row">
			<a class="btn defaultbtn" href="All?page=new" role="button">전체보기</a>
		</div>
		<br>
		<hr>
		<!-- 남자 -->
		<p class="pagetitle godic">남성신발</p>
		<%
			count = 0;
		%>
			<ul class="mainul">
				<c:forEach var="list" items="${list}">
					<%
						if (count < 5) {
					%>
					<c:if test="${list.category eq 1}">
						<%
							count++;
						%>
						<li><a class="listAtag"
							href="Detail?productname=${list.name}"> <img
								src="image/newbalance/${list.category}/${list.name}_1.jpg"
								class="mainimg">
								<br>
									<c:if test="${list.arrival != null }">
										<label class="new">NEW</label>
									</c:if>
									<c:if test="${list.best != null }">
										<label class="best">BEST</label>
									</c:if>
									<c:if test="${list.category eq 1 }">
										<label class="men">MEN</label>
									</c:if>
									<c:if test="${list.category eq 2 }">
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
						</a></li>
					</c:if>
					<%
						}
					%>
				</c:forEach>
			</ul>
		<br>
		<div class="row">
			<a class="btn defaultbtn" href="All?page=men" role="button">전체보기</a>
		</div>
		<br>
		<hr>
		<!-- 여자 -->
		<p class="pagetitle godic">여성신발</p>
		<%
			count = 0;
		%>
			<ul class="mainul">
				<c:forEach var="list" items="${list}">
					<%
						if (count < 5) {
					%>
					<c:if test="${list.category eq 2}">
						<%
							count++;
						%>
						<li>
							<a class="listAtag" href="Detail?productname=${list.name}"> <img
								src="image/newbalance/${list.category}/${list.name}_1.jpg" class="mainimg">
								<br>
									<c:if test="${list.arrival != null }">
										<label class="new">NEW</label>
									</c:if>
									<c:if test="${list.best != null }">
										<label class="best">BEST</label>
									</c:if>
									<c:if test="${list.category eq 1 }">
										<label class="men">MEN</label>
									</c:if>
									<c:if test="${list.category eq 2 }">
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
							</a>
						</li>
					</c:if>
					<%
						}
					%>
				</c:forEach>
			</ul>
		<br>
		<div class="row">
			<a class="btn defaultbtn" href="All?page=women" role="button">전체보기</a>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>