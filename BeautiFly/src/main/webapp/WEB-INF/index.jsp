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
<c:import url="views/common/header.jsp"/>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">


<!-- Custom styles for this template -->
<!-- <link href="css/modern-business.css" rel="stylesheet"> -->
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/modern-business.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/BeautiFly_main.css">--%>
<style>
.carousel-inner>.carousel-item>img {
	width: 1920px;
	height: 450px;
}
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
<c:import url="views/common/menubar.jsp"/>
	<header>
		<script>
			$('.carousel').carousel({
				interval : 2000
			})
		</script>
		
		<div class="container">
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
					<!--가로-->
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/mainImage_4.png" alt="1 slide">
					<div class="carousel-caption d-none d-md-block">
						<!-- <h5>TEST</h5> -->
						<!-- <p>testtesttest</p> -->
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/mainImage_5.png" alt="2 slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/mainImage_7.png" alt="3 slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/mainImage_8.png" alt="4 slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						 src="${pageContext.request.contextPath }/resources/images/mainImage_9.png" alt="5 slide">
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
					<li data-target="#demo" data-slide-to="3"></li>
					<li data-target="#demo" data-slide-to="4"></li>
				</ul>
				<!-- 인디케이터 끝 -->
			</div>
	</header>
	
	<br />
	<br />
	<br />

	<!-- Page Content -->
	<div class="container">
		<!-- Portfolio Section -->
		<h3>인기 상품</h3>

		<div class="container-card">
			<div class="row">
				<c:forEach items="${productMainTopList}" var="product" varStatus="vs">
					<div class="pcard" id="pcard">
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
		
		<br />
		<br />
		<br />
		
		<h3>Weekly Special</h3>
		<div class="Weekly-Special-Area" style="text-align:center;">
			<div class="row">
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/weekly special_1.JPG"
						alt="weekly special_1">
				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/weekly special_4.JPG"
						alt="weekly special_2">
				</div>
			</div>
		</div>
		
		<br />
		<br />
		<br />
		
		<!-- Portfolio Section -->
		<h3>신상품</h3>

		<div class="container-card">
			<div class="row">
				<c:forEach items="${productMainNewList}" var="product" varStatus="vs">
					<div class="pcard" id="pcard">
						<input type="hidden" name="productNo" id="productNo" value="${product.productNo}" />
						<div class="card">
						  <img src="<c:url value="/resources/productUpload/${product.renameFileName}"/>"
						  	class="card-img-top" alt="대표이미지"/>
							  <div class="card-body">
							  		<small>
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
		
		<br />
		<br />
		<br />
		
		<div class="best-brandshop-main">
			<h3>베스트 브랜드샵</h3>
			<div class="row">
				<div class="spcial-brand" style="text-align: center;">
					<span class="sbimg1">
						<a href="${pageContext.request.contextPath}/product/productMainBrandList.do">
		        			<img src="${pageContext.request.contextPath}/resources/images/special brand_1.jpg" alt="랑방">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_2.jpg" alt="아벤느">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_3.jpg" alt="라로슈포제">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_4.jpg" alt="맥">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_5.jpg" alt="피지오겔">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_6.jpg" alt="닥터지">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_7.jpg" alt="클리오">
			        		<img src="${pageContext.request.contextPath}/resources/images/special brand_8.jpg" alt="닥터자르트">
		        		</a>
		        	</span>
				</div>
			</div>
		</div>
		
		<%-- <div class="special-Brand">
			<span class="sbimg1">
	        	<img src="${pageContext.request.contextPath}/resources/images/special brand_1.jpg" alt="랑방">
				<p>랑방</p>
	        </span>
			<span class="sbimg1">
	        	<img src="${pageContext.request.contextPath}/resources/images/special brand_2.jpg" alt="아벤느">
				<p>아벤느</p>
	        </span>
		</div> --%>
		
		
		<br />
		<br />
		<br />

		<!-- Features Section -->
		<h3>Pick! 추천 상품</h3>
		<div class="row">
			<div class="col-lg-6">
				<br />
				<strong>듀이트리</strong>
				<br />
				<br />
				<p>듀이트리 하이 아미노 올 클렌징 밀크 기획</p>
				<br />
				<p>2021년, 좋은 루틴을 만들어줄 한정 기획 세트<br />
				   듀이트리 하이 아미노 올 클렌징 밀크 200ml 기획 (올클렌저 50ml 증정)</p>
				<br />
				궁금하다면?&nbsp;&nbsp;<a class="pick-item" href="${pageContext.request.contextPath}/product/productPick.do">바로가기</a>
			</div>
			<div class="col-lg-6">
				<img src="${pageContext.request.contextPath}/resources/images/Pick_img.png" alt="듀이트리">
			</div>
		</div>
		<!-- /.row -->

		<br />
		<br />
		<br />
		<br />
		<br />

	</div>

	<c:import url="views/common/footer.jsp"/>
	<!-- Bootstrap core JavaScript -->
	<!-- <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

	
	
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

