<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function searchchk() {
		if (!document.searchform.search.value) {
			alert("검색어를 입력하세요.");
			return false;
		}

	}

	
	$(function(){
		$('.logincheck').on('click',function(){
			var page = $(this).attr('id');
			if(${sessionID != null}){
				if(page=='basket')
					location.href="Basket";
				else if(page=='MyPage')
					location.href="MyPage";
			} else {
				alert("로그인해야 사용 가능합니다");
			}
		});
	});
</script>
<div class="subnav">
	<div class="wrap">
		<!-- wrap -->
		<div class="row">
			<div class="col-6">
				<ul class="subnavul">
					<c:choose>
						<c:when test="${sessionID != null}">
							<li><a href="Logout">로그아웃</a></li>
							<li><a href="MyInfo">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="Login">로그인</a></li>
							<li><a href="Join">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="col-6">
				<ul class="subnavul text-right">
					<li><img class="peopleicon login" src="image/icon/cart3.svg">
						<a href="#" id='basket' class="logincheck" onclick="logincheck();">장바구니</a></li>
					<li><a href="CustomerService">고객센터</a></li>
				</ul>
			</div>
		</div>

	</div>
</div>
<div class="wrap">
<br>
	<!-- wrap -->
	<nav class="mainnav">
		<!-- mainnav -->
		<ul class="navul">
			<!-- navul -->
			<a href="Main"><img src="image/icon/title.png"></a>
			<li><form name="searchform" class="searchform"
					action="SearchAction" method="post" onsubmit="return searchchk();">
					<div class="searchbox">
						<input size="50" name="search" class="searchtext" type="search"
							placeholder="검색어를 입력하세요" aria-label="Search">
						<button type="submit" class="searchbtn">
							<img src="image/icon/search.png" width="30px"></img>
						</button>
					</div>
				</form></li>
		</ul>
		<!-- navul -->
	</nav>
	<!-- mainnav -->
</div>
<!-- wrap -->
<div class="categorynav">
	<!-- categorynav -->
	<div style="width: 500px; margin: 0 auto">
		<ul class="categoryul">
			<!-- categorynul -->
			<li><a href="All?page=sale">세일상품</a></li>
			<li><a href="All?page=new">신상품</a></li>
			<li><a href="All?page=men">남성신발</a></li>
			<li><a href="All?page=women">여성신발</a></li>
			<c:if test="${sessionID eq 'admin'}">
				<li><a href="Admin" class="bold">관리자페이지</a></li>
			</c:if>
		</ul>
		<!-- categorynul -->
	</div>
</div>
<!-- categorynav -->
<div class="message text-center">
	<div class="wrap">
		<img src="image/icon/truck.svg"> <label>오픈기념 무료배송 이벤트 진행중 입니다</label>
	</div>
</div>




