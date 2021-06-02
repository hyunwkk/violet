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
<title>회원정보수정</title>
<style>

#container {
	padding: 40px 400px 40px 400px;
	z-index: 1;
}

#updatelogo {
	margin-left: 35%;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/violet";

		})

		$("#update_submit").on("click", function() {
			if ($("#cust_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#cust_password").focus();
				return false;
			}
			if ($("#cust_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#cust_name").focus();
				return false;
			}
			
			alert("수정이 완료되었습니다.");
		});

	})
</script>
<body>
	<div>
		<div id="login_all">
			<c:if test="${member != null }">
				<div id="login_suc_header">
					<p id="info_loginUser">${member.cust_id}님환영 합니다.</p>
					<button id="logoutBtn" type="button" onclick="location.href='./cust/logout'">로그아웃</button>
				</div>
			</c:if>
		</div>
		<div>
			<a href="/violet/cust/mypage">회원정보수정</a><br/>
			<a href="#">비밀번호수정</a> <br/>
			<a href="/violet/cust/delete">회원탈퇴</a><br/>
		</div>		
	</div>


	<section id="container">
			<h2 id="updatelogo">회원정보수정</h2><br/>
		<form action="/violet/cust/custUpdate" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_id">아이디</label> 
				<input class="form-control" type="text" id="cust_id" name="cust_id" value="${member.cust_id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_password">패스워드</label> 
				<input class="form-control" type="password" id="cust_password" name="cust_password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_name">성명</label> 
				<input class="form-control" type="text" id="cust_name" name="cust_name" value="${member.cust_name}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_address">주소</label> 
				<input class="form-control" type="text" id="cust_address" name="cust_address" value="${member.cust_address}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_phone">전화번호</label> 
				<input class="form-control" type="text" id="cust_phone" name="cust_phone" value="${member.cust_phone}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_email">이메일</label> 
				<input class="form-control" type="text" id="cust_email" name="cust_email" value="${member.cust_email}" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="update_submit">수정완료</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>