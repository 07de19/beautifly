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
<c:import url="../common/header.jsp"/>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
.btn{
	padding:10px; 
	width:41px;
	height:41px;
}
.reviewInsertTable {
    width: 750px;
    border: 1px solid #DCB15D;
    border-collapse:seperate;
}
</style>

<script>
$(document).ready(function() { 

	// 상품 가격 1개 일때 가격 표시해주기
	var pPrice = $("#pPrice").val();

	$("#i_result").html(pPrice);

	// 상품 리뷰 목록 보여주기
	var productNo = $("#productNo").val();
	console.log(productNo);
	//location.href="${pageContext.request.contextPath}/review/reviewList.do?productNo=" + productNo;
	$(function() {
		$(".detail-reivew").on("click",function(){
			var productNo = $(this).children("#productNo").val();
			location.href="${pageContext.request.contextPath}/product/productDetailView.do?productNo=" + productNo;
		})
	});

	

	/*
	// 바뀌는 코드 - 사용 안 함(탭으로 바꿨음)
	var detailProduct = $('.detail-product');
	var detailReivew = $('.detail-reivew');
	
	detailProduct.show(); //페이지를 로드할 때 표시할 요소
	detailReivew.hide(); //페이지를 로드할 때 숨길 요소

	$('.btn-review').click(function(){
		$('#detail-product').hide(); //클릭 시 첫 번째 요소 숨김
		$('#detail-reivew').show(); //클릭 시 두 번째 요소 표시
		return false;
	});
	*/

});

function priceSum() {
	var num = $("select[name=countNum]").val();
	var price = $("#pPrice").val();

	var priceSum = num * price;

	$("#i_result").html(priceSum);
}

$(function() {
	$(".div-review").on("click",function(){
		var productNo = $(this).children("#productNo").val();
		location.href="${pageContext.request.contextPath}/product/productDetailViewReview.do?productNo=" + productNo;
	})
});

function money_cart(){ 
	return true; 
} 
function money_pay(frm) {
	/* $("#direct-pay").on("click",function(){ */
		//var productNo = $(this).children("#productNo").val();
		var productNo = $("#productNo").val();
		console.log(productNo);
		var countNum = $("select[name=countNum]").val();
		frm.action="${pageContext.request.contextPath}/order/directOrderInsertView.do?productNo=" + productNo + "&countNum=" + countNum;
	/* }) */
	frm.submit();
	return true; 
};


</script>

</head>

<body>
<c:import url="../common/menubar.jsp"/>
	
 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <ol class="breadcrumb" style="background-color : #FFF;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:black;">${product.productType}</li>
      <li class="breadcrumb-item active" style="color:black;">${product.companyName}</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
      <c:forEach items="${attachmentList}" var="attachmentList" varStatus="vs">
		<div class="main-img-content">
	        <img src="<c:url value="/resources/productUpload/${attachmentList.renameFileName}"/>"
					  	class="card-img-top" alt="썸네일 이미지" style=" height: 610px; width: 610px; "/>
		</div>
	  </c:forEach>
      </div>

      <div class="col-md-4">
	    <form name="form1" method="post" action="${pageContext.request.contextPath}/cart/insertCart.do" onsubmit='return money_cart()'>
      	<p>${product.companyName}</p>
        <h3 class="my-3">${product.productName}</h3>
        <p> 평점 : ${product.productRating}</p>
        <p> 리뷰 : ${product.reviewCount}</p>
        <hr />
        <h3 class="my-3"><strong><input type="hidden" id="pPrice" name="pPrice" value="${product.productPrice}">${product.productPrice}</strong>
        <a style="font-size:18px; "> 원</a></h3>
        <p style="font-size:12px;">배송 정보 : 배송비 무료 (50000원이상 무료 배송), 전국</p>
        <br />
        
	    <div class="input-group" style="background-color:#EAEAEA; ">
	      <a style="margin-top:3.5px; padding:18px;">구매수량</a>
	      <!-- select 박스 -->
             <input type="hidden" name="productNo" id="productNo" value="${product.productNo}">
             <select class="countNum" name="countNum" onclick="priceSum();" style="height: 30px; margin-top: 17px; margin-left: 160px;">
                 <c:forEach begin="1" end="10" var="i">
                     <option name="selectCountNum" id="selectCountNum" value="${i}">${i}</option>
                 </c:forEach>
             </select><a style="margin-top: 19.5px; margin-left: 15px;">개</a>
	      
	   </div><!-- /input-group -->
	    
	    <br />
	    <div class="productSum" id="productSum">
	    <h5 class="my-3">
	    	<a>상품금액 합계</a>
		    	<strong style="margin-left:120px;"><span id="i_result"></span></strong>
		    	<a style="font-size:15px; "> 원</a>
	    </h5>
	    </div>
		<br />
		<br />
		
		<c:set var="name" value="${member.memberType}"/>
		   <c:if test="${'MANAGER' ne name}">
				<div class="payButton" style="text-align:center;">
					<button type="submit" value="장바구니에 담기" class="btn btn-cart"
						style="background-color: #EDD6B0; color: #FFF; border: none; width:150px;">장바구니</button>
					<%-- <form action="${pageContext.request.contextPath}/order/directOrderInsertView.do?productNo=" + productNo> --%>
						<input type="hidden" name="productNo" id="productNo" value="${product.productNo}">
						<button type="button" id="direct-pay" class="btn btn-pay" onclick='return money_pay(this.form);'
							style="background-color: #DCB15D; color: #FFF; border: none; width:150px;">바로구매</button>
					<!-- </form> -->
				</div>
          </form>
		</c:if>
          <c:set var="name" value="${member.memberType}"/>
		    <c:if test="${'MANAGER' eq name}">
	    		<div class="updateButton" style="text-align:center;">
			    	<form action="${pageContext.request.contextPath}/product/AdminProductUpdateView.do">
			    			<input type="hidden" name="productNo" value="${product.productNo}">
							<button type="submit" class="btn btn-update"
								style="background-color: #EDD6B0; color: #FFF; border: none; width:150px;">상품 수정</button>
			    	</form>
			    	<br />
			    	<br />
			    	<form action="${pageContext.request.contextPath}/product/productDelete.do">
			    			<input type="hidden" name="productNo" value="${product.productNo}">
							<button type="submit" class="btn btn-delete"
								style="background-color: #DCB15D; color: #FFF; border: none; width:150px;">상품 삭제</button>
					</form>
				</div>
		    </c:if>
      </div>
		
    </div>
    <!-- /.row -->
	
	<hr />
	<br />
	
	<form method="get" action="${pageContext.request.contextPath}/review/reviewList.do?productNo=" + productNo>
		<div class="menu-tab" style="display: flex;">
			<input type="hidden" name="productNo" id="productNo" value="${product.productNo}" />
			<!-- 제품 상세 버튼 -->
			<button type="button" class="btn-detail" 
					style="background-color: #DCB15D; color: #FFF; border: none; width: 50%; height:40px; border-radius:0;">
				<a style="font-size:17px;">제품 상세</a>
			</button>
			<!-- 리뷰 버튼 -->
			<button type="submit" class="btn-review"
					style="background-color: #FFF; color: #DCB15D; border: 1px solid #DCB15D; width: 50%; height:40px; border-radius:0;">
				<a style="font-size:17px;">리뷰</a>
			</button>
		</div>
	</form>

	<br />

	<!-- 바뀌는 콘텐츠 영역 -->
	<div class="change-content" id="change-content">
		<!-- 여기부터 상세 설명 적기 -->
		<div class="detail-product" id="detail-product">
		    <div class="detail-info">
			    <p class="my-4"><strong>상세 정보</strong></p>
			    <p>원산지 : ${product.originCountry} <br />
			       상품 상태 : ${product.productState} <br />
				   용량 또는 중량 : ${product.productWeight} g</p>
		    </div>
		    
		    <br /><br />
		    <div class="detail-img">
			    <p class="my-4"><strong>상세 이미지</strong></p>
			    <c:forEach items="${attachmentList2}" var="attachmentList2" varStatus="vs">
					<div class="main-img-content">
				        <img src="<c:url value="/resources/productUpload/${attachmentList2.renameFileName}"/>"
								  	class="card-img-detail" alt="상세 이미지"/>
					</div>
			  </c:forEach>
		    </div>
	    </div>
	    
	    <br /><br /><br />
    
    
    </div>
    
  </div>
    

<c:import url="../common/footer.jsp"/>

<script>
	function deleteProduct(){
		location.href='${pageContext.request.contextPath}/product/productDelete.do?productNo='+productNo;
	}
	
</script>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

