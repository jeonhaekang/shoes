<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/linkFile.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ProductList</title>
<script>
	function check() {
		var result = confirm("정말 삭제하시겠습니까?");
		return result;
	}
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
	$(document).ready(function() {
		$("#checkall").click(function() {
			if ($("#checkall").prop("checked")) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		})
	})
	$(function() {
		$('.go').on('click', function() {
			var id = $(this).attr('id');
			if (id == 'state') {
				if($('input[name=select]').is(":checked") == false){
	   				alert("주문내역을 선택해주세요");
	   				return false;
	   			} else {
	   				form.action = 'OrderStateChange?count=${i}&ea=${ea}&keyword=${keyword}&category=${category}';
	   	   	   	}
			} else if (id == 'search') {
				form.action = 'OrderList';
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
				<%@ include file="AdminPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br> <label class="pagetitle godic m0">주문내역</label> <label
						class="normal gray">(${fn:length(list)})</label>
				</div><br>
			<form name="form">
				<div style="margin-bottom:10px;">
					<span>
						<select name="category" class="searchselect">
							<option value="num" selected="selected">주문번호</option>
							<option value="productname">상품명</option>
							<option value="name">이름</option>
						</select>
						<input class="searchinput" name="keyword" type="text" placeholder="상품검색" />
						<input type="submit" class="graybtn go" id="search" value="검색">
					</span>
					<span style="float:right;">
						<select onchange="window.location.href=this.value" class="normal">
							<option>표시수</option>
							<option value="OrderList?ea=5">5개</option>
							<option value="OrderList?ea=30">30개</option>
						</select>
						<select name="state" class="normal">
							<option value="0">배송전</option>
							<option value="1">배송중</option>
							<option value="2">배송완료</option>
						</select>
						<input type="submit" class="graybtn go" id="state" value="변경">
					</span>
				</div>
				
				<c:if test="${empty list}">
					<div class="row text-center" style="margin-top: 100px">
						<img class="mx-auto" src="image/icon/basket3.svg"
							style="width: 100px; height: 100px;"></img>
					</div>
					<div class="row">
						<label class="mx-auto"
							style="margin-top: 20px; margin-bottom: 100px">주문내역이 없습니다</label><br>
					</div>
				</c:if>
					<c:if test="${!empty list}">
						<table class="basictable" id="contents">
							<tr class="tr nonlistth" height="40px">
								<th width="30"><input type="checkbox" id="checkall"></th>
								<th>주문번호</th>
								<th>아이디</th>
								<th>상품</th>
								<th>상품명</th>
								<th>사이즈</th>
								<th>상품가격</th>
								<th>결제수단</th>
								<th>결제날짜</th>
								<th>상태</th>
								<th>수정</th>
							</tr>
							<c:forEach var="list" items="${list}">
								<tr class="show tr listtd text-center">
									<td>
										<input type="checkbox" value="${list.num}" class="check" name="select">
									</td>
									<td>${list.num}</td>
									<td>${list.id}</td>
									<td><img
										style="width: 70px; height: 70px;"
										src="image/newbalance/${list.category}/${list.productname}/${list.productname}_1.jpg"></td>
									<td><a
										href="Detail?productname=${list.productname}">${list.productname}</a></td>
									<td>${list.shoesize}</td>
									<td><fmt:formatNumber
											value="${list.price}" pattern="#,###" /></td>
									<td>${list.pay}</td>
									<td><fmt:formatDate value="${list.reg}" pattern="yyyy.MM.dd"/></td>
									<td>
										<c:if test="${list.state eq 2}">
											<a class="delbtn backblue2" style="color: white;">배송완료</a>
										</c:if>
										<c:if test="${list.state eq 1}">
											<a class="delbtn backorange" style="color: white;">배송중</a>
										</c:if>
										<c:if test="${list.state eq 0}">
											<a class="delbtn white" style="color: white;">배송전</a>
										</c:if>
									</td>
									<td>
										<a class="smallbtn" href="OrderModify?num=${list.num}">정보수정</a>
									</td>
								</tr>
								<tr class="hide tr listtd listth">
									<td colspan="10">
										<table class="basictable" style="width: 100%">
											<tr>
												<th colspan="2" width="100px">구매자 정보</th>
												<th colspan="2">도착지 정보</th>
											</tr>
											<tr>
												<th>이름</th>
												<td width="100px">${list.name}</td>
												<th>이름</th>
												<td>${list.add_name}</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td>${list.email}</td>
												<th>연락처</th>
												<td>${list.add_phone}</td>
											</tr>
											<tr>
												<th>연락처</th>
												<td>${list.phone}</td>
												<th>주소</th>
												<td>${list.add_address}</td>
											</tr>
											<tr>
												<th>메세지</th>
												<td colspan="3">${list.add_message}</td>
											</tr>
										</table>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</form>
				<br>
				<ul class="pagination pagination-sm" style="margin-left:400px">
					<c:forEach var="i" begin="1" end="${page}" step="1">
						<c:if test="${count eq i}">
							<li class="page-item Active">
								<a class="page-link" 
								href="OrderList?count=${i}&ea=${ea}&keyword=${keyword}&category=${category}">${i}</a>
							</li>
						</c:if>
						<c:if test="${count != i}">
							<li class="page-item">
								<a class="page-link" 
								href="OrderList?count=${i}&ea=${ea}&keyword=${keyword}&category=${category}">${i}</a>
							</li>	
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>