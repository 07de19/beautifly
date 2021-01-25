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
</style>

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
      <li class="breadcrumb-item active" style="color:black;">추천 상품</li>
    </ol>

    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-8">
      		<img class="d-block w-100"
				src="${pageContext.request.contextPath }/resources/images/dewytree-mask_1.jpg">
      </div>

      <div class="col-md-4">
      	<p>듀이트리</p>
        <h3 class="my-3">세림콜라보 기획 <br />듀이트리 픽 앤 퀵 뽑아쓰는 마스크</h3>
        <hr />
        <h3 class="my-3"><strong>23000</strong><a style="font-size:18px; "> 원</a></h3>
        <br />
        <a class="pick-item" style="color:#DCB15D; font-weight: bold;"
        	href="${pageContext.request.contextPath}/product/productDetailView.do?productNo=20">→ 구매하러가기</a>
	    
      </div>

    </div>
    <!-- /.row -->

    <!-- 여기부터 상세 설명 적기 -->
    <div class="detail-info">
	    <p class="my-4"><strong>상세 정보</strong></p>
	    <p>원산지 : 한국 <br />
	       상품 상태 : 새 상품 <br />
		   용량 또는 중량 : 380 g</p>
    </div>
    
    <br /><br />
    <div class="detail-img">
	    <p class="my-4"><strong>기획 설명</strong></p>
		<img class="d-block w-100"
			src="${pageContext.request.contextPath }/resources/images/dewytree-mask_2.png">				  	
    </div>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    
  </div>
    

<c:import url="../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

