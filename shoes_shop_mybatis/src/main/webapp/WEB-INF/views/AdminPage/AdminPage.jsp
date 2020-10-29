<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>AdminPage</title>
</head>
<body class="Site">
	<%@ include file="../include/nav.jsp"%>
	<div class="wrap Site-content">
	<table class="admintable">
		<tr>
			<td width="300px">
				<a href="UserList">
					<img src="image/icon/userlist.png" width="100px">
					<label>회원목록</label>
				</a>
			</td>
			<td width="300px">
				<a href="AddProduct">
					<img src="image/icon/productadd.png" width="100px">
					<label>상품추가</label>
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="ProductList?ea=10">
					<img src="image/icon/productlist.png" width="100px">
					<label>상품목록</label>
				</a>
			</td>
			<td>
				<a href="QnaList">
					<img src="image/icon/answer.png" width="100px">
					<label>질문답변</label>
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="OrderList">
					<img src="image/icon/orderlist.png" width="100px">
					<label>주문정보</label>
				</a>
			</td>
		</tr>
	</table>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
