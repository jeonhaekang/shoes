<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyPage</title>
</head>
<body class="Site">
	<div class="wrap">
		<br>
		<a href="Main">
			<img src="image/icon/title.png" width="200px">
		</a>
	</div>
	
	<div class="wrap Site-content">
		<div class="p0 buytitle">
			<label class="pagetitle godic m0">주문/결제</label>
		</div><br>
		<form name="userInfo" action="BuyExcuteAction" method="post"
			onsubmit="return checkValue();">
			<label class="minititle">구매자정보</label>
			<table class="graytable">
				<tr class="graylistth listtd">
					<th class="text-right" width="150px">이름</th>
					<td><input readonly="readonly" class="buyinput"
						value="${ data.name }" name="name"></td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">이메일</th>
					<td><input readonly="readonly" class="buyinput"
						value="${ data.email }" name="email"></td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">핸드폰</th>
					<td><input readonly="readonly" class="buyinput"
						value="${ data.phone }" name="phone"></td>
				</tr>
			</table>
			<label class="minititle">받는사람 정보</label>
			<table class="graytable">
				<tr class="graylistth listtd">
					<th class="text-right" width="150px">이름</th>
					<td><input readonly="readonly" class="buyinput"
						value="${ data.name }" name="add_name"></td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">핸드폰</th>
					<td><input readonly="readonly" class="buyinput"
						value="${ data.phone }" name="add_phone"></td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">주소</th>
					<td><input readonly="readonly" class="buyinput" size="120"
						value="${ data.address }" name="add_address"></td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">배송 요청사항</th>
					<td>
						<input type="text" class="form-control infoinput"
						placeholder="예)부재시 경비실에 맡겨주세요" name="add_message">
					</td>
				</tr>
			</table>
			
			<label class="minititle">상품목록</label>
			<table class="graytable graylistth">
				<tr>
					<th>상품</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>상품가격</th>
				</tr>
				<c:set var="sum" value="0" />
				<c:forEach var="list" items="${list}">
					<tr class="list">
						<td><img style="width: 70px; height: 70px;"
							src="image/newbalance/${list.category}/${list.name}/${list.name}_1.jpg"></td>
						<td>${list.name}</td>
						<td>${list.shoesize}</td>
						<td>
							<fmt:formatNumber value="${list.price-((list.price/100)*list.sale)}" pattern="#,###" />
							<c:set var="sum" value="${sum + (list.price-((list.price/100)*list.sale))}" />
						</td>
					</tr>
				</c:forEach>
			</table>
			
			
			<label class="minititle">결제정보</label>
			<table class="graytable">
				<tr class="graylistth listtd">
					<th class="text-right" width="150px">총상품가격</th>
					<td>
						<b><fmt:formatNumber value="${sum}" pattern="#,###" /></b>
					</td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right" width="150px">등급할인</th>
					<td>
						<p class="normal">${ data.sale }%</p>
					</td>
					<c:set var="sum" value="${sum - ((sum/100)*data.sale)}" />
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">총결제금액</th>
					<td>
						<b><fmt:formatNumber value="${sum}" pattern="#,###" /></b>
					</td>
				</tr>
				<tr class="graylistth listtd">
					<th class="text-right">결제방법</th>
					<td style="line-height: 30px;">
						<div class="form-check form-check-inline normal">
							<input class="form-check-input" type="radio" name="pay"
								id="inlineRadio1" value="카드"> <label
								class="form-check-label" for="inlineRadio1">신용/체크카드</label>
						</div>
						<div class="form-check form-check-inline normal">
							<input class="form-check-input" type="radio" name="pay"
								id="inlineRadio2" value="무통장"> <label
								class="form-check-label" for="inlineRadio2">무통장입금(가상계좌)</label>
						</div>
						<div class="form-check form-check-inline normal">
							<input class="form-check-input" type="radio" name="pay"
								id="inlineRadio3" value="실시간"> <label
								class="form-check-label" for="inlineRadio3">실시간 계좌이체</label>
						</div>
						<div class="form-check form-check-inline normal">
							<input class="form-check-input" type="radio" name="pay"
								id="inlineRadio4" value="휴대폰"> <label
								class="form-check-label" for="inlineRadio4">휴대폰</label>
						</div>
					</td>
				</tr>
			</table>
			<div class="text-center">
				<button type="submit" class="btn paybtn">결제하기</button>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>