<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%-- <% String cust_area= (String)request.getParameter("cust_area"); %> --%>
<!DOCTYPE html>
<%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




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
        /* background-color: rgb(22, 201, 141); */
        width: 40%;
        margin-bottom: 30px;
        border-radius: 5px; 
        font-size: 20px;
        background-image: url('/violet/resources/images/mainmap.jpg');
    	opacity: 0.8; 
    	background-size: 100%;
        }

    </style>
    
    




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
            <c:forEach items="${arealist}" var="custvo">
            <div id="clear" class="col-md-6">
                <div class="card" style="width: 18rem; height:450px; margin-left:150px; margin-bottom: 20px;">                    
				<img src='' onerror="if (this.src != '/경로1/이미지.png') this.src = 'D:\upload\temp\${searcharea.cust_name}.jpg'};" />
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
	
	// var profile = '<c:out value="${profilelist.cust_id}" />';
	
	console.log("cust_id=" + id);
	
 	location.href="/violet/search/profile?cust_id=" + id;

})

</script>  

<script>
$("button[name^=cust_id]").click(function(e){
	var id = e.currentTarget.id.substring("cust_id_".length)
	
	// var profile = '<c:out value="${profilelist.cust_id}" />';
	
	console.log("cust_id=" + id);
	
 	location.href="/violet/search/profile?cust_id=" + id;

})

</script>  



</body>
</html>