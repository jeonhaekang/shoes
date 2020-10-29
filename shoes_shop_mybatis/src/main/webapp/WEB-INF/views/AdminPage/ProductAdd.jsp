<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ProductAdd</title>
<script>
	function checkValue() {
		if (!document.userInfo.name.value) {
			alert("상품명을 입력하세요.");
			return false;
		}
		if (!document.userInfo.price.value) {
			alert("상품가격을 입력하세요.");
			return false;
		}
		if (document.userInfo.gender.value == "noSelect") {
			alert("성별을 입력하세요.");
			return false;
		}
	}
</script>
</head>
<body class="Site">
	<%@ include file="../include/nav.jsp"%>
	<!-- section -->
	<div class="wrap Site-content">
		<div class="row">
			<div class="col-2 listnav">
				<%@ include file="AdminPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">상품등록</label>
				</div>
				<br>
				<form name="userInfo" action="AddProductAction" method="post"
					onsubmit="return checkValue();" enctype="multipart/form-data">
					<table class="basictable">
						<tr>
							<td class="titletd" width="200px">상품명</td>
							<td class="contenttd">
								<input id="input_userId" type="text" class="form-control" placeholder="상품명" name="name">
							</td>
						</tr>
						<tr>
							<td class="titletd">상품가격</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="상품가격" name="price">
							</td>
						</tr>
						<tr>
							<td class="titletd">분류</td>
							<td class="contenttd">
								<select class="form-control" name="category">
									<option selected="selected" value="noSelect">성별을 선택해주세요</option>
									<option value=1>남성</option>
									<option value=2>여성</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titletd">이미지</td>
							<td class="contenttd">
								<input type="file" name="filename" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td class="titletd">상태</td>
							<td class="contenttd">
								<div style="display: inline-block; margin-right: 20px;">
									<input type="checkbox" value=1 id="defaultCheck1" name="arrival">
									<label for="defaultCheck1">신상품</label>
								</div>
								<div class="form-check"
									style="display: inline-block; margin-right: 20px;">
									<input type="checkbox" value=1 id="defaultCheck2" name="best">
									<label for="defaultCheck2">BEST</label>
								</div>
								<div class="form-check"
									style="display: inline-block; margin-right: 20px;">
									<input type="checkbox" value=1 id="defaultCheck3" name="sale">
									<label for="defaultCheck3">SALE</label>
								</div>
							</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">상품등록</button>
					</div>
					<br>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>