<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#cust_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#cust_id").focus();
					return false;
				}
				if($("#cust_password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#cust_password").focus();
					return false;
				}
				if($("#cust_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#cust_name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/violet/cust/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_name">성명</label>
					<input class="form-control" type="text" id="cust_name" name="cust_name" />
				</div>
				<!--  <div class="form-group has-feedback">
					<label class="control-label" for="cust_birth">생일</label>
					<input class="form-control" type="text" id="cust_birth" name="cust_birth" />
				</div>-->
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_gender">성별</label>
					<input class="form-control" type="text" id="cust_gender" name="cust_gender" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_id">아이디</label>
					<input class="form-control" type="text" id="cust_id" name="cust_id" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_password">패스워드</label>
					<input class="form-control" type="password" id="cust_password" name="cust_password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_address">주소</label>
					<input class="form-control" type="text" id="cust_address" name="cust_address" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_phone">연락처</label>
					<input class="form-control" type="text" id="cust_phone" name="cust_phone" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_job">직업</label>
					<input class="form-control" type="text" id="cust_job" name="cust_job" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_area">지역</label>
					<input class="form-control" type="text" id="cust_area" name="cust_area" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_religion">종교</label>
					<input class="form-control" type="text" id="cust_religion" name="cust_religion" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_smoking">흡연</label>
					<input class="form-control" type="text" id="cust_smoking" name="cust_smoking" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_drinking">음주</label>
					<input class="form-control" type="text" id="cust_drinking" name="cust_drinking" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_exer">운동</label>
					<input class="form-control" type="text" id="cust_exer" name="cust_exer" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_food">음식</label>
					<input class="form-control" type="text" id="cust_food" name="cust_food" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_pet">애완동물</label>
					<input class="form-control" type="text" id="cust_pet" name="cust_pet" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_study">공부</label>
					<input class="form-control" type="text" id="cust_study" name="cust_study" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_hobby">취미</label>
					<input class="form-control" type="text" id="cust_hobby" name="cust_hobby" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_char">특징</label>
					<input class="form-control" type="text" id="cust_char" name="cust_char" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_photo">사진</label>
					<input class="form-control" type="text" id="cust_photo" name="cust_photo" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_say">하고싶은말</label>
					<input class="form-control" type="text" id="cust_say" name="cust_say" />
				</div>
				<input type="hidden" value="0" id="different" name="differnet" />
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>