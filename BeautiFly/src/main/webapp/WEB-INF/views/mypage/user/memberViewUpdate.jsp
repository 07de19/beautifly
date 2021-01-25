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
.update-content{
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
.update-content{
	padding:15px;
	margin-left: 20px;
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
      <li class="breadcrumb-item active" style="color:#DCB15D;">정보 수정 및 탈퇴</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a class="list-group-item topName" style="font-weight: bold;">프로필</a>
          <a href="${pageContext.request.contextPath}/member/memberView.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;정보 조회</a>
          <a href="${pageContext.request.contextPath}/member/memberViewUpdate.do?memberId=${member.memberId}" class="list-group-item" style="color:#DCB15D;">&nbsp;&nbsp;정보 수정 및 탈퇴</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">주문 내역</a>
          <a href="${pageContext.request.contextPath}/order/orderList.do?memberId=${member.memberId}" class="list-group-item">&nbsp;&nbsp;주문 상품 조회</a>
          <a href="${pageContext.request.contextPath}/order/delivery.do" class="list-group-item" style="border-bottom:1px solid #CFCFCF;">&nbsp;&nbsp;배송 조회</a>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>정보 수정 및 탈퇴</h2>
        <div class="update-content">
        <br />
			<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
				<div class="form-group">
					<label class="index-view">아이디 </label>
					<div class="inline-block">
						<input type="text" class="form-control inline-block"  placeholder="아이디 (4글자이상)" name="userId" id="userId_" value="${member.memberId}" readonly required>
					</div>
				</div>
				<div class="form-group">
					<label class="index-view">회원명 </label>
					<div class="inline-block">
						<input type="text" class="form-control" placeholder="이름" name="userName" id="userName" value="${member.memberName}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="index-view">주소 </label>
					<div class="inline-block">
						<input type="text" class="form-control" placeholder="주소" name="address" value="${member.address}" id="address">
					</div>
				</div>
				<div class="form-group">
					<label class="index-view">전화번호 </label>
					<div class="inline-block">
						<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="tel" id="tel" maxlength="11" value="${member.tel}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="index-view">이메일 </label>
					<div class="inline-block">
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${member.email}" required>
					</div>
				</div>
				<%-- <select class="form-control" name="gender" required>
				  <option value="" disabled selected>성별</option>
				  <option value="남" ${member.gender=='남'?'selected':'' }>남</option>
				  <option value="여" ${member.gender=='여'?'selected':'' }>여</option>
				</select> --%>
				<div class="form-group">
					<label class="index-view">나이 </label>
					<div class="inline-block">
						<input type="number" class="form-control" placeholder="나이" name="age" id="age" value="${member.age}">
					</div>
				</div>
				<br />
				<br /><br />
				<input type="submit" class="btn btn-success" value="수정" 
					style="background-color: #DCB15D; color: #FFF; border: none; margin-left: 70px;">&nbsp;
				<input type="reset"  class="btn btn-fail" value="취소"
					style="background-color: #FFF; color: #DCB15D; border-color: #DCB15D; ">&nbsp;
				<input type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="탈퇴"
					style="background-color: #2B2B28; color: #FFF; border-color: #2B2B28; ">
			</form>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
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

