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

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(document).ready(function() { 

	//location.href="${pageContext.request.contextPath}/order/orderList.do";

});
</script>


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
<c:import url="../common/menubar.jsp"/>
	
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3" style="font-weight: bold;">결제 하기</h2>

    <ol class="breadcrumb" style="background-color : #FFF;">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/index" style="color:black;">Home</a>
      </li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">결제</li>
    </ol>
    
    <br />
    <br /><br />
    <div class="content-sucess" style="text-align: center;">
	    <h3>정말 주문하시겠습니까?</h3>
	    
	    <%-- <input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}" /> --%>
	    <input type="hidden" id="orderName" name="orderName" value="${orderList.orderName}" />
	    <input type="hidden" id="orderPrice" name="orderPrice" value="${orderList.orderPrice}" />
	    <input type="hidden" id="orderEmail" name="orderEmail" value="${orderList.orderEmail}" />
	    <input type="hidden" id="orderTel" name="orderTel" value="${orderList.orderTel}" />
	    <input type="hidden" id="orderAddress" name="orderAddress" value="${orderList.orderAddress}" />
	    
	    <br />
	    <form action="${pageContext.request.contextPath}/pay/insertPay.do">
		    <input type="button" class="btn btn-success" value="결제 하기"
						style="background-color: #DCB15D; color: #FFF; border: none; ">
	    </form>
	    <br />
	    <br />
	    <br />
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

