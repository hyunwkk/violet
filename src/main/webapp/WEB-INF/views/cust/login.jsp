<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="cust/logout";
		})
		
		$("#register").on("click", function(){
			location.href="/violet/cust/register";
		})
		
	})
</script>
<body>
	<form name='homeForm' method="post" action="/violet/cust/login">
		<c:if test="${member == null}">
			<div>
				<label for="cust_id"></label>
				아이디 : <input type="text" id="cust_id" name="cust_id">
			</div>
			<div>
				<label for="cust_password"></label>
				비밀번호 : <input type="password" id="cust_password" name="cust_password">
			</div>
			<div>
				<button type="submit">로그인</button>
				<!-- test f -->
				 <c:if test="${masg eq '3'}"> 
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				 </c:if> 
				<button type="button" id="register" >회원가입</button>
			</div>
		</c:if>
		
		
	</form>
</body>
</html>