<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>BeautiFly</title>
<c:import url="../common/header.jsp" />

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<script>
	$(document).ready(function() {
		// 메인 페이지로 이동
		$("#btnList").click(function() {
			location.href = "${pageContext.request.contextPath}/index";
		});
	});
</script>


<style>
.list-group-item {
	font-size: 14px;
	color: #000;
}

.topName {
	font-size: 16px;
}

td:hover {
	cursor: pointer;
}

table {
	width: 1000px;
	border: 1px solid #444444;
	border-collapse: collapse;
}

tr, th, td {
	border: 1px solid #444444;
	font-size: 13px;
}

.search-area {
	margin-bottom: 50px;
	padding-bottom: 10px;
	overflow: hidden;
}

.search-area .form-group {
	margin: auto;
	width: 50%;
}

.search-area #searchType {
	width: 150px;
}

.form-group label {
	margin: 7px 0;
	width: 150px;
}

.form-control {
	width: 350px;
}

.inline-block {
	display: inline-block !important;
}

.list-group-item:hover {
	border-bottom: none;
	color: black;
}
</style>

<script>
$(function() {
	$(".td-productName").on("click",function(){
		var productNo = $(this).children("#productNo").val();
		console.log("productNo="+productNo);
		location.href="${pageContext.request.contextPath}/product/productDetailView.do?productNo=" + productNo;
	})
});

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
    $("input[name=chk]").click(function(){
        if($("input[name=chk]").prop("checked")){
            
        } else{
    		// 클릭이 안 되어있으면 전체 선택도 취소
            $("#checkall").prop("checked",false);
        }
    })
    
});
</script>

</head>

<body>
	<c:import url="../common/menubar.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h2 class="mt-4 mb-3" style="font-weight: bold;">장바구니</h2>

		<ol class="breadcrumb" style="background-color: #FFF;">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/index"
				style="color: black;">Home</a></li>
			<li class="breadcrumb-item active" style="color: #DCB15D;">장바구니</li>
		</ol>
		
		<!-- Content Column -->
		<div class="col-lg-9 mb-4">
			<c:choose>
				<c:when test="${cmap.count == 0}">
	            장바구니가 비어있습니다.
	        </c:when>
				<c:otherwise>
					<form name="form1" id="form1" method="post"
						action="${pageContext.request.contextPath}/order/orderInsert.do">
						<div class="view-content tab-pane fade show active" role="tabpanel" style="width:1100px;">
							<table class="adminMemberTable table table-hover mt-5 text-center" style="width:1000px; margin-left:35px;">
								<thead>
									<tr style="background-color: #EDD6B0;">
										<th><input type="checkbox" id="checkall" name="buy" value="260" checked=""></th>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>금액</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cmap.list}" var="cart" varStatus="i">
										<tr>
											<td>
												<input type="checkbox" name="chk" value="260" checked="">
											</td>
											<td class="td-productName">
												${cart.productName}
												<input type="hidden" name="productNo" id="productNo" value="${cart.productNo}">
											</td>
											<td>
												<fmt:formatNumber pattern="###,###,###" value="${cart.productPrice}" />
											</td>
											<td>
												<input type="number" style="width: 40px" name="amount" value="${cart.countNum}" min="1"> 
												<input type="hidden" name="productNo" value="${cart.productNo}">
											</td>
											<td style="width: 100px" align="right">
												<fmt:formatNumber pattern="###,###,###" value="${cart.money}" /></td>
											<td>
												<a href="${pageContext.request.contextPath}/cart/cartDelete.do?cartNo=${cart.cartNo}"
												style="color: #000;">삭제</a>
											</td>
										</tr>
									</c:forEach>
									<%-- <c:forEach items="${cmap.list}" var="cart" varStatus="i" begin="1" end="1"> --%>
										<tr>
											<td colspan="6" align="right" style="text-align: center; font-size: 16px; font-weight: bold;">
												장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${cmap.sumMoney}" /><br>
												<br />
												배송료 : ${cmap.fee}<br> 
												<br />
												<a style="color:red;">전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${cmap.allSum}" /></a>
											</td>
										</tr>
									<%-- </c:forEach> --%>
								</tbody>
							</table>
							<input type="hidden" name="count" value="${cmap.count}">
							<!-- <button type="submit" id="btnUpdate">수정</button> -->
							<br /><br />
							
							<div style="text-align:center; mar">
						    <input type="submit" class="btn btn-success" value="결제하기"
										style="background-color: #DCB15D; color: #FFF; border: none;">
							</div>
					</form>
				</c:otherwise>
			</c:choose>
			
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
	</div>
	</div>

	<c:import url="../common/footer.jsp" />

	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

