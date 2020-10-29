<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황</title>
</head>
<body style="padding:15px;">
	<div class="orderdetailtitle">
		<span style="padding-right: 10px;"> <label>재고현황<b>
					<fmt:formatDate value="${data.reg}" pattern="yyyy/MM/dd" />
			</b></label>
		</span>
	</div>
	<table class="orderdetailtable">
		<tr>
			<td align="center"><label class="normal">사이즈220</label></td>
			<td align="center"><label class="normal">사이즈230</label></td>
			<td align="center"><label class="normal">사이즈240</label></td>
			<td align="center"><label class="normal">사이즈250</label></td>
			<td align="center"><label class="normal">사이즈260</label></td>
			<td align="center"><label class="normal">사이즈270</label></td>
		</tr>
		<tr>
			<td align="center"><label class="normal">${data.size220}EA</label>
			</td>
			<td align="center"><label class="normal">${data.size220}EA</label>
			</td>
			<td align="center"><label class="normal">${data.size230}EA</label>
			</td>
			<td align="center"><label class="normal">${data.size240}EA</label>
			</td>
			<td align="center"><label class="normal">${data.size250}EA</label>
			</td>
			<td align="center"><label class="normal">${data.size260}EA</label>
			</td>
		</tr>
	</table>
</body>
</html>