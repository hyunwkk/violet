<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<c:if test="${member.cust_id == null && admin.cust_id == null }">
   <script>
      alert("로그인 후 이용가능합니다.");
      location.href="../cust/login";
   </script>
</c:if>
<style>
.profile-create {
position:absolute;
 top:40%;
 left:40%;
}

.profile-create button:hover{
background-color: #0B2161;
}

.btn-secondary {
height:100px;
width:300px;
background-color: #0B2161;
opacity:0.8;
font-size:20px;
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
			<button type="button" class="btn btn-secondary" id="createBtn">Profile Create</button>
		</div>
	</c:if>
	<c:if test="${member.cust_job != null}">
		<div class="profile-create">		
			<button type="button" class="btn btn-secondary" id="updateBtn">Profile</button>
		</div>
	</c:if>
	
</body>
</html>