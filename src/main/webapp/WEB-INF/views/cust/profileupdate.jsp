<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@include file="../includes/headerbar.jsp" %>


<!DOCTYPE html>
<html>
<head>
<title>profileupdate</title>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
<script>
	$(document).ready(function(){
		
		$(".cencle").on("click", function(){
			if(confirm("정말 취소하시겠습니까?")){
				location.href="/violet/";
			}else{
				return false;
			}		
		})
		
		$("#form_submit").on("click", function(){
			alert("프로필 수정 완료");
			
		})		
		
		$("#cust_smoking").on('click', function(){
			$('input[name=smoking]:checked').val();
		})
		
		$("#cust_drinking").on('click', function(){
			$('input[name=cust_drinking]:checked').val();
		})
		
		$("#cust_exer").on('click', function(){
			$('input[name=cust_exer]:checked').val();
		})
		
		$("#cust_food").on('click', function(){
			$('input[name=cust_food]:checked').val();
		})
		
		$("#cust_pet").on('click', function(){
			$('input[name=cust_pet]:checked').val();
		})
		
		$("#cust_study").on('click', function(){
			$('input[name=cust_study]:checked').val();
		})
		
		$("#cust_hobby").on('click', function(){
			$('input[name=cust_hobby]:checked').val();
		})
	
				
	});
</script>


<div class="container">
             
<div class="row">
    <div class="col-md-12">
         
        <div class="page-header">
            </br><h1>프로필 수정</h1></br>
        </div>      
        <form action="/violet/cust/profileupdatepost" method="post" id="profileform">
     
        	<table class="table table-striped">
		    <thead>
		    </thead>
		    <tbody>		    	
		      <tr>
		        <td>직업</td>
		        <td><input type="text" class="form-control" id="cust_job" name="cust_job"
		        value='<c:out value="${member.cust_job}"/>'/></td>
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
		        	<div class="radio">
		       		<label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="무교">
	                	무교
	                </label>
	                <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="기독교">
	                	기독교
	                </label>
	               <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="불교">
	                	불교
	                </label>
	                <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="천주교">
	                	천주교
	                </label>
	                <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="개신교">
	                	개신교
	                </label>
	                <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="원불교">
	                	원불교
	                </label>
	                <label for="p2">
	                    <input type="radio" id="cust_religion" name="cust_religion" value="기타">
	                	기타
	                </label>
	                </div>
                </td>               
		      </tr>
		      <tr>
		        <td>흡연여부</td>
		        <td>	        	
		        	<label for="p3">
	                    <input type="radio" id="cust_smoking" name="cust_smoking" value="Y">
	                	Y
	                </label>
	                <label for="p3">
	                    <input type="radio" id="cust_smoking" name="cust_smoking" value="N">
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
		        	<input type="text" class="form-control" id="cust_char" name="cust_char"
		        	value='<c:out value="${member.cust_char}"/>'/>
		        </td>
		      </tr>
		      
		      <tr>
		        <td>하고싶은 말</td>
		        <td>
		        	<textarea class="form-control" id ="cust_say" name="cust_say" rows="4" cols="50"
		        	placeholder="자기소개를 자유롭게 작성해주세요!">${member.cust_say}</textarea>
		        </td>
		      </tr>
		      
		    </tbody>
		  </table>
        	
        	<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="form_submit">수정완료</button>
				<button class="cencle btn btn-danger" type="button" id="">취소</button>
				
			</div>
	  
        </form>
    </div>
</div>
     
</div>


</body>
</html>