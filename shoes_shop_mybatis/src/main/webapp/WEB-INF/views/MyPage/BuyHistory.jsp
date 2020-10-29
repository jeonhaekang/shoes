<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ProductList</title>
<script>
	function check() {
		var result = confirm("정말 삭제하시겠습니까?");
		return result;
	}
	$(function() {
		$('#contents .hide').hide();
		$('#contents .show').click(function() {
			var tr = $('#contents .tr');
			var rindex = $(this).parent().children().index(this);
			if($(tr[rindex + 1]).css("display") == "none"){
				$(tr[rindex + 1]).show();
			} else {
				$(tr[rindex + 1]).hide();
			}
		});
	});
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
					<br> <label class="pagetitle godic m0">주문내역</label> <label
						class="normal gray">(${fn:length(list)})</label>
				</div>
				<c:if test="${empty list}">
					<div class="row text-center" style="margin-top: 100px">
						<img class="mx-auto" src="image/icon/basket3.svg"
							style="width: 100px; height: 100px;"></img>
					</div>
					<div class="row">
						<label class="mx-auto"
							style="margin-top: 20px; margin-bottom: 100px">주문내역이 없습니다</label><br>
					</div>
				</c:if>
				<c:if test="${!empty list}">
				<c:forEach var="list" items="${list}">
				<div class="orderinfo">
					<span class="line">
						<label>주문일 : <b>
							<fmt:formatDate value="${list.reg}" pattern="yyyy/MM/dd"/>
						</b></label>
					</span>
					<span>
						<label>주문번호 : <b>${list.num}</b></label>
					</span>
					<span style="float:right;">
						<label>
							<a class="blue" href="BuyHistoryDetail?num=${list.num}">주문상세보기></a>
						</label>
					</span>
				</div>
				<table class="ordertable">
					<tr height="100">
						<td align="center" width="130" style="border-right:0;">
							<img style="width: 70px; height: 70px;"
							src="image/newbalance/${list.category}/${list.productname}/${list.productname}_1.jpg">
						</td>
						<td style="border-left:0;">
							<label class="big"><b>
								<a href="Detail?productname=${list.productname}">${list.productname}</a>
							</b></label>
							<br>
							<label class="normal">사이즈:${list.shoesize}</label>
						</td>
						<td align="center" width="120">
							<fmt:formatNumber value="${list.price}" pattern="#,###" />원
						</td>
						<td align="center" width="120">
							<fmt:formatNumber value="${list.save}" pattern="#,###" />p
							<c:if test="${list.savestate eq 0}">
								<br><label class="normal">적립예정</label>
							</c:if>
							<c:if test="${list.savestate eq 1}">
								<br><label class="normal">적립완료</label>
							</c:if>
						</td>
						<td align="center" width="120">
							<c:if test="${list.state eq 2}">
								<label>배송완료</label>
							</c:if>
							<c:if test="${list.state eq 1}">
								<label>배송중</label>
							</c:if>
							<c:if test="${list.state eq 0}">
								<label>상품준비중</label>
							</c:if>
						</td>
						<td align="center" width="120">
							<c:if test="${list.state != 0}">
								<a class="smallbtn2">취소불가</a>
							</c:if>
							<c:if test="${list.state eq 0}">
								<a class="smallbtn" href="OrderCancel?num=${list.num}">주문취소</a>
							</c:if><br><br>
							<c:if test="${list.review != '0'}">
								<a class="smallbtn2">작성완료</a>
							</c:if> <c:if test="${list.review eq '0'}">
								<a class="smallbtn" href="Review?num=${list.num}">후기작성</a>
							</c:if>
							
						</td>
					</tr>
				</table>
				<br>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>