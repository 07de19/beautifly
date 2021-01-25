<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<!-- Bootstrap core JavaScript -->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/BeautiFly_main.css">
	
<style> 
.nav-list-first{
	padding-left: 140px;
	padding-right: 70px;
}
.nav-list{
	padding-left: 70px;
	padding-right: 70px;
}
.fixed-top{
	position: absolute;
}
#menu:hover{
	color: #000;
	font-weight: bold;
}
#menu:active{
	color: #000;
	font-weight: bold;
}
#menu:visited{
	color: #000;
	font-weight: bold;
}
.dropdown-toggle{
	color: white;
	background-color: #DCB15D;
}
.dropdown-toggle:hover{
	color: white;
	background-color: #DCB15D;
}
.dropdown-item:active{
	color: white;
	background-color: #EDD6B0;
}
</style>
</head>
<body>
<br />
<br />
<br />
<ul class="nav justify-content-center" style="border-style: solid;
    border-width: thin;
    border-left: none;
    border-right: none;
    border-color: #BDBDBD;">
<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#FFF;">
      ☰ 카테고리
    </a>
    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
      <a class="dropdown-item" href="${pageContext.request.contextPath}/product/productCategorySkinList.do">스킨케어</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/product/productCategoryMakeUpList.do">메이크업</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/product/productCategoryBodyList.do">바디케어</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/product/productCategoryHairList.do">헤어케어</a>
      <a class="dropdown-item" href="${pageContext.request.contextPath}/product/productCategoryPerfumeList.do">향수/디퓨저</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link nav-list-first" id="menu" href="${pageContext.request.contextPath}/product/productBestList.do">베스트</a>
  </li>
  <li class="nav-item nav-list">
    <a class="nav-link" id="menu" href="${pageContext.request.contextPath}/product/productNewList.do">신상품</a>
  </li>
  <li class="nav-item nav-list">
    <a class="nav-link" id="menu" href="${pageContext.request.contextPath}/product/productPick.do">추천상품</a>
  </li>
  <li class="nav-item nav-list">
    <a class="nav-link" id="menu" href="${pageContext.request.contextPath}/product/productMainBrandList.do">브랜드샵</a>
  </li>
</ul>

</body>
</html>
