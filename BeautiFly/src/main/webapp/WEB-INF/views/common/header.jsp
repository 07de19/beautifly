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
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"> --%>
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous"> -->
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/BeautiFly_main.css">
	
<style>
.nav-link{
	color: black;
}
</style>
</head>
<body>
<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index">
				<section id="LogoContent">
					<img src="${pageContext.request.contextPath }/resources/images/BeautiFly_Logo.png"
						 id="center-image" alt="BeautiFly" />
				</section>
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		    <div class="search-form-area" style="margin-left: 180px;">
			  <form class="form-inline">
			    <input class="form-control mr-sm-2" type="search" aria-label="Search" style="width:350px;">
			    <button class="search-btn" type="submit" style="background-color:white; border:none; ">
			    	<img class="search-btn-img" src="${pageContext.request.contextPath }/resources/images/search_icon_1.png"  style="width: 32px; height:32px;" alt="search" />
			    </button>
			  </form>
			</div>
			<div class="collapse navbar-collapse" id="navbarResponsive" style="font-size: 12px;">
		        <ul class="navbar-nav ml-auto">
		        <c:if test="${empty member}">
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/member/Login.do" style="color:black;">로그인</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/member/memberJoin.do" style="color:black;">회원가입</a>
		          </li>
		        </c:if>
		        <c:if test="${!empty member}">
		       	  <li class="nav-item">
		       	  <div class="nav-link">	       	  
		            <span style="color:black;"><a class="memberName" style="color:#DCB15D;">${member.memberName}</a>님 반갑습니다</span>
		       	  </div>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/member/memberLogout.do" style="color:black;">로그아웃</a>
		          </li>
		   		</c:if>
		          <li class="nav-item">
		          <c:set var="name" value="${member.memberType}"/>
		          <c:if test="${'USER' eq name}">
		            <a class="nav-link" href="${pageContext.request.contextPath}/cart/cartList.do" style="color:black;">장바구니</a> <!-- /views/cart/cartList.jsp -->
		          </c:if>
		          </li>
		          <li class="nav-item">
		          <c:set var="name" value="${member.memberType}"/>
		          <c:if test="${'USER' eq name}">
		            <a class="nav-link" href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" style="color:black;">마이뷰티</a>
		          </c:if>
		          <c:if test="${'MANAGER' eq name}">
		            <a class="nav-link" href="${pageContext.request.contextPath}/member/AdminMemberView.do" style="color:black;">관리자페이지</a>
		          </c:if>
		          </li>
		          <!-- <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              Portfolio
		            </a>
		            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
		              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
		              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
		              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
		              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
		            </div>
		          </li> -->
		          
				</ul>
			</div>
	</nav>
</body>
</html>
