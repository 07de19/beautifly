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

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3" style="font-weight: bold;">관리자 페이지</h2>

    <ol class="breadcrumb" style="background-color : #FFF;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:black;">관리자페이지</li>
      <li class="breadcrumb-item active" style="color:black;">회원 관리</li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">정보 조회</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <!-- <a class="list-group-item topName" style="font-weight: bold;">차트 조회</a>
          <a class="list-group-item">&nbsp;&nbsp;연령대 현황</a>
          <a href="#" class="list-group-item">&nbsp;&nbsp;판매 현황</a>
          <a class="list-group-item"></a> -->
          <a class="list-group-item topName" style="font-weight: bold;">회원 관리</a>
          <a href="${pageContext.request.contextPath}/member/AdminMemberView.do" class="list-group-item" style="color:#DCB15D;">&nbsp;&nbsp;정보 조회</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">상품 관리</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductList.do" class="list-group-item">&nbsp;&nbsp;상품 목록 조회</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductInsert.do" class="list-group-item">&nbsp;&nbsp;상품 추가</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductUpdateList.do" class="list-group-item">&nbsp;&nbsp;상품 수정 및 삭제</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">결제 및 배송 관리</a>
          <a href="${pageContext.request.contextPath}/order/AdminOrderList.do" class="list-group-item" style="border-bottom:1px solid #CFCFCF;">&nbsp;&nbsp;정보 조회</a>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>정보 조회</h2>
        <!-- <div class="row search-area mb-5">
			<div class="form-group justify-content-md-center col-10">
				<select id="searchType" class="form-control inline-block mr-2">
					<option value="id" selected>아이디</option>
					<option value="mname">이름</option>
					<option value="email">이메일</option>
				</select>
				<input type="search" id="keyword" class="form-control inline-block mr-2" placeholder="검색어를 입력하세요." onkeyup="enterkey()"> 
				<button type="button" class="btn btn-tp-custom-green mr-5" onclick="search()">검색</button>
			</div>
		</div> -->
        <div class="view-content tab-pane fade show active" role="tabpanel" >
        	<table class="adminMemberTable table table-hover mt-5 text-center">
				<thead>
					<tr style="background-color:#EDD6B0;">
						<th>No</th>
						<th>아이디</th>
						<th style="width:64px;">이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th style="width:93px;">가입일</th>
						<th style="width: 51px;">탈퇴</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="member" varStatus="vs">
						<tr>
							<td>${member.memberNo}</td>
							<td>${member.memberId}</td>
							<td>${member.memberName}</td>
							<td>${member.email}</td>
							<td>${member.tel}</td>
							<td>${member.address}</td>
							<td>${member.joinDate}</td>
							<td>${member.status}</td>
							<td><input type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="탈퇴"
								style="background-color: #2B2B28; color: #FFF; border-color: #2B2B28; font-size:12px;"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </div>
      </div>
    </div>
  </div>

<c:import url="../../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

