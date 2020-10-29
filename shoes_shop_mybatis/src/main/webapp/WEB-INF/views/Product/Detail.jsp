<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<%
boolean sessionID;
if(session.getAttribute("sessionID") == null){
	sessionID = false;
} else {
	sessionID = true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>${data.name}</title>
<script>
$(function () {
	 $('.go').on('click',function(){
		var size = $('.size').val();
			if(size=='noSelected'){
				alert("상품을 선택해주세요");
				return false;
			} else if(size=='stockNull'){
				alert("재고가 없는 상품입니다")
				return false;
			}
		<% 
		if(session.getAttribute("sessionID") == null){
		%>
			alert("로그인해야 사용이 가능합니다")
			return false;
		<%
		}
		%>
		var id = $(this).attr('id');
		if(id == 'basket'){
			form.action = 'BasketAction';
		} else {
			form.action = 'BuyBtn';
		}
	 });
});


	
	$(function () {
		 $('.smallimg').on('click',function(){
			var id = $(this).attr('id');
			$('#mainimg').attr('src','image/newbalance/${data.category}/${data.name}_'+id+'.jpg')
		 });
	});

	$(function() {
		$('#contents .hide').hide();
		$('#contents .show').click(function() {
			var tr = $('#contents .tr');
			var rindex = $(this).parent().children().index(this);
			if($(tr[rindex + 1]).css("display") == "none"){
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
	<div class="wrap Site-content" style="margin-top: 20px">
		<div class="row">
			<div class="col-md-7">
				<img src="image/newbalance/${data.category}/${data.name}_1.jpg" style="width: 100%" id="mainimg">
				<div class="text-center">
				<c:forEach var="i" begin="1" end="5" step="1">
					<input type="button" id="${i}" class="smallimg img-thumbnail"
					style="background-image: url('image/newbalance/${data.category}/${data.name}_${i}.jpg');">
				</c:forEach>
				</div>
			</div>
			<div class="col-md-5">
				<div style="border-bottom: 1px solid rgb(200, 200, 200)">
					<h3 class="godic">${data.name}</h3>
					<c:if test="${data.arrival != 0 }">
						<label class="new">NEW</label>
					</c:if>
					<c:if test="${data.best != 0 }">
						<label class="best">BEST</label>
					</c:if>
					<c:if test="${data.category eq 1 }">
						<label class="men">MEN</label>
					</c:if>
					<c:if test="${data.category eq 2 }">
						<label class="women">WOMEN</label>
					</c:if>
					<p class="godic">
						<fmt:formatNumber value="${data.price}" pattern="#,###" />원
					</p>
				</div>
				<form name="form" onsubmit="return basket()" 
					style="width: 100%; clear: both; margin-top: 20px">
					<input type="hidden" value="${data.name}" name="name">
					<div>
						<div class="form-group">
							<select class="form-control size" name="size">
								<option selected="selected" value="noSelected">사이즈를 선택해주세요</option>
								<% int a = 0; %>
								<c:if test="${data.category eq 1}">
									<c:if test="${data.size250 > 0}">
										<option value="250">250</option>
										<% a++; %>
									</c:if>
									<c:if test="${data.size260 > 0}">
										<option value="260">260</option>
										<% a++; %>
									</c:if>
									<c:if test="${data.size270 > 0}">
										<option value="270">270</option>
										<% a++; %>
									</c:if>
									<% if(a==0){ %>
										<option value="stockNull">모든 사이즈의 재고가 없습니다</option>
									<% } %>
								</c:if>
								<c:if test="${data.category eq 2}">
									<c:if test="${data.size220 > 0}">
										<option value="220">220</option>
										<% a++; %>
									</c:if>
									<c:if test="${data.size230 > 0}">
										<option value="230">230</option>
										<% a++; %>
									</c:if>
									<c:if test="${data.size240 > 0}">
										<option value="240">240</option>
										<% a++; %>
									</c:if>
									<% if(a==0){ %>
										<option value="stockNull">모든 사이즈의 재고가 없습니다</option>
									<% } %>
								</c:if>
							</select>
						</div>
					</div>
					<div style="margin-top: 10px">
						<span class="float-left"> <img src="image/icon/truck.svg">
							배송비
						</span> <span class="float-right">0원</span>
					</div>
					<div style="clear: both;">
						<span class="float-left"> <img src="image/icon/cash-stack.svg">
							상품금액
						</span> <span class="float-right"><fmt:formatNumber value="${data.price}" pattern="#,###" />원</span>
					</div>
					<div style="clear: both;">
					<br><br><br><br><br><br>
						<span class="float-right">
							<c:if test="${data.sale != 0 }">
								<label class="normal big godic">${data.sale}%</label>
								<label class="gray small godic" style="text-decoration:line-through;">
									<fmt:formatNumber value="${data.price}" pattern="#,###" />원
								</label><br>
								<label class="godic" style="font-size:30px;">
									<fmt:formatNumber value="${data.price-((data.price/100)*data.sale)}" pattern="#,###" />원
								</label>
							</c:if>
							<c:if test="${data.sale == 0 }">
								<label class="godic" style="font-size:30px;">
									<fmt:formatNumber value="${data.price}" pattern="#,###" />원
								</label>
							</c:if>
						</span>
						<br>
					</div>
					<br> <label style="font-size: 12px; color: gray;">배송문의
						및 기타 문의사항은 1:1게시판으로 문의 주시기 바랍니다</label>
					<div style="border-top: 2px solid rgb(70, 70, 70);"></div>
						<input type="submit" class="btn basketbtn go" id="basket" value="장바구니">
						<input type="submit" class="btn buybtn go white" id="buy" value="구매하기">
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-6">
					<br> <label class="big godic m0">리뷰수</label><label
						class="normal gray">(${fn:length(list)})</label>
					</div>
					<c:if test="${!empty list}">
						<div class="col-6 text-right">
						<c:forEach var="list" items="${list}">
							<c:set var="score" value="${score+list.score}" />
						</c:forEach>
						<br> <label class="godic"> 평점 : </label>
							<c:set var="sum" value="0"/>
							<c:forEach var="list" begin="1" end="${score/fn:length(list)}" step="1">
							<c:set var="sum" value="${sum+1}"/>
								<img src="image/icon/star.png" width="20" style="margin-bottom:5px;">
							</c:forEach>
							<c:forEach var="star" begin="${sum}" end="4" step="1">
								<img src="image/icon/star2.png" width="20" style="margin-bottom:5px;">
							</c:forEach>
						</div>
					</c:if>
				</div>
				<c:if test="${empty list}">
				<hr>
					리뷰가 없습니다
				<hr>
				</c:if>
				<c:if test="${!empty list}">
				<table class="table faq" id="contents">
					<tr class="tr">
						<th class="backgray" style="width:150px">작성자</th>
						<th class="backgray" style="width:100px">별점</th>
						<th class="backgray">제목</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr class="show tr">
							<td align="center">${list.id}님</td>
							<td align="center">
							<c:set var="sum" value="0"/>
							<c:forEach var="star" begin="1" end="${list.score}" step="1">
								<c:set var="sum" value="${sum+1}"/>
								<img src="image/icon/star.png" width="12" >
							</c:forEach>
							<c:forEach var="star" begin="${sum}" end="4" step="1">
								<img src="image/icon/star2.png" width="12" >
							</c:forEach>
							</td>
							<td class="title2">${list.title}</td>
						</tr>
						<tr class="hide tr">
							<td></td>
							<th>내용</th>
							<td class="conts"><pre class="faqcontent"
									style="font-size: 12px;">${list.content}</pre></td>
						</tr>
					</c:forEach>
				</table>
				<br><br><br><br>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>