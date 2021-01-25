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
td:hover {
	cursor:pointer;
}
table {
    width: 100%;
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
  <h2 class="mt-4 mb-3" style="font-weight: bold;">마이 뷰티</h2>

    <!-- Page Heading/Breadcrumbs -->
    <ol class="breadcrumb" style="background-color : #FFF;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:black;">마이뷰티</li>
      <li class="breadcrumb-item active" style="color:black;">주문 내역</li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">주문 상품 조회</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a class="list-group-item topName" style="font-weight: bold;">프로필</a>
          <a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;정보 조회</a>
          <a href="${pageContext.request.contextPath}/member/memberViewUpdate.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;정보 수정 및 탈퇴</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">주문 내역</a>
          <a href="${pageContext.request.contextPath}/order/orderList.do?memberId=${member.memberId}" class="list-group-item" style="color:#DCB15D;">&nbsp;&nbsp;주문 상품 조회</a>
          <a href="${pageContext.request.contextPath}/order/delivery.do" class="list-group-item" style="border-bottom:1px solid #CFCFCF;">&nbsp;&nbsp;배송 조회</a>
        </div>
      </div>
      
      
      
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>주문 상품 조회</h2>
        <div class="view-content tab-pane fade show active" role="tabpanel">
        	<table class="adminMemberTable table table-hover mt-5 text-center" style="width: 900px;">
				<thead>
					<tr style="background-color:#EDD6B0;">
						<th>상품 이름</th>
						<th style="width:64px;">주문자<br />이름</th>
						<th>배송 주소</th>
						<th>주문자 이메일</th>
						<th>주문자<br />전화번호</th>
						<th>주문 금액</th>
						<th style="width:95px;">주문일</th>
						<th style="width:51px;">결제<br />여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="order" varStatus="vs">
						<tr>
							<td>${order.productName}</td>
							<td>${order.orderName}</td>
							<td>${order.orderAddress}</td>
							<td>${order.orderEmail}</td>
							<td>${order.orderTel}</td>
							<td>${order.orderPrice}</td>
							<td>${order.payDate}</td>
							<td>${order.payIsOk}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </div>
      </div>
    </div>
      <br />
      <br />
      <br />
      <br />
      <br />
  </div>

<c:import url="../../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

