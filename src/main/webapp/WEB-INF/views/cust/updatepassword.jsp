<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>비밀번호 변경</title>
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

	$("#update_submit").on("click", function(){
		
		if ($("#cust_password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#cust_password").focus();
			return false;
		}
		
		$.ajax({
			url: "/violet/cust/passChk",
			type: "POST",
			dataType : "json",
			data: $("#updateForm").serializeArray(),
			success: function(data){
				if(data==true && $("#new_password").val() == $("#newPasswordChk").val() && $("#new_password").val() != ""){
					console.log("비밀번호 확인");
	 					if(confirm("비밀번호를 수정하시겠습니까?")){
	 						
	 						$("#updateForm").submit();
						}
					
				}else if($("#new_password").val() == "" || $("#newPasswordChk").val() == null){
		               alert("새 패스워드를 입력하세요.");
		               return;
	
				}else if ($("#new_password").val() != $("#newPasswordChk").val() ){
					alert("새 패스워드가 일치하지 않습니다.");
					return
				}
				
				else{
					alert("패스워드가 일치하지 않습니다. ");
					return;
					} 
				}
				
			})
		

	})
})
</script>
<body>
	<section id="container">
			<h2 id="updatelogo">비밀번호 변경</h2><br/>
		<form role="form" id="updateForm" action="/violet/cust/updatePassword" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_id">아이디</label> 
				<input class="form-control" type="text" id="cust_id" name="cust_id" value="${member.cust_id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_password">패스워드</label> 
				<input class="form-control" type="password" id="cust_password" name="cust_password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_password">새 패스워드</label> 
				<input class="form-control" type="password" id="new_password" name="new_password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_password">새 패스워드 확인</label> 
				<input class="form-control" type="password" id="newPasswordChk" name="newPasswordChk" />
			</div>	
			<div class="form-group has-feedback">
			</div>  
		</form>
				<button type="button" class="btn btn-success" id="update_submit" value="변경">변경</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
	</section>

</body>

</html>