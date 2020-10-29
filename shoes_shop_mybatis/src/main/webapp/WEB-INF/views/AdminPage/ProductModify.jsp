<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ProductModify</title>
<script type="text/javascript">
	function checkValue() {
		if (!document.userInfo.name.value) {
			alert("상품명을 입력하세요.");
			return false;
		}

		if (!document.userInfo.price.value) {
			alert("상품가격을 입력하세요.");
			return false;
		}

		if (document.userInfo.category.value == "noSelect") {
			alert("분류를 선택하세요.");
			return false;
		}
	}
</script>

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
					<br> <label class="pagetitle godic m0">상품정보 수정</label>
				</div>
				<br>
				<form name="userInfo" action="ProductModifyAction" method="post"
					onsubmit="return checkValue();">
					
					
					<table class="basictable">
						<tr>
							<td class="titletd" width="200px">상품명</td>
							<td class="contenttd">
								<input id="input_userId" type="text" class="form-control"
								placeholder="상품명" name="name" value="${data.name}">
							</td>
						</tr>
						<tr>
							<td class="titletd">상품가격</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="상품가격"
								name="price" value="${data.price}">
							</td>
						</tr>
						<c:if test="${data.category eq 2}">
						<tr>
							<td class="titletd">사이즈220</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="size220"
									name="size220" value="${data.size220}">
							</td>
						</tr>
						<tr>
							<td class="titletd">사이즈230</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="size230"
									name="size230" value="${data.size230}">
							</td>
						</tr>
						<tr>
							<td class="titletd">사이즈240</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="size240"
									name="size240" value="${data.size240}">
								<input name="size250" type="hidden" value="0" />
								<input name="size260" type="hidden" value="0" />
								<input name="size270" type="hidden" value="0" />
							</td>
						</tr>
						</c:if>
						<c:if test="${data.category eq 1}">
							<tr>
								<td class="titletd">사이즈250</td>
								<td class="contenttd">
									<input type="text" class="form-control" placeholder="size250"
										name="size250" value="${data.size250}">
								</td>
							</tr>
							<tr>
								<td class="titletd">사이즈260</td>
								<td class="contenttd">
									<input type="text" class="form-control" placeholder="size260"
										name="size260" value="${data.size260}">
								</td>
							</tr>
							<tr>
								<td class="titletd">사이즈270</td>
								<td class="contenttd">
									<input type="text" class="form-control" placeholder="size270"
										name="size270" value="${data.size270}">
								</td>
							</tr>
						</c:if>
							<tr>
								<td class="titletd">분류</td>
								<td class="contenttd">
									<select class="form-control" name="category">
										<option selected="selected" value="noSelect">분류를 선택해주세요</option>
										<option value=1>남성신발</option>
										<option value=2>여성신발</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="titletd">상태</td>
								<td class="contenttd">
									<div class="form-check" 
										style="display: inline-block; margin-right: 20px;">
										<input class="form-check-input" type="checkbox" value=1
											id="defaultCheck1" name="arrival"> <label
											class="form-check-label" for="defaultCheck1">신상품</label>
									</div>
									<div class="form-check"
										style="display: inline-block; margin-right: 20px;">
										<input class="form-check-input" type="checkbox" value=1
											id="defaultCheck2" name="best"> <label
											class="form-check-label" for="defaultCheck2">BEST</label>
									</div>
									<div class="form-check"
										style="display: inline-block; margin-right: 20px;">
										<input class="form-check-input" type="checkbox" value=1
											id="defaultCheck3" name="sale"> <label
											class="form-check-label" for="defaultCheck3">SALE</label>
									</div>
								</td>
							</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">상품정보 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>