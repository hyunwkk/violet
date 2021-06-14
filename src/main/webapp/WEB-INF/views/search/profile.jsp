<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!DOCTYPE html>

<!-- bootstrap -->
<%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
 --%>
<head></head>

<style>
table{}
tr { display: block; float: left; }
th, td { display: block; margin:10px; } 


.uploadResult{
	width:100%
	display:flex;
}

.uploadResult ul{
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100%;
  padding-top:15px;
  padding-right:43px;
}

#goemail {
	margin-left:10px;
	margin-bottom:10px;
}

.whole{
	margin-left:8%;
}
</style>




<body>
    
<!--    <h1 class="header" style=" text-align: center; color: cornsilk; padding: 10px; background-color: gray;
    width: 100%; font-size: 50px; margin-bottom: 50px;">search</h1>  --> 
	<br>
    <h2 class="header2" style="text-align: center;">${profile.cust_name}님의 profile</h2>

    <hr style="width: 60%; margin-left: 20%; margin-right: 20%;">
    <br>


    <!-- <div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				
				<div class="panel-body">
					<div class='uploadResult'>
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<div class="whole">
	    <div style="width: 1000px; height: auto; " >
	        <div class="card" style="float: left; width: 300px; height: auto; margin-left:30%;">
	        	<div class="row">
					<!-- <div class="col-lg-12">
						<div class="panel panel-default"> -->
							
							<div class="panel-body">
								<div class='uploadResult'>
									<ul>
									</ul>
								</div>
							</div>
						<!-- </div>
					</div> -->
				</div>
	            
	            <div class="card-body">
	              <h5 class="card-title" style="text-align:center;">${profile.cust_name}</h5>
	              <p class="card-text">${profile.cust_say }</p>
	
	            </div>
	        </div> 
	
	          <div style="float: right;" >
	          <table class="table table-striped"  >
	            <tr style="margin:10px">
	           	  
	              <th>직업</th>
	              <th>지역</th>
	              <th>종교</th>
	              <th>흡연</th>
	              <th>주량</th>
	              <th>취미</th>
	              <th>성격</th>
	              <th>이메일</th>
	            </tr>
	            
	            <tr style="margin:10px">
	              <td>${profile.cust_job}</td>
	              <td>${profile.cust_area}</td>
	              <td>${profile.cust_religion}</td>
	              <td>${profile.cust_smoking}</td>
	              <td>${profile.cust_drinking}</td>
	              <td>${profile.cust_hobby}</td>
	              <td>${profile.cust_char}</td>
	              <td>${profile.cust_email}</td>
	            </tr>
	        </table>
	        <button class="btn btn-success" type="button" id="goemail">이메일보내기</button>
	        </div>
	
	    </div>
    </div>
<script>
$(document).ready(function(){
	$("#goemail").on("click", function(){
		location.href='/violet/email/write.do';
	});
	
});
</script>    
 
 <script>
$(document).ready(function(){
	
	
	
	(function(){
		
		var cust_id = '<c:out value="${profile.cust_id}"/>';
		
		$.getJSON("/violet/cust/getAttachList", {cust_id: cust_id}, function(arr){
			console.log(arr);
			
		       var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.fileType){
		           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<img src='/violet/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{
		           
		           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		           str += "<span> "+ attach.fileName+"</span><br/>";
		           str += "<img src='/resources/img/attach.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }				
		});
		       
		    $(".uploadResult ul").html(str); 
		});
		
	})();
	
});

</script> 
    




</body>
</html>