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
        background-image: url('/violet/resources/images/mainexercise.jpg');
    	opacity: 0.8; 
    	background-size: 100%;
        }

    </style>

</head>
<body>

   



    <div class="friend1">
        <img src="/violet/resources/images/exercise.png" style="width:30px; height:30px;" alt="exercise">
        즐겁게 운동 친구</div>
     
        <select id="cust_exer" name="cust_exer" class="form-select" style="height: 50px; width: auto;" aria-label="Default select example">
            <option selected>--운동종목선택 --</option>
            <option value='헬스'>헬스</option>
            <option value='런닝'>런닝</option>
            <option value='요가'>요가</option>
            <option value='필라테스'>필라테스</option>
            <option value='야구'>야구</option>
            <option value='축구'>축구</option>
            <option value='농구'>농구</option>
            <option value='테니스'>테니스</option>
            <option value='복싱'>복싱</option>
            <option value='기타'>기타</option>
            
          </select>

 
        <br><br>
        
              <div class="row" >
            <c:forEach items="${list}" var="custvo">
            <div >
                <div class="card" style="width: 18rem; height:500px; margin-left:140px; margin-bottom: 20px;">                    
				<img src="<c:url value="/img/${custvo.uploadPath}/${custvo.uuid}_${custvo.fileName}" />" style="width:18rem; height:350px;" > 
                    <div class="card-body">
                      <h5 class="card-title">이름 : ${custvo.cust_name } </h5>
                      <p class="card-text">운동종목 : ${custvo.cust_exer }</p>
                      <button type="button" id="cust_id_${custvo.cust_id}" name="cust_id" class="btn btn-outline-primary btn-sm" onclick="location.href='/violet/search/profile'">프로필 보기</button>
                    </div>
                  </div>     
            </div>
            </c:forEach>
            
        </div> 
        
<script>
$("select[name=cust_exer]").change(function(){
	var exer = $("select[name=cust_exer]").val();
	
	location.href="/violet/search/getexer?cust_exer=" + exer;
	

	
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