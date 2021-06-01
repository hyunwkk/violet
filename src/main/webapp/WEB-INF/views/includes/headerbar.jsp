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

<style type="text/css">
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
	margin-top:20px;
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
	margin-top:15px;
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

li {list-style: none; float: left; padding: 10px;}

.pagelist {
	 display: flex;
 	 justify-content: center;
  	 align-items: center;
}

.search{
	float:right;
}


</style>
</head>
<body>
<div class="header">
	<div class="nav">
		<h2 class="mainlogo"><a class="mainlogo-link" href="/violet">violet</a></h2>
		<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="${rootPath}/cust/login">login</a>
	  <a href="#">mypage</a>
	  <a href="#">story</a>
	  <a href="#">chatting</a>
	  <a href="#">search</a>
	  <a href="#">profile</a>
	  <a href="${rootPath}/notice/list">service</a>
		</div>
		<span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>
	</div>	
</div>
</body>
</html>