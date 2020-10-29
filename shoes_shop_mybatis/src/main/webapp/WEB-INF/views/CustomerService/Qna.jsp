<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkValue() {
		if (document.userInfo.category.value == "noSelect") {
			alert("문의 유형을 선택하세요.");
			return false;
		}
		if (!document.userInfo.writer.value) {
			alert("작성자를 입력하세요.");
			return false;
		}
		if (!document.userInfo.email.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.phone.value) {
			alert("핸드폰번호를 입력하세요.");
			return false;
		}
		if (!document.userInfo.title.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.userInfo.content.value) {
			alert("문의내용을 입력하세요.");
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
				<%@ include file="CustomerServiceNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">1:1문의</label>
				</div>
				<br>
				<form name="userInfo" action="QnaAction" method="post"
					 onsubmit="return checkValue();">
					 
					 <table class="basictable">
						<tr>
							<td class="titletd" width="200px">옵션</td>
							<td class="contenttd">
								<select class="form-control" name="category">
									<option selected="selected" value="noSelect">문의 유형 선택</option>
									<option value="교환">교환</option>
									<option value="환불">환불</option>
									<option value="취소">취소</option>
									<option value="주문">주문/결제</option>
									<option value="입고">입고문의</option>
									<option value="신고">신고</option>
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titletd">작성자</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="이름을 입력해주세요"
								name="writer">
							</td>
						</tr>
						<tr>
							<td class="titletd">이메일</td>
							<td class="contenttd">
								<input value="${ data.email }" type="email" class="form-control"
								placeholder="이메일" name="email">
							</td>
						</tr>
						<tr>
							<td class="titletd">핸드폰</td>
							<td class="contenttd">
								<input value="${ data.phone }" type="text" class="form-control"
								placeholder="전화번호(숫자만 입력하세요)" name="phone">
							</td>
						</tr>
						<tr>
							<td class="titletd">제목</td>
							<td class="contenttd">
								<input type="text" class="form-control" placeholder="제목을 입력해주세요"
								name="title">
							</td>
						</tr>
						<tr>
							<td class="titletd">문의내용</td>
							<td class="contenttd">
								<textarea class="col-12 textarea" rows="10"
								placeholder="내용을 입력해주세요" name="content"></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="submit" class="btn btntd">작성하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>