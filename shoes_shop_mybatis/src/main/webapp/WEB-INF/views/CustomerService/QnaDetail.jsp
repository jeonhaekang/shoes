<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변보기</title>
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
					<br> <label class="pagetitle godic m0">답변보기</label>
				</div>
				<br>
				<table class="basictable">
					<tr class="listtd listth">
						<th width="100px">문의번호</th>
						<td width="100px">${data.num}</td>
						<th width="100px">분류</th>
						<td width="100px">${data.category}</td>
						<th width="100px">작성자</th>
						<td>${data.writer}</td>
					</tr>
					<tr class="listtd listth">
						<th>제목</th>
						<td colspan="5">${data.title}</td>
					</tr>
					<tr class="listtd listth">
						<th>문의내용</th>
						<td colspan="5">
							<textarea class="faqarea" readonly="readonly" rows="10"
							>${data.content}</textarea>
						</td>
					</tr>
					<tr class="listtd listth">
						<th>답변</th>
						<td colspan="5">
							<textarea class="faqarea" readonly="readonly" rows="10"
							>${data.answer}</textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>