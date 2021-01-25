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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
<style>
.login-form{
	padding: 90px;
    margin: 0 auto;
    width: 500px;
}
tr{
	height: 50px;
}
</style>

</head>

<body>
<c:import url="../common/menubar.jsp"/>

<div class="login-form" style="text-align:center;">
  <form name="memberLoginFrm" action="memberLogin.do" method="post" >
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<div id="userId-container">
					<input type="text" class="form-control" name="memberId" id="memberId_" required>
            	</div>
			</td>
		</tr>
		<tr>
			<th>비밀번호&nbsp;&nbsp;</th>
			<td>
				<input type="password" class="form-control" name="memberPw" id="memberPw_" required>
			</td>
		</tr>
	</table>
	<br />
		<div class="login-btn" style="text-align:center;">
			<input type="submit" class="btn btn-success" value="로그인" 
					style="background-color: #DCB15D; color: #FFF; border: none; ">
		</div>
	</form>
	
	<br /><br />
	
	<p style="font-size:12px; text-align:center;">
		회원이 아닌가요?&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/member/memberJoin.do" style="color:#000; text-decoration: underline;">회원가입 하러가기</a>
	</p>
	
</div>

<c:import url="../common/footer.jsp"/>

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

