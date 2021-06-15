<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<html>
<head>

<style>
#container{
	width:50%;
	margin-top:50px;
	margin-left:25%;
}

</style>
<!-- <!-- 합쳐지고 최소화된 최신 CSS -->

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/violet";

		})

		$("#del_submit").on("click", function() {
			if ($("#cust_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#cust_password").focus();
				return false;
			}
			
			$.ajax({
				url: "/violet/cust/passChk",
				type: "POST",
				dataType: "json",
				data: $("#deleteForm").serializeArray(),
				success: function(data){
					if(data==true){
						if(confirm("회원탈퇴를 하시겠습니까?")){
							$("#deleteForm").submit();
						}
					}else{
						alert("패스워드가 일치하지않습니다.");
						return;
					}
				}
			})
			
			/* alert("탈퇴가 완료되었습니다."); */
		});

	})
</script>
<body>
	<section id="container">
		<h3>회원탈퇴</h3><br>
		<form id="deleteForm" action="/violet/cust/custDelete" method="post">
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
				<input class="form-control" type="text" id="cust_name" name="cust_name" value="${member.cust_name}" readonly="readonly" />
			</div>

		</form>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="del_submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		<div>
			<c:if test="${msg == false}">
				비밀번호가 맞지 않습니다.
			</c:if>
		</div>
	</section>
</body>

</html>