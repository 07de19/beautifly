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


<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/modern-business.css">
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/BeautiFly_main.css"> --%>
<style>
.Join-container{
    padding: 60px;
    margin: 0 auto;
    width: 650px;
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
/*중복아이디체크관련*/
div#userId-container{position:relative; padding:0px;}
div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
div#userId-container span.ok{color:green;}
div#userId-container span.error, span.invalid{color:red;}
</style>

</head>

<body>
<c:import url="../common/menubar.jsp"/>
	
<section id="content">
	<div class="Join-container">
		<form name="memberJoinFrm" action="memberJoinEnd.do" method="post" onsubmit="return fn_Join_validate();" >
			<div class="join-form">
			<table>
				<tr>
					<th style="width:130px;">아이디</th>
					<td style="width:300px;">
						<div id="userId-container">
							<input type="text" class="form-control" name="memberId" id="memberId_" required>
							<!-- 아이디중복검사 코멘트추가 -->
							<!-- <span class="guide ok">사용 가능</span>
		            		<span class="guide error">사용 불가</span>
		            		<span class="guide invalid">4글자 미만</span>
		            		<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/> -->
		            	</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" class="form-control" name="memberPw" id="memberPw_" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인&nbsp;&nbsp;</th>
					<td>	
						<input type="password" class="form-control" id="memberPw2" required>
					</td>
				</tr>  
				<tr>
					<th>이름</th>
					<td>	
					<input type="text" class="form-control" name="memberName" id="memberName" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>	
						<input type="tel" class="form-control" placeholder="01012345678('-' 제외)" name="tel" id="tel" maxlength="11" required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>	
						<input type="email" class="form-control" placeholder="abc@example.com" name="email" id="email">
					</td>
				</tr>
				<tr>
					<th>주소</th>
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
				<tr>
					<th>성별 </th>
					<td>
						<div class="form-check form-check-inline">
							<input type="radio" class="form-check-input" name="gender" id="gender0" value="남" checked>
							<label for="gender0">남</label>
							&nbsp;&nbsp;
							<input type="radio" class="form-check-input" name="gender" id="gender1" value="여">
							<label for="gender1">여</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>	
					<input type="number" class="form-control" name="age" id="age">
					</td>
				</tr>
			</table>
				<br />
				<div class="join-btn" style="text-align:center;">
					<input type="submit" class="btn btn-success" value="가입" 
							style="background-color: #DCB15D; color: #FFF; border: none; ">
							&nbsp;&nbsp;
					<input type="reset"  class="btn btn-fail" value="취소"
							style="background-color: #FFF; color: #DCB15D; border-color: #DCB15D; ">
				</div>
			</div>
		</form>
	</div>
	</section>
	
	<script>

	// 참조 API : http://postcode.map.daum.net/guide
	function searchAddr() { 
	/* $(function() {
		$(".btn-address").on("click",function(){ */ 
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
    
	
	$(function(){
		
		$("#memberPw2").blur(function(){
			var p1=$("#memberPw_").val(), p2=$("#memberPw2").val();
			if(p1!=p2){
				alert("패스워드가 일치하지 않습니다.");
				$("#memberPw_").focus();
			}
		});
		/*
		//아이디 중복검사 이벤트 추가
		$("#memberId_").on("keyup", function(){
	        var memberId = $(this).val().trim();
	        
	        if(memberId.length<4) {
	        	$(".guide.error").hide();
	        	$(".guide.ok").hide();
	        	$(".guide.invalid").show();
	        	return;
	        	
	        } else {
	        	
		        $.ajax({
		            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		            data : {memberId:memberId},
		            dataType: "json",
		            success : function(data){
		                console.log(data);
		                // if(data=="true") //stream 방식
		                if(data.isUsable==true){ //viewName 방식
		                    $(".guide.error").hide();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").show();
		                    $("#idDuplicateCheck").val(1);
		                } else {
		                    $(".guide.error").show();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").hide();
		                    $("#idDuplicateCheck").val(0);
		                }
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
	        	});
	     	}
	     //console.log(memberId);
		}); */
	});

	/*
	function validate(){
		var memberId = $("#memberId_");
		if(memberId.val().trim().length<4){
			alert("아이디는 최소 4자리이상이어야 합니다.");
			memberId.focus();
			return false;
		}
		
		//아이디중복체크여부
	    if($("#idDuplicateCheck").val()==0){
	        alert("사용가능한 아이디를 입력해주세요.");
	        return false();
	    }
		
		return true;
	}
	*/
	</script>

<c:import url="../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

