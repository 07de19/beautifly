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
.Insert-container{
    padding: 30px;
	margin-top: 15px;
}
.btn-success{
	background-color: #DCB15D;
    color: white;
}
.btn-fail{
	background-color: white;
    color: #DCB15Dwhite;
}
/* product insert input css */
#product-container{
	width: 400px;
    margin-left: 30px;
}
#product-container-dropdown{
	width:135px;
	margin-left: 30px;
	display: inline-block !important;
}
#product-container-num{
	margin-left: 30px;
	display: flex !important;
	width: 150px;
}
.won{
	vertical-align:middle; 
	margin-left: 30px;
}
#product-container-image{
	margin-left: 30px;
	padding:0px;
}
table{
	border-collapse: separate;
 	border-spacing: 0 10px;
}
.list-group-item:hover{
	border-bottom:none;
	color: black;
}
</style>

<script>

/*부트스트랩 : file 변경시 파일명 보이기 */
$(function(){
	$('[name=upFile]').on('change',function(){
	    //var fileName = $(this).val();//C:\fakepath\파일명
	    //var fileName = this.files[0].name;//파일명(javascript)
	    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
	    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
		//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
	    console.log($(this).val());
	    $(this).next('.custom-file-label').html(fileName);
	})
});
</script>

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
      <li class="breadcrumb-item active" style="color:black;">상품 관리</li>
      <li class="breadcrumb-item active" style="color:#DCB15D;">상품 수정 및 삭제</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
         <a class="list-group-item topName" style="font-weight: bold;">회원 관리</a>
          <a href="${pageContext.request.contextPath}/member/AdminMemberView.do" class="list-group-item">&nbsp;&nbsp;정보 조회</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">상품 관리</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductList.do" class="list-group-item">&nbsp;&nbsp;상품 목록 조회</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductInsert.do" class="list-group-item">&nbsp;&nbsp;상품 추가</a>
          <a href="${pageContext.request.contextPath}/product/AdminProductUpdateList.do" class="list-group-item" style="color:#DCB15D;">&nbsp;&nbsp;상품 수정 및 삭제</a>
          <a class="list-group-item"></a>
          <a class="list-group-item topName" style="font-weight: bold;">결제 및 배송 관리</a>
          <a href="${pageContext.request.contextPath}/order/AdminOrderList.do" class="list-group-item" style="border-bottom:1px solid #CFCFCF;">&nbsp;&nbsp;정보 조회</a>
        </div>
      </div>
      
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>상품 수정 및 삭제</h2>
        <div class="Insert-container">
				<form name="ProductUpdateFrm" action="${pageContext.request.contextPath}/product/productUpdate.do" enctype="multipart/form-data" method="post" >
					<div class="insert-form">
						<table style="border-collapse: separate; border-spacing: 0 15px;">
							<tr>
								<th style="color:red; font-size:11px;">필수 입력사항입니다.</th>
								<td>
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>
									<div id="product-container">
										<input type="hidden" class="form-control" name="productNo" id="productNo" value="${product.productNo}" />
										<input type="text" class="form-control" name="productName" id="productName_" value="${product.productName}" required>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>회사명</th>
								<td>
									<div id="product-container">
										<input type="text" class="form-control" name="companyName" id="companyName_" value="${product.companyName}" required>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>상품 카테고리</th>
								<td>
									<div id="product-container-dropdown">
										<select class="form-control" name="productType" id="productType_" value="${product.productType}">
										  <option value="스킨케어" selected="selected">스킨케어</option>
										  <option value="메이크업">메이크업</option>
										  <option value="바디케어">바디케어</option>
										  <option value="헤어케어">헤어케어</option>
										  <option value="향수/디퓨저">향수/디퓨저</option>
										</select>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>상품 가격</th>
								<td>
									<div id="product-container-num">
										<input type="number" class="form-control" name="productPrice" id="productPrice_" value="${product.productPrice}" required>
										<a class="won">원</a>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>적립 포인트</th>
								<td>
									<div id="product-container-num">
										<input type="number" class="form-control" name="productPoint" id="productPoint_" value="${product.productPoint}" required>
										<a class="won">원</a>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>원산지</th>
								<td>
									<div id="product-container-dropdown">
										<select class="form-control" name="originCountry" id="originCountry_" value="${product.originCountry}">
										  <option value="한국" selected="selected">한국</option>
										  <option value="미국">미국</option>
										  <option value="영국">영국</option>
										  <option value="중국">중국</option>
										  <option value="일본">일본</option>
										  <option value="인도">인도</option>
										  <option value="뉴질랜드">뉴질랜드</option>
										  <option value="독일">독일</option>
										  <option value="호주">호주</option>
										  <option value="네덜란드">네덜란드</option>
										</select>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>상품 상태</th>
								<td>
									<div id="product-container-dropdown">
										<select class="form-control" name="productState" id="productState_" value="${product.productState}">
										  <option value="새 상품" selected="selected">새 상품</option>
										  <option value="중고 상품">중고 상품</option>
										</select>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>용량</th>
								<td>
									<div id="product-container-num">
										<input type="number" class="form-control" name="productWeight" id="productWeight_" value="${product.productWeight}" required>
										<a class="won">g</a>
					            	</div>
								</td>
							</tr>
							<tr>
								<c:forEach items="${attachmentList}" var="attachmentList" varStatus="vs">
									<th><p class="img-th" style="margin-top: -20px;">대표 이미지</p></th>
									<td>
										<div class="custom-file-before" style="padding: 30px; margin-bottom: -15px; margin-top: -15px;">
										    현재 파일명 : ${attachmentList.originFileName}
										</div>
										<div id="product-container-image">
										  <div class="custom-file">
										    <input type="file" class="custom-file-input" name="upFile" id="upFile1" style="background-color:red;" required="required">
										    <label class="custom-file-label" for="upFile1"></label>
										  </div>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${attachmentList2}" var="attachmentList2" varStatus="vs">
									<th><p class="img-th" style="margin-top: -20px;">상세 이미지</p></th>
									<td>
										<div class="custom-file-before" style="padding: 30px; margin-bottom: -15px; margin-top: -15px;">
										    현재 파일명 : ${attachmentList2.originFileName}
										</div>
										<div id="product-container-image">
										  <div class="custom-file">
										    <input type="file" class="custom-file-input" name="upFile" id="upFile2" multiple>
										    <label class="custom-file-label" for="upFile2"></label>
										  </div>
										</div>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<th style="color:white;">-</th>
								<td>
								</td>
							</tr>
							<tr>
								<th style="color:white;">-</th>
								<td>
								</td>
							</tr>
							<tr>
								<th style="color:blue; font-size:11px;">선택 입력사항입니다.</th>
								<td>
								</td>
							</tr>
							<tr>
								<th>  </th>
								<td>
								</td>
							</tr>
							<tr>
								<th>피부 타입</th>
								<td>
									<div id="product-container-dropdown">
										<select class="form-control" name="productState" id="productState_">
										  <option value="" selected="selected">선택 안 함</option>
										  <option value="지성">지성</option>
										  <option value="건성">건성</option>
										  <option value="복합성">복합성</option>
										</select>
					            	</div>
								</td>
							</tr>
							<tr>
								<th>헤어 케어 타입</th>
								<td>
									<div id="product-container-dropdown">
										<select class="form-control" name="productState" id="productState_">
										  <option value="" selected="selected">선택 안 함</option>
										  <option value="볼륨 강화">볼륨 강화</option>
										  <option value="극손상 모발 복구">극손상 모발 복구</option>
										  <option value="탈모 케어">탈모 케어</option>
										  <option value="영양 케어">영양 케어</option>
										  <option value="두피 노화 억제">두피 노화 억제</option>
										</select>
					            	</div>
								</td>
							</tr>
						</table>
						<div class="insert-btn" style="text-align:center;">
						<br /><br /><br />
							<input type="submit" class="btn btn-success" value="수정" 
									style="background-color: #DCB15D; color: #FFF; border: none; ">
									&nbsp;&nbsp;
							<input type="reset"  class="btn btn-fail" value="삭제"
									style="background-color: #FFF; color: #DCB15D; border-color: #DCB15D; ">
						</div>
					</div>
				</form>
				<br />
				<br />
				<br />
				<br />
				<br />
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

