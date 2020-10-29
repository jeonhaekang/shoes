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
					<br> <label class="pagetitle godic m0">주문정보 수정</label>
				</div>
				<br>
			<form name="userInfo" action="OrderModifyAction" method="post"
			onsubmit="return checkValue();">
				<label class="minititle">구매자정보</label>
				<input type="hidden" name="num" value="${ data.num }">
				<table class="basictable">
					<tr class="listth listtd">
						<th class="text-right" width="150px">이름</th>
						<td><input class="form-control infoinput"
							value="${ data.name }" name="name"></td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">이메일</th>
						<td><input class="form-control infoinput"
							value="${ data.email }" name="email"></td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">핸드폰</th>
						<td><input class="form-control infoinput"
							value="${ data.phone }" name="phone"></td>
					</tr>
				</table>
				
				<label class="minititle">받는사람 정보</label>
				<table class="basictable">
					<tr class="listth listtd">
						<th class="text-right" width="150px">이름</th>
						<td><input class="form-control infoinput"
							value="${ data.name }" name="add_name"></td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">핸드폰</th>
						<td><input class="form-control infoinput"
							value="${ data.phone }" name="add_phone"></td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">주소</th>
						<td><input class="form-control infoinput" size="80"
							value="${ data.add_address }" name="add_address"></td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">배송 요청사항</th>
						<td>
							<input type="text" class="form-control infoinput"
							value="${ data.add_message }"
							placeholder="예)부재시 경비실에 맡겨주세요" name="add_message">
						</td>
					</tr>
					<tr class="listth listtd">
						<th class="text-right">배송상태</th>
						<td style="line-height: 30px;">
							<div class="form-check form-check-inline normal">
								<input class="form-check-input" type="radio" name="state"
									id="inlineRadio1" value=0> <label
									class="form-check-label" for="inlineRadio1">배송전</label>
							</div>
							<div class="form-check form-check-inline normal">
								<input class="form-check-input" type="radio" name="state"
									id="inlineRadio2" value=1> <label
									class="form-check-label" for="inlineRadio2">배송중</label>
							</div>
							<div class="form-check form-check-inline normal">
								<input class="form-check-input" type="radio" name="state"
									id="inlineRadio3" value=2> <label
									class="form-check-label" for="inlineRadio3">배송완료</label>
							</div>
						</td>
					</tr>
				</table>
				<div class="text-center">
					<button type="submit" class="btn paybtn">정보수정</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>