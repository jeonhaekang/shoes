<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>

<script>
	function checkValue() {
		if ($(':radio[name="score"]:checked').length < 1) {
			alert("평점을 선택하세요");
			return false;
		}
		if (!document.userInfo.title.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if (!document.userInfo.content.value) {
			alert("내용을 입력하세요");
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
				<%@ include file="MyPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">후기작성</label>
				</div>
				<br>
				<form name="userInfo" action="ReviewWrite?num=${buynum}"
					method="post" class="qnaform" onsubmit="return checkValue();">


					<table class="basictable">
						<tr class="listth listtd">
							<th width="150px">상품이미지</th>
							<td><img class="form-control"
								style="width: 150px; height: 150px;"
								src="image/newbalance/${data.category}/${data.productname}/${data.productname}_1.jpg"></td>
						</tr>
						<tr class="listth listtd">
							<th>별점</th>
							<td style="line-height: 50px">
							<c:forEach var="i" begin="1" end="5" step="1">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="score"
										id="score${i}" value="${i}"> <label
										class="form-check-label" for="score${i}">${i}점</label>
								</div>
							</c:forEach>
							</td>
						</tr>
						<tr class="listth listtd">
							<th>상품명</th>
							<td style="line-height: 50px">
								<input type="text" class="form-control" readonly="readonly"
									style="background-color: white;" placeholder="이름을 입력해주세요"
									name="name" value="${data.productname}">
							</td>
						</tr>
						<tr class="listth listtd">
							<th>사이즈</th>
							<td style="line-height: 50px">
								<input type="text" class="form-control" readonly="readonly"
									style="background-color: white;" placeholder="이름을 입력해주세요"
									name="shoesize" value="${data.shoesize}">
							</td>
						</tr>
						<tr class="listth listtd">
							<th>제목</th>
							<td style="line-height: 50px">
								<input type="text" class="form-control" placeholder="제목을 입력해주세요"
								name="title">
							</td>
						</tr>
						<tr class="listth listtd">
							<th>내용</th>
							<td style="line-height: 50px">
								<textarea class="col-12 textarea" rows="5" style="line-height: 20px;"
								placeholder="내용을 입력해주세요" name="content"></textarea>
							</td>
						</tr>
					</table><br>
					<div class="text-center">
						<button type="submit" class="btn btntd">작성하기</button>
					</div>
					<br>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>