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
        background-color: rgb(22, 201, 141);
        width: 40%;
        margin-bottom: 30px;
        border-radius: 5px; 
        font-size: 20px;
        background-image: url('/violet/resources/images/mainstudy.jpg');
    	opacity: 0.8; 
    	background-size: 100%;
        }

    </style>

</head>
<body>

  


    <div class="friend1">
        <img src="/violet/resources/images/study.png" style="width:30px; height:30px;" alt="study">
        	공부 친구
    </div>
    
          <select id="cust_study" name="cust_study" class="form-select" style="height: 50px; width: auto;" aria-label="Default select example">
           <option selected>-- 공부선택 --</option>
		   <option value="카페">카페</option>            
		   <option value='스터디카페'>스터디카페</option>
   		   <option value='독서실'>독서실</option>
  		   <option value='스터디룸'>스터디룸</option>
   		   <option value='기타'>기타</option>
          </select>

 
        <br><br>
        
          <div class="row" >
            <c:forEach items="${studylist}" var="custvo">
            <div >
                <div class="card" style="width: 18rem; height:500px; margin-left:140px; margin-bottom: 20px;">                    
				<img src="<c:url value="/img/${custvo.uploadPath}/${custvo.uuid}_${custvo.fileName}" />" style="width:18rem; height:350px;" > 
                    <div class="card-body">
                      <h5 class="card-title">이름 : ${custvo.cust_name } </h5>
                      <p class="card-text">공부 : ${custvo.cust_study }</p>
                      <button type="button" id="cust_id_${custvo.cust_id}" name="cust_id" class="btn btn-outline-primary btn-sm" onclick="location.href='/violet/search/profile'">프로필 보기</button>
                    </div>
                  </div>     
            </div>
            </c:forEach>
            
        </div>


<script>
$("select[name=cust_study]").change(function(){
	var study = $("select[name=cust_study]").val();
	
	location.href="/violet/search/getstudy?cust_study=" + study;
	
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