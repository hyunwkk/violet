<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        background-image: url('/violet/resources/images/mainmeal.jpg');
    	opacity: 0.8; 
    	background-size: 100%;
        }

    </style>
</head>
<body>


    <div class="friend1">
        <img src="/violet/resources/images/meal.png" style="width:30px; height:30px;" alt="area">
        밥 같이 먹을 친구</div>
     
        <select id="cust_food" name="cust_food" class="form-select" style="height: 50px; width: auto;" aria-label="Default select example">
            <option selected>-- 음식선택 --</option>
            <option value='한식'>한식</option>
            <option value='중식'>중식</option>
            <option value='양식'>양식</option>
            <option value='일식'>일식</option>
            <option value='카페/디저트'>카페/디저트</option>
          </select>


        <br><br>
      
       <div id="all" class="row" >
            <c:forEach items="${foodlist}" var="custvo">
            <div id="clear">
                <div class="card" style="width: 18rem; height:500px; margin-left:140px; margin-bottom: 20px;">                    
				<img src="<c:url value="/img/${custvo.uploadPath}/${custvo.uuid}_${custvo.fileName}" />" style="width:18rem; height:350px;" > 
                    <div class="card-body">
                      <h5 class="card-title">이름 : ${custvo.cust_name } </h5>
                      <p class="card-text">음식취향 : ${custvo.cust_food }</p>
                      <button type="button" id="cust_id_${custvo.cust_id}" name="cust_id" class="btn btn-outline-primary btn-sm" onclick="location.href='/violet/search/profile'">프로필 보기</button>
                    </div>
                  </div>     
            </div>
            </c:forEach>
        </div> 

<script>
$("select[name=cust_food]").change(function(){
	var food = $("select[name=cust_food]").val();
	
	location.href="/violet/search/getfood?cust_food=" + food;
	

	
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