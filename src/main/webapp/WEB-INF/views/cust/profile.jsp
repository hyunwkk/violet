<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<style>
.profile-create {
position:absolute;
 top:40%;
 left:40%;
}

.btn-secondary {
height:100px;
width:300px;
}
</style>
<meta charset="UTF-8">
<title>profile</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#createBtn").on("click", function() {
			location.href="${rootPath}/cust/profilecreate";
		})
		$("#updateBtn").on("click", function() {
			location.href="${rootPath}/cust/myprofile";
		})
	}) 
</script>
<body>
	<c:if test="${member.cust_job == null}">
		<div class="profile-create">
			<button type="button" class="btn btn-secondary" id="createBtn">프로필 생성</button>
		</div>
	</c:if>
	<c:if test="${member.cust_job != null}">
		<div class="profile-create">		
			<button type="button" class="btn btn-secondary" id="updateBtn">프로필 보기</button>
		</div>
	</c:if>
	
</body>
</html>