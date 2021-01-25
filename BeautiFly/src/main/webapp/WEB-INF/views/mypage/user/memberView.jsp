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
<c:import url="../../common/header.jsp"/>

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
.list-group-item{
	font-size: 14px;
	color: #000;
}
.topName{
	font-size: 16px;
}
.view-content{
	padding: 30px;
	margin-top: 35px;
}
.index-view{
	color: #DCB15D;
	font-weight: bold;
}
.col-lg-9{
	padding: 20px;
}
.list-group-item:hover{
	border-bottom:none;
	color: black;
}
</style>

</head>

<body>
<c:import url="../../common/menubar.jsp"/>
	
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3" style="font-weight: bold;">마이 뷰티</h2>

    <ol class="breadcrumb" style="background-color : #FFF;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:black;">마이뷰티</li>
      <li class="breadcrumb-item active" style="color:black;">프로필</li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">정보 조회</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a class="list-group-item topName" style="font-weight: bold;">프로필</a>
          <a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" class="list-group-item" style="color:#DCB15D;">&nbsp;&nbsp;정보 조회</a>
          <a href="${pageContext.request.contextPath}/member/memberViewUpdate.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;정보 수정 및 탈퇴</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">주문 내역</a>
          <a href="${pageContext.request.contextPath}/order/orderList.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;주문 상품 조회</a>
          <a href="${pageContext.request.contextPath}/order/delivery.do" class="list-group-item" style="border-bottom:1px solid #CFCFCF;">&nbsp;&nbsp;배송 조회</a>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>정보 조회</h2>
        <div class="view-content">
        	<span class="index-view">아이디 </span> : ${member.memberId} <br /><br />
        	<span class="index-view">회원명 </span> : ${member.memberName} <br /><br />
        	<span class="index-view">주소 </span> : ${member.address} <br /><br />
        	<span class="index-view">전화번호 </span> : ${member.tel} <br /><br />
        	<span class="index-view">이메일 </span> : ${member.email} <br /><br />
        	<span class="index-view">성별 </span> : ${member.gender} <br /><br />
        	<span class="index-view">나이 </span> : ${member.age} <br /><br />
        	<span class="index-view">가입일 </span> : ${member.joinDate} <br /><br />
        	<span class="index-view">등급 포인트 </span> : ${member.memberPoint} <br /><br />
        	<span class="index-view">등급 </span> : ${member.grade} <br /><br />
        	
        	<br />
        	<br />
        	<br />
	        <p style="font-size:10pt; color:#747474">포인트는 30점 이상 적립시 'Gold' 등급으로 변환됩니다. <br />
	        	* 구매 1건 당 포인트 1점 적립</p>
        	
        </div>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
	

<c:import url="../../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

