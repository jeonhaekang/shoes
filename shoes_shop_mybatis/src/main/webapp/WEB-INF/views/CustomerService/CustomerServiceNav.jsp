<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(function () {
	 $('.go').on('click',function(){
		var btn = $(this).attr('id');
		if(${sessionID != null}){
			if(btn == 'qna')
				location.href="Qna";
			 else
				location.href="MyQna";
		} else {
			alert("로그인 해야 사용 가능합니다.");
		}
	 });
});
</script>
<br>
<label class="big bold godic">고객센터</label>
<hr>
<ul class="normal listnavul">
	<li><a href="CustomerService">FAQ</a></li>
	<li><a href="#" class="go" id="qna">1:1문의</a></li>
	<li><a href="#" class="go" id="myqna">나의 문의 내역</a></li>
	<%
		if (session.getAttribute("sessionID") != null) {
		if (session.getAttribute("sessionID").equals("admin")) {
	%>
	<li><a href="FaqInsert">FAQ등록</a></li>
	<%
		}
	}
	%>
</ul>