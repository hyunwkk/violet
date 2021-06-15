<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>
<!DOCTYPE html>
<html>
<style>
.container{
	z-index:-1;
}
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
  width: 30%;
}
	
</style>
<head>
<meta charset="UTF-8">
<title>myprofile</title>

</head>
<body>
<div class="container">
             
<div class="row">
    <div class="col-md-12">
         
        <div class="page-header">
            </br><h1>my profile</h1></br>
        </div>        
	
			<c:if test="${member != null }">
				
				<div class="row">
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
					</div>
					
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_id">아이디</label>
					<input class="form-control" type="text" id="cust_id" name="cust_id" 
					value='<c:out value="${profile.cust_id}"/>' readonly="readonly"/>
				</div>
			
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_job">직업</label>
					<input class="form-control" type="text" id="cust_job" name="cust_job"
					value='<c:out value="${profile.cust_job}"/>' readonly="readonly"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_area">지역</label>
					<input class="form-control" type="text" id="cust_area" name="cust_area"
					value='<c:out value="${profile.cust_area}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_religion">종교</label>
					<input class="form-control" type="text" id="cust_religion" name="cust_religion"
					value='<c:out value="${profile.cust_religion}"/>' readonly="readonly"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_smoking">흡연</label>
					<input class="form-control" type="text" id="cust_smoking" name="cust_smoking"
					value='<c:out value="${profile.cust_smoking}"/>' readonly="readonly"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_drinking">음주</label>
					<input class="form-control" type="text" id="cust_drinking" name="cust_drinking"
					value='<c:out value="${profile.cust_drinking}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_exer">운동</label>
					<input class="form-control" type="text" id="cust_exer" name="cust_exer"
					value='<c:out value="${profile.cust_exer}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_food">음식</label>
					<input class="form-control" type="text" id="cust_food" name="cust_food"
					value='<c:out value="${profile.cust_food}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_pet">애완동물</label>
					<input class="form-control" type="text" id="cust_pet" name="cust_pet"
					value='<c:out value="${profile.cust_pet}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_study">공부</label>
					<input class="form-control" type="text" id="cust_study" name="cust_study"
					value='<c:out value="${profile.cust_study}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_hobby">취미</label>
					<input class="form-control" type="text" id="cust_hobby" name="cust_hobby"
					value='<c:out value="${profile.cust_hobby}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_char">특징</label>
					<input class="form-control" type="text" id="cust_char" name="cust_char"
					value='<c:out value="${profile.cust_char}"/>' readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_say">하고싶은말</label>
					<textarea class="form-control" id="cust_say" name="cust_say" rows="4" cols="50" 
					readonly="readonly">${profile.cust_say}</textarea>
				</div>
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="profileupdate">프로필 수정</button>
				</div>
			
			</c:if>
			
    </div>
</div>
    
</div>
<script>
$(document).ready(function(){
	$("#profileupdate").on("click", function(){
		location.href='/violet/cust/profileupdate';
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