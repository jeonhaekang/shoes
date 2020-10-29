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
	$(document).ready(function(){
	    $("#checkall").click(function(){
	        if($("#checkall").prop("checked")){
	            $(".check").prop("checked",true);
	        }else{
	            $(".check").prop("checked",false);
	        }
	    })
	})
	 function popup(name){
         var url = "Stock?name="+name;
         var name = "popup test";
         var option = "width = 500, height = 200, top = 100, left = 700, location = no"
         window.open(url, name, option);
     }


	$(function() {
		$('.go').on('click', function() {
			var id = $(this).attr('id');
			if (id == 'del') {
				if ($('input[name=select]').is(":checked") == false) {
					alert("상품을 선택해주세요");
					return false;
				} else {
					form.action = 'ProductDelete';
				}
			} else if (id == 'search') {
				if(!document.form.keyword.value){
					alert("검색어를 입력하세요");
					return false;
				} else {
					form.action = 'ProductList';
				}
			}
		});
	});

	function fn_paging(curPage) {
		location.href = "ProductList?curPage=" + curPage;
	}
</script>
</head>
<body class="site">
	<%@ include file="../include/nav.jsp"%>
	<div class="wrap Site-content">
		<div class="row">
			<div class="col-2 listnav">
				<%@ include file="AdminPageNav.jsp"%>
			</div>
			<div class="col-10">
				<div class="p0">
					<br>
					<span>
						<label class="pagetitle godic m0">상품목록</label> <label class="normal gray">(${pagination.listCnt})</label>
					</span>
				</div><br>
				<form name="form" method="get">
					<div style="margin-bottom:10px;">
						<select name="category" class="searchselect">
							<option value="num">상품번호</option>
							<option value="name">상품명</option>
						</select>
						<input class="searchinput" name="keyword" type="text" placeholder="상품검색" />
						<input type="submit" class="graybtn go" id="search" value="검색">
						<input type="submit" class="graybtn go" id="del" value="선택한 상품 삭제">
					</div>
					<table class="basictable" id="contents">
						<tr height="40px" class="nonlistth tr">
							<th width="100"><input type="checkbox" id="checkall"></th>
							<th width="100">상품번호</th>
							<th width="100">상품명</th>
							<th width="100">상품가격</th>
							<th width="100">카테고리</th>
							<th width="200">상태</th>
							<th width="100">재고보기</th>
							<th>수정</th>
						</tr>
						<c:forEach var="list" items="${list}">
							<tr class="text-center show listtd tr" height="30px">
								<td>
									<input type="checkbox" value="${list.num}" class="check" name="select">
								</td>
								<td>${list.num}</td>
								<td>${list.name}</td>
								<td><fmt:formatNumber value="${list.price}" pattern="#,###" /></td>
								<td>
									<c:if test="${list.category eq 1 }">
										<label>남성신발</label>
									</c:if>
									<c:if test="${list.category eq 2 }">
										<label>여성신발</label>
									</c:if>
								</td>
								<td>
								<c:if test="${list.arrival != 0 }">
									<label class="new">NEW</label>
								</c:if>
								<c:if test="${list.best != 0 }">
									<label class="best">BEST</label>
								</c:if>
								<c:if test="${list.category eq 1 }">
									<label class="men">MEN</label>
								</c:if>
								<c:if test="${list.category eq 2 }">
									<label class="women">WOMEN</label>
								</c:if>
								</td>
								<td><a href="javascript:popup('${list.name}')">보기</a></td>
								<td><a
									href="ProductModify?name=${list.name}" role="button"
									class="btn btn-warning"
									style="padding: 2px 4px; font-size: 12px">수정</a>
								</td>
							</tr>
						</c:forEach>
					</table><br>
				</form>
				<br>
				
				<c:if test="${keyword == null}">
				<div class="row">
					<ul class="pagination pagination-sm mx-auto">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous" onClick="fn_paging(1)"> <span aria-hidden="true">처음</span></a>
						</li>
						<c:if test="${pagination.curPage ne 1}">
	                        <a class="page-link" href="#" onClick="fn_paging('${pagination.prevPage }')">이전</a> 
	                    </c:if>
						<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
							<c:choose>
								<c:when test="${pageNum eq  pagination.curPage}">
									<li class="page-item Active"><a class="page-link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	                        <a class="page-link" href="#" onClick="fn_paging('${pagination.nextPage }')">다음</a> 
	                    </c:if>
						<li class="page-item">
	                        <a class="page-link" href="#" onClick="fn_paging('${pagination.pageCnt }')">마지막</a> 
						</li>
					</ul>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>