<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	 function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}

</script>
<style>

.navbar{
	height:110px;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #0B2161;
	overflow-x: hidden;
	transition: 0.5s;
	opacity: 0.8;
	/* padding-top: 60px; */
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}
.nav_bar {
	position: absolute;
	top: 0;
	right: 25px;
	
	
}

.navbar{
	background-color: #0B2161;
    opacity: 0.8;
}

.nav-link{
	color:white;
    font-size:15px;
}

.nav-link a:hover{
	text-decoration:none;
}

.main {
	margin-bottom:20px;
	font-size:45px;

}

.mainlink a:hover{
	text-decoration:none;
    color:white;
}

.login{
	margin-left:20px;
    margin-top:34px;
}

.nav_bar{
	padding-top:15px;
	color:white;
}

.home-p{
	padding-bottom:20px;
	right:43%;
	bottom:30%;
	position:absolute;
	z-index:1;
	font-size:20px;
	line-height:-5px;
	text-align:center;
	color:white;
}

.main-image {
	width:100%;
	z-index:-1;

}

.admin {
	margin-left:10px;
	margin-top:34px;
}

.adminlink a:hover{
	text-decoration:none;
    color:white;
}


</style>
</head>
<body>
	<c:if test="${member == null and admin == null}">
	<nav class="navbar navbar-expand-sm">
	  <!-- Links -->
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <div class="mainlink"><a class="nav-link main" href="/violet">violet</a></div>
	    </li>
	    <li class="nav-item">

	    </li>
	  </ul>		
		  	<div id="mySidenav" class="sidenav">
		        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		        <a href="${rootPath}/cust/login">login</a>
		        <a href="${rootPath}/cust/mypage">mypage</a>
		        <a href="${rootPath}/cust/profile">profile</a>
		        <a href="${rootPath}/story/getAll">story</a>
		        <a href="${rootPath}/email/write.do">email</a>
		        <a href="${rootPath}/search/searchmain">search</a>
		        <a href="${rootPath}/notice/list">service</a>
		    </div>
		    <span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>
	    
	</nav>
	</c:if>

	<c:if test="${member != null || admin != null}">
		<nav class="navbar navbar-expand-sm">
		  <!-- Links -->
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <div class="mainlink"><a class="nav-link main" href="/violet">violet</a></div>
		    </li>
		    <li class="nav-item">
		      <c:if test="${member != null }">
		      <p class="nav-link login">${member.cust_id}님 환영합니다.</p>
		     </c:if>
		     <c:if test="${admin != null }">
		      <p class="nav-link login">${admin.cust_id}님 환영합니다.</p>		      
		     </c:if>
		    </li>
		    <li class="nav-item">
		    	<c:if test="${admin.cust_different == 1}">
		     	<div class="adminlink"><a class="nav-link admin" href="/violet/admin/info">관리자 페이지</a></div>
		     	</c:if>
		    </li>
		  </ul>		
			  	<div id="mySidenav" class="sidenav">
			        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			        <a href="${rootPath}/cust/logout">logout</a>
			        <a href="${rootPath}/cust/mypage">mypage</a>
			        <a href="${rootPath}/cust/profile">profile</a>
			        <a href="${rootPath}/story/getAll">story</a>
			        <a href="${rootPath}/email/write.do">email</a>
			        <a href="${rootPath}/search/searchmain">search</a>
			        <a href="${rootPath}/notice/list">service</a>
			    </div>
			    <span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>		
		</nav>
	</c:if>

</body>
</html>