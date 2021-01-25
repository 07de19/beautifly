<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
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
<c:import url="../../common/header.jsp"/>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
/* card-view */

.product-card {
	padding: 30px 0;
}

.product-card h3 a {
    position: absolute;
    font-weight: 400;
    font-size: 14px;
    right: 30px;
    padding: 10px;

}

.card {
	cursor: pointer;
    padding: 30px;
    margin: 0 15px;
    width:330px;
    height:460px;
    flex-grow: 0;
    margin-bottom: 30px;
}
.product-card .card {
	color: #4A5059;
	width: 15rem;
	margin: 0 auto 30px auto;
	border: 1px solid #82cbc4;
}

.product-card .card .card-body h5 {
	text-overflow: ellipsis;
    white-space: nowrap;
    width: 198px;
    overflow: hidden;
}

.product-card .card .card-body h5, p{
	margin-bottom: 0;	
}
.carousel-inner>.carousel-item>img {
	width: 1200px;
	height: 400px;
}
/* footer{ 
	position:fixed; 
 	left:0px; 
  	bottom:0px; 
  	height:-96px; 
  	width:100%;
} */
</style>
<script>
	$(function() {
		$(".pcard").on("click",function(){
			var productNo = $(this).children("#productNo").val();
			location.href="${pageContext.request.contextPath}/product/productDetailView.do?productNo=" + productNo;
		})
	});
</script>

</head>

<body>
<c:import url="../../common/menubar.jsp"/>
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
	
	<ol class="breadcrumb" style="background-color : #FFF; padding:0px; margin-top:10px;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:black;">카테고리</li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">향수/디퓨저</li>
    </ol>
    
    <h2 class="mt-4 mb-3">향수/디퓨저</h2>
    <script>
			$('.carousel').carousel({
				interval : 1000
			})
		</script>
		
		<div class="container">
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
    				<img class="d-block w-100" src="${pageContext.request.contextPath }/resources/images/perfume_1.jpg" alt="1 slide">
    				<div class="carousel-caption d-none d-md-block">
						<!-- <h5>TEST</h5> -->
						<!-- <p>testtesttest</p> -->
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/perfume_2.jpg" alt="2 slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/perfume_3.jpg" alt="3 slide">
				</div>
				</div>
				<!-- / 슬라이드 쇼 끝 -->
				<!-- 왼쪽 오른쪽 화살표 버튼 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<!-- <span>Previous</span> -->
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<!-- <span>Next</span> -->
				</a>
				<!-- / 화살표 버튼 끝 -->
				<!-- 인디케이터 -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<!--0번부터시작-->
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				<!-- 인디케이터 끝 -->
			</div>
	
    <div class="container-card" style="padding:25px;">
		<div class="row">
			<c:forEach items="${productCategoryPerfumeList}" var="product" varStatus="vs">
				<div class="pcard">
					<input type="hidden" name="productNo" id="productNo" value="${product.productNo}" />
					<div class="card">
					  <img src="<c:url value="/resources/productUpload/${product.renameFileName}"/>"
					  	class="card-img-top" alt="대표이미지"/>
						  <div class="card-body">
						  		<small class="font-green">
						  				<span class="product-companyName">${product.companyName}</span> /
						  			<span class="productType">${product.productType}</span>
						  		</small>
							    <h5 class="card-title productName">${product.productName}</h5>
							    <p class="card-text productPrice">${product.productPrice}원</p>
						  </div>
					</div>
				</div>
			</c:forEach>
		</div>
	 </div>
	</div>
	

<c:import url="../../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

