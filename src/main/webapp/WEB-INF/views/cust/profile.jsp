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

<style>

body {
	background-color:#D070FD;
	font-family: "Lato", sans-serif;
}

.mainlogo {
	text-align:center;
	margin-left: 50px;
	padding-bottom: 20px;
	font-size: 40px;
	height: 30px;
}

.mainlogo-link {
	text-decoration: none;
	color: white;
}

#container{
	padding:40px 400px 40px 400px;	
	z-index:1;
}
</style>

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
	<h2 class="mainlogo">
		<a class="mainlogo-link" href="/violet">violet</a>
	</h2>
	<section id="container">
		<form action="/violet/cust/profile" method="post">
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
				<button class="btn btn-success" type="submit" id="submit">저장</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>
	
</html>