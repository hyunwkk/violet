<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>
<!DOCTYPE html>
<html>
<style>
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
			<!-- <table class="table table-striped">
			    <thead>
			    </thead>
			    <tbody> -->
			    	<!-- <tr>
			        <td>프로필 사진</td>
			        <td>
			        	<div class='uploadDiv'>
							<input type='file' name='uploadFile' multiple>
						</div>
						
						<button id='uploadBtn'>Upload</button>
			        </td>
			      </tr> -->
			     <%--  <tr>
			        <td>직업</td>
			        <td><input type="text" class="form-control" id="cust_job" name="cust_job"
			        value="${member.cust_job}"></td>
			      </tr>
			      <tr>
			        <td>지역</td>
			        <td>
			        	<select class="form-control" id="cust_area" name="cust_area">
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
		            </td>	            
			      </tr>
			      
			      <tr>
			        <td>종교</td>
			        <td>
			       		<label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="무교"
		                    checked="${member.cust_religion eq '무교' ? 'checked' : 'false'}"/>
		                	무교
		                </label>
		                <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="기독교"
		                    checked="${member.cust_religion eq '기독교' ? 'checked' : 'false'}"/>
		                	기독교
		                </label>
		               <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="불교"
		                    checked="${member.cust_religion eq '불교' ? 'checked' : 'false'}"/>
		                	불교
		                </label>
		                <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="천주교"
		                    checked="${member.cust_religion eq '천주교' ? 'checked' : 'false'}"/>
		                	천주교
		                </label>
		                <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="개신교"
		                    checked="${member.cust_religion eq '개신교' ? 'checked' : 'false'}"/>
		                	개신교
		                </label>
		                <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="원불교"
		                    checked="${member.cust_religion eq '원불교' ? 'checked' : 'false'}"/>
		                	원불교
		                </label>
		                <label for="p2">
		                    <input type="radio" id="cust_religion" name="cust_religion" value="기타"
		                    checked="${member.cust_religion eq '기타' ? 'checked' : 'false'}"/>
		                	기타
		                </label>
	                </td>               
			      </tr>
			      <tr>
			        <td>흡연여부</td>
			        <td>	        	
			        	<label for="p3">
		                    <input type="radio" id="cust_smoking" name="cust_smoking" value="Y"
		                    checked="${member.cust_smoking eq 'Y' ? 'checked' : ''}"/>
		                	Y
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_smoking" name="cust_smoking" value="N"
		                    checked="${member.cust_smoking eq 'N' ? 'checked' : ''}"/>
		                	N
		                </label>
			        </td>
			      </tr>
			      <tr>
			        <td>음주 주량</td>
			        <td>
			        	<label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="X">
		                	X
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="1병">
		                	1병
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="2병">
		                	2병
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="3병">
		                	3병
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="4병">
		                	4병
		                </label>
		                <label for="p3">
		                    <input type="radio" id="cust_drinking" name="cust_drinking" value="4병이상">
		                	4병이상
		                </label>
			        </td>
			      </tr>
			      <tr>
			        <td>좋아하는 운동</td>
			        <td>
			        	<label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="헬스">
		                	헬스
		                </label>
			        	<label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="런닝">
		                	런닝
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="요가">
		                	요가
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="필라테스">
		                	필라테스
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="야구">
		                	야구
		                </label>	        
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="축구">
		                	축구
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="농구">
		                	농구
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="테니스">
		                	테니스
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="복싱">
		                	복싱
		                </label>
		                <label for="p4">
		                    <input type="radio" id="cust_exer" name="cust_exer" value="기타">
		                	기타
		                </label>
			        </td>
			      </tr>
			      <tr>
			        <td>음식</td>
			        <td>
			        	<label for="p5">
		                    <input type="radio" id="cust_food" name="cust_food" value="한식">
		                	한식
		                </label>
		                <label for="p5">
		                    <input type="radio" id="cust_food" name="cust_food" value="양식">
		                	양식
		                </label>
		                <label for="p5">
		                    <input type="radio" id="cust_food" name="cust_food" value="중식">
		                	중식
		                </label>
		                <label for="p5">
		                    <input type="radio" id="cust_food" name="cust_food" value="일식">
		                	일식
		                </label>
		                <label for="p5">
		                    <input type="radio" id="cust_food" name="cust_food" value="기타">
		                	기타
		                </label>
			        </td>
			      </tr>
			      
			      <tr>
			        <td>애완동물</td>
			        <td>
			        	<label for="p6">
		                    <input type="radio" id="cust_pet" name="cust_pet" value="강아지">
		                	강아지
		                </label>
		                <label for="p6">
		                    <input type="radio" id="cust_pet" name="cust_pet" value="고양이">
		                	고양이
		                </label>
		                <label for="p6">
		                    <input type="radio" id="cust_pet" name="cust_pet" value="조류">
		                	조류
		                </label>
		                <label for="p6">
		                    <input type="radio" id="cust_pet" name="cust_pet" value="파충류">
		                	파충류
		                </label>
		                <label for="p6">
		                    <input type="radio" id="cust_pet" name="cust_pet" value="기타">
		                	기타
		                </label>
			        </td>
			      </tr>
			      
			      <tr>
			        <td>공부</td>
			        <td>
			        	<label for="p7">
		                    <input type="radio" id="cust_study" name="cust_study" value="카페">
		                	카페
		                </label>
		               <label for="p7">
		                    <input type="radio" id="cust_study" name="cust_study" value="스터디카페">
		                	스터디카페
		                </label>
		                <label for="p7">
		                    <input type="radio" id="cust_study" name="cust_study" value="독서실">
		                	독서실
		                </label>
		                <label for="p7">
		                    <input type="radio" id="cust_study" name="cust_study" value="스터디룸">
		                	스터디룸
		                </label>
		                <label for="p7">
		                    <input type="radio" id="cust_study" name="cust_study" value="기타">
		                	기타
		                </label>
			        </td>
			      </tr>
			      
			      <tr>
			        <td>취미</td>
			        <td>
			        	<label for="p8">
		                    <input type="radio" id="cust_hobby" name="cust_hobby" value="쇼핑">
		                	쇼핑
		                </label>
		                <label for="p8">
		                    <input type="radio" id="cust_hobby" name="cust_hobby" value="게임">
		                	게임
		                </label>
		                <label for="p8">
		                    <input type="radio" id="cust_hobby" name="cust_hobby" value="운동">
		                	운동
		                </label>
		                <label for="p8">
		                    <input type="radio" id="cust_hobby" name="cust_hobby" value="독서">
		                	독서
		                </label>
		                <label for="p8">
		                    <input type="radio" id="cust_hobby" name="cust_hobby" value="기타">
	                		기타
		                </label>
			        </td>
			      </tr>
			      
			      <tr>
			        <td>성격을 표현한다면?</td>
			        <td>
			        	<input type="text" class="form-control" id="cust_char" name="cust_char"/>
			        </td>
			      </tr>
			      
			      <tr>
			        <td>하고싶은 말</td>
			        <td>
			        	<textarea class="form-control" id ="cust_say" name="cust_say" rows="4" cols="50"
			        	placeholder="자기소개를 자유롭게 작성해주세요!"></textarea>
			        </td>
			      </tr>
			      
			    </tbody>
			  </table> --%>
						
				
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