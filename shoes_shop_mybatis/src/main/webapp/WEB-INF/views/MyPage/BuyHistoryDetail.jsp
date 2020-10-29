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
					<br> <label class="pagetitle godic m0">주문상세</label>
				</div><br>
				
				
				
				<div class="orderdetailtitle">
					<span class="line" style="padding-right:10px;">
						<label>주문일 : <b>
							<fmt:formatDate value="${data.reg}" pattern="yyyy/MM/dd"/>
						</b></label>
					</span>
					<span style="padding-left:10px;">
						<label>주문번호 : <b>${data.num}</b></label>
					</span>
				</div>
				<table class="orderdetailtable">
					<tr>
						<td align="center" width="130" style="border-right:0;">
							<img style="width: 70px; height: 70px;"
							src="image/newbalance/${data.category}/${data.productname}/${data.productname}_1.jpg">
						</td>
						<td style="border-left:0;">
							<label class="big"><b>
								<a href="Detail?productname=${data.productname}">${data.productname}</a>
							</b></label>
							<br>
							<label class="normal">사이즈:${data.shoesize}</label>
						</td>
					</tr>
				</table><br><br>
				
				
				<div class="orderdetailtitle">
					<span>
						<label><b>구매자 정보</b></label>
					</span>
				</div>
				<table class="orderdetailtable">
					<tr>
						<td width="100">구매자</td>
						<td><b>${data.name}</b></td>
					</tr>
					<tr>
						<td width="100">이메일</td>
						<td><b>${data.email}</b></td>
					</tr>
					<tr>
						<td width="100">연락처</td>
						<td><b>${data.phone}</b></td>
					</tr>
				</table><br><br>
				
				
				
				<div class="orderdetailtitle">
					<span>
						<label><b>받는사람 정보</b></label>
					</span>
				</div>
				<table class="orderdetailtable">
					<tr>
						<td width="100">받는사람</td>
						<td><b>${data.add_name}</b></td>
					</tr>
					<tr>
						<td width="100">연락처</td>
						<td><b>${data.add_phone}</b></td>
					</tr>
					<tr>
						<td width="100">받는주소</td>
						<td><b>${data.add_address}</b></td>
					</tr>
					<tr>
						<td width="100">배송요청사항</td>
						<td><b>${data.add_message}</b></td>
					</tr>
				</table><br><br>
				
				
				
				<div class="orderdetailtitle">
					<span>
						<label><b>결제정보</b></label>
					</span>
				</div>
				<div class="orderdetailtable">
					<span>
						<label>결제수단</label>
					</span>
					<span>
						<label><b>${data.pay}</b></label>
					</span>
					<span style="float:right;">
						<label><b>결제금액:</b></label>
						<label><b><fmt:formatNumber value="${data.price}" pattern="#,###" />원</b></label>
					</span>
				</div>
				
				<br><br><br>
				
				<div class="text-center">
						<a class="btn btntd white" href="BuyHistory">주문목록 돌아가기</a>
					</div>
				
				
				<br>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
