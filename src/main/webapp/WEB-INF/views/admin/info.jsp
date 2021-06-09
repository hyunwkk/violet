<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/headerbar.jsp" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">

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
  <title>전체 회원정보 조회</title>
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
			<%-- <th>${info.cust_password}</th> --%>
			<th>*******</th>
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
