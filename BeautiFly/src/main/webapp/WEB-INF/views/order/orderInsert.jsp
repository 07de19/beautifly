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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<!-- Custom styles for this template -->
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/modern-business.css"> --%>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/BeautiFly_main.css"> --%>
<style>
.order-container{
/*     padding: 0px;
    margin: 0 auto;
    width: 650px; */
}
.btn-success{
	background-color: #DCB15D;
    color: white;
}
.btn-fail{
	background-color: white;
    color: #DCB15Dwhite;
}
tr{
	height: 50px;
}
</style>

</head>

<body>
<c:import url="../common/menubar.jsp"/>
	
<div class="container">
	<div class="order-container">
		<h2 class="mt-4 mb-3" style="font-weight: bold;">주문 페이지</h2>
			<br /><br />
			<form name="orderFrm" action="${pageContext.request.contextPath}/pay/insertPay.do" method="post" style="margin-left:40px; width:1000px;">
				<div class="order-form">
				<p style="font-size:20px; font-weight:bold;">배송 정보</p>
				<table style="margin-left: 20px;">
					<tr>
						<th style="width:130px;">받는 분</th>
						<td style="width:300px;">
							<input type="text" class="form-control" name="orderName" id="orderName" required>
						</td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td>
							<input type="text" class="form-control" name="orderEmail" id="orderEmail" required>
						</td>
					</tr>  
					<tr>
						<th>전화번호</th>
						<td>	
							<input type="text" class="form-control" placeholder="01012345678('-' 제외)" name="orderTel" id="orderTel" maxlength="11" required>
						</td>
					</tr>
					<!-- <tr>
						<th>포인트 사용</th>
						<td>	
							<input type="text" class="form-control" name="orderPoint" id="orderPoint" required>
						</td>
					</tr> -->
					<tr>
						<th>배송 메시지</th>
						<td>	
							<input type="text" class="form-control" name="orderMessage" id="orderMessage">
						</td>
					</tr>
					<tr>
						<th>배송 주소</th>
						<td>	
							<input type="text" class="form-control" name="address1" id="address1" readonly />
							<input type="text" class="form-control" name="address2" id="address2" readonly />
							<input type="text" class="form-control" name="address3" id="address3" placeholder="상세 주소 입력" />
						</td>
						<td style="width:100px;">
							<button type="button" class="btn btn-success btn-address" 
									style="background-color: #DCB15D; color: #FFF; border: none; z-index:-1; margin-top: 76px; margin-left:20px;" 
									id="btn-address" onclick="searchAddr()">검색</button>
						</td>
					</tr>
					</div>
				</table>
				<br /><br /><br /><br />
				
				
				
				
				<!-- 배송 상품 -->
				<p style="font-size:20px; font-weight:bold;">배송 상품</p>
				<br />
				<!-- 상품 정보 보여주는 cart foreach -->
				<table style="margin-left: 20px; width:920px; text-align:center; border:1px solid;">
					<tr style="border-bottom: 1px solid;">
						<th style="width:500px;">상품 정보</th>
						<th>수량</th>
						<th>구매가</th>
					</tr>
				<c:forEach items="${cmap.list}" var="cart" varStatus="i">
					<tr>
						<td style="">
							<input type="hidden" id="productName" class="productName" value="${cart.productName}" />
							${cart.productName}
						</td>
						<td>
							${cart.countNum}
							<input type="hidden" name="productNo" id="productNo" class="productNo" value="${cart.productNo}" />
						</td>
						<td>	
							<fmt:formatNumber pattern="###,###,###" value="${cart.money}" />
						</td>
					</tr> 
				</c:forEach>
				</table>
				<br /><br /><br /><br />
				
				
				
				<!-- 총 결제 금액 -->
				<p style="font-size:20px; font-weight:bold;">총 결제 금액</p>
				<table style="margin-left: 20px;">
					<tr>
						<th style="width:160px;">총 상품 금액 : </th>
						<td style="width:300px;">
							<fmt:formatNumber pattern="###,###,###" value="${cmap.sumMoney}" /> 원
						</td>
					</tr>
					<tr>
						<th>배송비 : </th>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${cmap.fee}" /> 원
						</td>
					</tr>
					<tr>
						<th><a style="font-size:20px;">총 결제 금액 : </a></th>
						<td>	
							<a style="font-size:20px; color:red;"><fmt:formatNumber pattern="###,###,###" value="${cmap.allSum}" /> 원</a>
							
							<input type="hidden" name="orderPrice" id="orderPrice" value="${cmap.allSum}"/>
						</td>
					</tr>
				</table>
				
				
					<br />
					<br /><br />
					<div class="pay-btn" style="text-align:center;">
						<button type="button" class="btn btn-success" id="payBtn"
								style="background-color:#DCB15D; color:#FFF; border:none;">결제하기</button>
					</div>
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
			</form>
		</div>
	</div>
	
	
	<script>
	// 결제 기능
	// 결제 api
		var IMP = window.IMP; // 생략가능

		$(function() {
			IMP.init('imp55995809');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$('#payBtn').on('click', function(){

			console.log("클릭됐음");
			console.log($('#orderName').val());
			console.log($('#productName').val());
			console.log(parseInt($('#productNo').val()));
			
				IMP.request_pay({
					pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : 'beautifly',
					amount : parseInt($('#orderPrice').val()),
					buyer_email : $('#orderEmail').text(),
					buyer_name : '주문자:' + $('#orderName').text(),
					buyer_tel : $('#orderTel').text(),
					buyer_addr :  $('#orderAddress').text(),
					buyer_mess : $('#orderMessage').text(),
					buyer_postcode : '01234'
				}, function(rsp) {
					// 결제가 성공했을 때
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						$.ajax({
							url : "${pageContext.request.contextPath}/pay/insertPay.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : 'POST',
							dataType : 'json',
							data : {
								item : 'beautifly',
								code : 'P0001',
								num : 1,
								productNo : parseInt($('#productNo').val()),
								productName : $('#productName').val(),
								orderName : $('#orderName').val(),
								orderEmail : $('#orderEmail').val(),
								orderTel : $('#orderTel').val(),
								orderPrice : parseInt($('#orderPrice').val()),
								orderMessage : $('#orderMessage').val(),
								address1 : $('#address1').val(),
								address2 : $('#address2').val(),
								address3 : $('#address3').val()
							},
							success:function(data){
								location.href="${pageContext.request.contextPath}/pay/insertPay.do";
					        }
						});
							//alert( '결제가 완료 되었습니다.' );
							location.href="${pageContext.request.contextPath}/pay/paySucess.do";
						
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		});
	
	</script>
	
	
	
	<script>

	// 참조 API : http://postcode.map.daum.net/guide
	function searchAddr() { 
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#address1").val(data.zonecode); //5자리 새우편번호 사용
                
                $("#address2").val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $("#address3").focus();
            }
        }).open();
    };
	</script>
	

<c:import url="../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

