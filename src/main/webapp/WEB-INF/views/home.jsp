<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Home</title>
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #C0C0C0;
	overflow-x: hidden;
	transition: 0.5s;
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
.header {
	background:#808080;
	width:100%;
	height:100px;
	display:flex;
	<!--opacity: 0.01;-->
}

.nav .mainlogo{
	margin-left:50px;
	padding-bottom:20px;
	font-size:40px;
	height:30px;
	
}

.mainlogo-link {
	text-decoration:none;
	color:white;
}

.mainlogo a:hover {
	text-decoration:none;
	color:white;
}

.nav .nav_bar{
	margin-right:40px;
	margin-top:25px;
	color:white;
}


@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.mySidenav {
	z-index=10;
}

.main-image {
	width:100%;
	z-index:-1;

}

.home-p{
	padding-bottom:20px;
	right:43%;
	bottom:15%;
	position:absolute;
	z-index:1;
	font-size:25px;
	line-height:-5px;
	text-align:center;
	color:white;
}
</style>

</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="cust/logout";
		})
		
		$("#adminpage").on("click", function(){
			location.href="admin/info";
		})
		
		$("#navlogout").on("click", function(){
			location.href="cust/logout";
		})
		
	})
	
	function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
<body>
<div class="header">
	<div class="nav">
		<h2 class="mainlogo"><a class="mainlogo-link" href="/violet">violet</a></h2>
		<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="cust/login">login</a>
	  <a href="#">mypage</a>
	  <a href="#">story</a>
	  <a href="#">chatting</a>
	  <a href="search/searchmain">search</a>
	  <a href="#">profile</a>
	  <a href="notice/list">service</a>
		</div>
		<span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>
	</div>
	

</div>

<c:if test="${admin != null }">
	<div>
		<p>${admin.cust_id}님 환영 합니다.</p>
		<button id="logoutBtn" type="button">로그아웃</button>
	</div>
</c:if>

<c:if test="${member != null }">
	<div>
		<p>${member.cust_id}님 환영 합니다.</p>
		<button id="logoutBtn" type="button">로그아웃</button>
	</div>
</c:if>

<c:if test="${admin.cust_different == 1}">
	<button id="adminpage" type="button">관리자 페이지</button>
</c:if>
		
	
<div class="home-p"><p>동네 친구 찾을 땐</br>violet로 오세요!</br>we make friends!</p></div>

<img class="main-image" src="/violet/resources/images/1.png" />
</body>
</html>