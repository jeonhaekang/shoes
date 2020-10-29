<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Insert</title>
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
					<br> <label class="pagetitle godic m0">FAQ작성</label>
				</div>
				<br>
				<form name="userInfo" action="FaqInsertAction"
					method="get" onsubmit="return checkValue();">
					<br>
					
					<table class="basictable">
					<tr>
						<td class="titletd" width="200px">제목</td>
						<td class="contenttd">
							<input type="text" class="form-control" placeholder="제목" 
							name="title">
						</td>
					</tr>
					<tr>
						<td class="titletd">내용</td>
						<td class="contenttd">
							<textarea class="form-control" placeholder="내용" rows="3"
							name="content"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div class="text-center">
					<button type="submit" class="btn btntd">비밀번호 변경</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>sp"%>
</body>
</html>