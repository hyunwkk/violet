<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>비밀번호 찾기</title>

<style>
body {
	font-family: "Lato", sans-serif;
}

.mainlogo {
	text-align: center;
	width:100%;
	padding-bottom: 20px;
	font-size: 40px;
	height: 30px;
}

.mainlogo-link {
	text-decoration: none;
	color: black;
}

#container {
	text-align: center;
	width:100%;
	z-index: 1;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	//- 비번 찾기 버튼 클릭 이벤트
	$("#btnGetLoginPassword").on("click", function(){
		let paramObj = {};
		paramObj.cust_id = $("#cust_id").val();
		paramObj.cust_email = $("#cust_email").val();
		
		$.ajax({
			url: "/violet/cust/custFindPassword",
			type: 'POST',
			data: paramObj
			
		}).done(function(result){
			if(result == "" && result == null){
				$("#modalFrom").append("<div id='modalPU'><span> 등록되지 않은 회원입니다.</span> <input type='button' id='btnClose' value='닫기' /><div>")
			}else{
				$("#modalFrom").append("<div id='modalPU'><span> 회원님의 비밀번호는 " + result + " 입니다.</span>" + " </div>")
			}
		})
	})	
})	

	
</script>
</head>

<body>
	<br/><br/><br/>
	<div id="container">
	<div id="getLoignPasswordForm">
		<div id="modalFrom"> </div>
		<h4>비밀번호 찾기</h4>
		<input type="text" id="cust_id" value="" placeholder="아이디" /><br/><br/>
		<input type="text" id="cust_email" value="" placeholder="이메일" /><br/><br/>
		<input type="button" id="btnGetLoginPassword" value="찾기"/>
	</div>
	<br/><br/><br/><br/>
	<a href="/violet/cust/custfindid">아이디 찾기</a><br/>
	<a href="/violet/cust/login">로그인 하러 가기</a>
	</div>
</body>
</html>