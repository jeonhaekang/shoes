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
<title>MyBasket</title>
<script>
	function buy() {
		location.href = "BuyPage";
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
					<br>
					<label class="pagetitle godic m0">장바구니</label>
					<label class="normal gray">(${fn:length(list)})</label>
				</div>
				<c:if test="${empty list}">
					<div class="row" style="margin-top: 100px">
						<img class="mx-auto" src="image/icon/basket3.svg"
							style="width: 100px; height: 100px;"></img>
					</div>
					<div class="row">
						<label class="mx-auto"
							style="margin-top: 20px; margin-bottom: 100px">장바구니가
							비었습니다</label><br>
					</div>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list}">
						<div class="orderinfo">
							<span>
								<label>번호 : <b>${list.num}</b></label>
							</span>
						</div>
						<table class="ordertable">
							<tr height="100">
								<td align="center" width="130" style="border-right:0;">
									<img style="width: 70px; height: 70px;"
									src="image/newbalance/${list.category}/${list.name}/${list.name}_1.jpg">
								</td>
								<td style="border-left:0;">
									<label class="big"><b>
										<a href="Detail?productname=${list.name}">${list.name}</a>
									</b></label>
									<br>
									<label class="normal">사이즈:${list.shoesize}</label>
								</td>
								<td align="center" width="120">
									<c:if test="${list.category eq 1}">
										남성신발
									</c:if>
									<c:if test="${list.category eq 2}">
										여성신발
									</c:if>	
								</td>
								<td align="center" width="120">
									<fmt:formatNumber value="${list.price-((list.price/100)*list.sale)}" pattern="#,###" />원
								</td>
								<td align="center" width="120">
									<a class="smallbtn" href="BasketDelete?num=${list.num}">삭제</a>
								</td>
							</tr>
						</table>
						<br>
					</c:forEach>
					<div class="text-center">
						<button class="btn btntd" onclick="buy();">구매하기</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>