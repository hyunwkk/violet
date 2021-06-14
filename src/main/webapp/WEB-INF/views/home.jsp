<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="./includes/headerbar.jsp" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
		
	<div class="home-p"><p>동네 친구 찾을 땐</br>violet로 오세요!</br>we make friends!</p></div>
	
	<img class="main-image" src="/violet/resources/images/homeimage.jpg" />
</body>
</html>