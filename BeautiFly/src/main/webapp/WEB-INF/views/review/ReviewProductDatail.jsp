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
<!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

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

.star{
  display:inline-block;
  width: 30px;
  height: 60px;
  cursor: pointer;
}
.star_left{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 60px; 
  margin-right: -3px;
}
.star_right{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
  background-size: 60px; 
  margin-left: -3px;
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}


/*
.rating svg:nth-child(1){
	color:#F05522;
}
*/
</style>

<script>
$(document).ready(function() { 

	// 상품 가격 1개 일때 가격 표시해주기
	var pPrice = $("#pPrice").val();

	$("#i_result").html(pPrice);

	// 상품 목록 보여주기
	var productNo = $("#productNo").val();
	//console.log(productNo);
	//location.href="${pageContext.request.contextPath}/review/reviewList.do?productNo" + productNo;

	
	// foreach문 마지막 인덱스+1만큼 변수로 만들어 놓고 그걸 for문으로 돌린 후 평점 값 다 더해주고 앞에 만든 변수 갯수만큼 나누기 

	$(".star").on('click',function(){
		   var idx = $(this).index();
		   $(".star").removeClass("on");
		     for(var i=0; i<=idx; i++){
		        $(".star").eq(i).addClass("on");
		   }
	});

	console.log($("#rating").val());

	


});

function priceSum() {
	var num = $("select[name=countNum]").val();
	var price = $("#pPrice").val();

	var priceSum = num * price;

	$("#i_result").html(priceSum);
}



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
	
	<form method="get" action="${pageContext.request.contextPath}/product/productDetailView.do?productNo=" + productNo >
		<div class="menu-tab" style="display: flex;">
			<input type="hidden" name="productNo" id="productNo" value="${product.productNo}">
			<!-- 제품 상세 버튼 -->
			<button type="submit" class="btn btn-review" 
					style="background-color: #FFF; color: #DCB15D; border: 1px solid #DCB15D; width: 50%; border-radius:0;">
				<a style="font-size:17px;">제품 상세</a>
			</button>
			<!-- 리뷰 버튼 -->
			<button type="button" class="btn btn-review" 
					style="background-color: #DCB15D; color: #FFF; border: none; width: 50%; border-radius:0;">
				<a style="font-size:17px;">리뷰</a>
			</button>
		</div>
	</form>

	<br />

    <div class="detail-review">
	    <p class="my-4"><strong>리뷰</strong></p>
	    <form action="${pageContext.request.contextPath}/review/reviewInsert.do">
	    <div class="review-head">
	    	<table class="reviewInsertTable" style="width:1105px;">
	    	<input type="hidden" name="productNo" id="productNo" class="productNo" value="${product.productNo}" />
				<tr>
					<th style="width:100px; text-align:center; height:70px;">평점</th>
					<td style="width: 500px;">
						<!-- 
						<input type="text" class="form-control" name="rating" id="rating_" style="width:50px; margin-top:25px;" required>
						<p style="font-size:12px;">1, 2, 3, 4, 5 점 중에 입력해주세요.</p>
						 -->
						 <!-- 
						<select class="rating" name="rating" style="height: 30px; width:50px;" required>
			                 <c:forEach begin="1" end="5" var="i">
			                     <option name="rating" id="rating" value="${i}">${i}</option>
			                 </c:forEach>
			             </select>
			              -->
			             <!--  -->
			             <div class="star-box rating">
						  <span class="star star_left"><input type="hidden" name="rating" id="rating" value="0.5" /></span>
						  <span class="star star_right"><input type="hidden" name="rating" id="rating" value="1" /></span>
						
						  <span class="star star_left"><input type="hidden" name="rating" id="rating" value="1.5" /></span>
						  <span class="star star_right"><input type="hidden" name="rating" id="rating" value="2" /></span>
						
						  <span class="star star_left"><input type="hidden" name="rating" id="rating" value="2.5" /></span>
						  <span class="star star_right"><input type="hidden" name="rating" id="rating" value="3" /></span>
						
						 <span class="star star_left"><input type="hidden" name="rating" id="rating" value="3.5" /></span>
						 <span class="star star_right"><input type="hidden" name="rating" id="rating" value="4" /></span>
						
						 <span class="star star_left"><input type="hidden" name="rating" id="rating" value="4.5" /></span>
						 <span class="star star_right"><input type="hidden" name="rating" id="rating" value="5" /></span>
						</div>
						 
						<!-- 
						<!-- 별점 표시하기
						<div class="review">
							<div class="rating" data-rate="${product.productRating}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
							</div>
						</div>
						 -->
						
						 
					</td>
					<td rowspan="3">
						<button type="submit" value="리뷰 작성하기" class="btn btn-review"
							style="background-color:#DCB15D; color: #FFF; border: none; width:110px; margin-left:300px; margin-right:30px;"><a style="font-size:14px;">리뷰 작성하기</a></button>
					</td>
				</tr>
				<tr>
					<th style="width:100px; text-align:center; height:100px; border-bottom:1px solid #DCB15D">내용</th>
					<td style="border-bottom:1px solid #DCB15D">	
						<textarea class="form-control" name="reviewContent" id="reviewContent_" style="width:500px; resize: none;" required></textarea>
					</td>
				</tr>
			</table>  
			<br />
	    </div>
	    
	    <br />
	    <p style="font-size:20px;">평점 : <a style="color:red;">${product.productRating}</a></p>
	    <br />
		    <table class="reviewTable" style="width:600px; margin-left:35px; border-collapse: separate; border-spacing: 0 15px;">
		    <div style="padding:10px;">
				<thead>
					<tr style="background-color: #FFF;">
						<th>평점</th>
						<th>아이디</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviewList}" var="review" varStatus="i">
					<input type="hidden" name="productNo" id="productNo" value="${product.productNo}" />
						<tr>
							<td>
								<input type="hidden" id="rating" class="rating" value="${review.rating}" />&nbsp;&nbsp;${review.rating}
							</td>
							<td class="td-productName">
								${review.memberId}
							</td>
							<td>
								${review.reviewContent}
							</td>
							<input type="hidden" id="reviewNum" class="reviewNum" value="${i.end}" />
						</tr>
					</c:forEach>
				</tbody>
			</div>
			</table>
	    </form>
    </div>
    
    <br /><br /><br />
    
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

