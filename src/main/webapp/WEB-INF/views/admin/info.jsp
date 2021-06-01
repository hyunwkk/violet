<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
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
  <title>전체회원정보 조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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
		  <a href="search/searchmain">search</a>
		  <a href="#">profile</a>
		  <a href="${rootPath}/notice/list">service</a>
			</div>
			<span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>
		</div>	
	</div>
	

	<div class="container">
	<h3>전체회원 정보 조회</h3>
	<div class="search">
	    <select name="searchType">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
	      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
	      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
	      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>연락처</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	
	    <button id="searchBtn" type="button">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "info" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
	  </div>
	<table class="table">
	    <thead class="thead-dark">
	      <tr>
	        <th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>연락처</th>
			<th>주소</th>
			<th>가입일</th>
			<th>회원구분</th>
			<th>메뉴</th>
	      </tr>
	    </thead>
	    <c:forEach var="info" items="${custlist}" varStatus="st">
	    <tr>
	        <th>${info.cust_id}</th>
			<th>${info.cust_password}</th>
			<th>${info.cust_name}</th>
			<th>${info.cust_gender}</th>
			<th>${info.cust_phone}</th>
			<th>${info.cust_address}</th>
			<th><fmt:formatDate pattern="yyyy-MM-dd" value="${info.cust_joindate}" /></th>
			<th>${info.cust_different}</th>
			<th class="delete"><a href="${rootPath}/admin/delete_proc.do?key=${info.cust_id}">삭제</a></th>
	    </tr>
	    </c:forEach>   
	  </table>	  
	  <input type="hidden" id ="cust_dele" value="" />
	</div>

	<div class="pagelist">
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="info${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="info${pageMaker.makeSearch(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="info${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div> 
	 
	<script>	 
 	 $(".delete").on("click",function(){
 		  if (confirm("정말 삭제하시겠습니까?" )){
 			alert("회원 삭제 완료!");  
 		   }else {
 			alert("취소하였습니다.");
 			  return false;
 		  }
	 });
	</script>  	

</body>
</html>
