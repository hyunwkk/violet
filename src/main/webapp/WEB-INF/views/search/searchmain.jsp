<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script> -->

<html>
<head>
<meta charset="UTF-8">
<title>search</title>
</head>
<body>


<style>

.header{
    text-align: center;
    color: #0B2161;
    padding: 10px;
    width: 100%;
    margin-bottom: 50px;
    font-size: 50px;
    
}

.friend{
    text-align: center;
}

.friend1{
    padding:20px;
    color: white;
    background-color: orange;
    width: 50%;
    margin-bottom: 50px;
    border-radius: 5px; 
    display: inline-block;
    font-size: 20px;
    background-image: url('/violet/resources/images/mainmap.jpg');
	opacity: 0.8; 
	background-size: 100%; 
}

.friend2{
    padding:20px;
    color: white; 
    /* background-color: rgb(22, 201, 141); */
    width: 50%;
    margin-bottom: 50px;
    border-radius: 5px; 
    display: inline-block;
    font-size: 20px;
    background-image: url('/violet/resources/images/mainmeal.jpg');
	opacity: 0.8;
	background-size: 100%; 
}


.friend3{
    padding:20px;
    color: white;
    /* background-color: rgb(46, 79, 224); */
    width: 50%;
    margin-bottom: 50px;
    border-radius: 5px; 
    display: inline-block;
    font-size: 20px;
    background-image: url('/violet/resources/images/mainexercise.jpg');
	opacity: 0.8;
	background-size: 100%; 
}
.friend4{
    padding:20px;
    color: white;
    /* background-color: rgb(223, 33, 160); */
    width: 50%;
    margin-bottom: 50px;
    border-radius: 5px; 
    display: inline-block;
    font-size: 20px;
    background-image: url('/violet/resources/images/mainpet.jpg');
	opacity: 0.8;
	background-size: 100%; 
}
.friend5{
    padding:20px;
    color: white;
    background-color: rgb(36, 48, 104);
    width: 50%;
    margin-bottom: 50px;
    border-radius: 5px; 
    display: inline-block;
    font-size: 20px;
    background-image: url('/violet/resources/images/mainstudy.jpg');
	opacity: 0.8;
	background-size: 100%; 
}

</style>
<c:if test="${member.cust_id == null && admin.cust_id == null }">
   <script>
      alert("로그인 후 이용가능합니다.");
      location.href="../cust/login";
   </script>
</c:if>

	<h3 class="header">search</h3>
    <div class="friend">
        <div class="friend1">
            <img src="/violet/resources/images/area.png" style="width:30px; height:30px; " alt="map">
         	<a href="/violet/search/area" style="text-decoration: none; color:#0B2161;">내 주변 친구</a>
        </div> 
   

        <div class="friend2">
            <img src="/violet/resources/images/meal.png" style="width:30px; height:30px; " alt="meal">
            <a href="/violet/search/food" style="text-decoration: none;  color:#0B2161;">밥 같이 먹을 친구</a>
        </div>
        
        <div class="friend3">
            <img src="/violet/resources/images/exercise.png" style="width:30px; height:30px;" alt="exercise">
       		<a href="/violet/search/exercise" style="text-decoration: none;  color:#0B2161;">즐겁게 운동 친구</a>
            </div>
            
        <div class="friend4">
            <img src="/violet/resources/images/pet.png" style="width:30px; height:30px;" alt="pet">
            <a href="/violet/search/pet" style="text-decoration: none;  color:#0B2161;">반려동물 친구</a>
            </div>
            
        <div class="friend5">
            <img src="/violet/resources/images/study.png" style="width:30px; height:30px;" alt="study">
            <a href="/violet/search/study" style="text-decoration: none;  color:#0B2161;">공부 친구</a>
        </div>



    </div>

</body>
</html>