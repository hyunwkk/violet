<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../includes/headerbar.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.header{
    text-align: center;
    color: cornsilk;
    padding: 10px;
    background-color: gray;
    width: 100%;
    font-size: 50px;
    margin-bottom: 0;
    
    }

.friend1{
    padding:20px;
    color: black;
    width: 40%;
    margin-bottom: 30px;
    border-radius: 5px; 
    font-size: 20px;
    background-image: url('/violet/resources/images/mainmap.jpg');
	opacity: 0.8; 
	background-size: 100%;
    }


</style>

</head>
<body>






<div class="friend1">
    <img src="/violet/resources/images/area.png" style="width:30px; height:30px;" alt="area">
내 주변 친구</div>

	<select id="cust_area" name="cust_area" class="form-select" style="height: 50px; width: auto;" aria-label="Default select example">
       <option value="" selected disabled hidden>지역 선택</option>
		<option value="서울">서울</option>
		<option value="경기">경기</option>
		<option value="인천">인천</option>
		<option value="강원">강원</option>
		<option value="충북">충북</option>
		<option value="세종">세종</option>
		<option value="경북">경북</option>
		<option value="충남">충남</option>
		<option value="대구">대구</option>
		<option value="대전">대전</option>
		<option value="울산">울산</option>
		<option value="전북">전북</option>
		<option value="광주">광주</option>
		<option value="부산">부산</option>
		<option value="경남">경남</option>
		<option value="전남">전남</option>
		<option value="제주">제주</option>
	</select>
   

 <br><br>

<div id="all" class="row" >
     <c:forEach items="${list}" var="custvo">
    <div id="clear">
        <div class="card" style="width: 18rem; height:500px; margin-left:140px; margin-bottom: 20px;">                    
			<img src="<c:url value="/img/${custvo.uploadPath}/${custvo.uuid}_${custvo.fileName}" />" style="width:18rem; height:350px;" > 
            <div class="card-body">
              <h5 class="card-title">이름 : ${custvo.cust_name} </h5>
              <p class="card-text">지역 : ${custvo.cust_area}</p>
              <button type="button" id="cust_id_${custvo.cust_id}" name="cust_id" class="btn btn-outline-primary btn-sm" onclick="location.href='/violet/search/profile'" >프로필 보기</button>
            </div>  <!--  -->
          </div>     
    </div>
    </c:forEach>
</div>

        
<script>
$("select[name=cust_area]").change(function(){
	var area = $("select[name=cust_area]").val();
	
	location.href="/violet/search/getarea?cust_area=" + area;
	
})

</script>

<script>
$("button[name^=cust_id]").click(function(e){
	var id = e.currentTarget.id.substring("cust_id_".length)
	
	
	console.log("cust_id=" + id);
	
 	location.href="/violet/search/profile?cust_id=" + id;

})

</script>   








</body>
</html>