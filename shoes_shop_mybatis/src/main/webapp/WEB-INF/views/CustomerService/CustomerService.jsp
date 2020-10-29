<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>customerService</title>
<script>
	$(function() {
		$('#contents .hide').hide();
		$('#contents .show').click(function() {
			var tr = $('#contents .tr');
			var rindex = $(this).parent().children().index(this);
			if ($(tr[rindex + 1]).css("display") == "none") {
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
				<%@ include file="CustomerServiceNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">자주 묻는 질문</label>
				</div>
				<br>
				<table class="basictable" id="contents">
					<tr class="tr listth" height="40px">
						<th>번호</th>
						<th>제목</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr class="show tr listtd" height="40px">
							<td align="center">${list.num}</td>
							<td class="title2">${list.title}</td>
						</tr>
						<tr class="hide tr">
							<td></td>
							<td class="conts" colspan="1">
								<textarea class="faqarea" readonly="readonly" rows="8">${list.content}</textarea>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>