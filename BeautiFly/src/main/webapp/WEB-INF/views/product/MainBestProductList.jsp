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
<c:import url="../common/header.jsp"/>

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
			console.log("productNo="+productNo);
			location.href="${pageContext.request.contextPath}/product/productDetailView.do?productNo=" + productNo;
		})
	});
</script>

</head>

<body>
<c:import url="../common/menubar.jsp"/>
	
	<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">베스트 상품</h2>
	<br />
    <div class="container-card">
		<div class="row">
			<c:forEach items="${productBestList}" var="product" varStatus="vs">
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
		<br />
		<br />
		<br />
		<br />
		<br />
	 </div>
	</div>
	

<c:import url="../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

