<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>회원가입</title>

<style>
body {
/* 	background-color: #D070FD; */
	font-family: "Lato", sans-serif;
}

.mainlogo {
	text-align: center;
	margin-left: 50px;
	padding-bottom: 20px;
	font-size: 40px;
	height: 30px;
}

.mainlogo-link {
	text-decoration: none;
	color: black;
}

#container {
	padding: 40px 400px 40px 400px;
	z-index: 1;
}
</style>

</head>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 날짜설정
		$(".datepicker").datepicker({
			dateFormat: 'yy-mm-dd'  //날짜 표현형식(2012-03-03)
			,  prevText: '이전달'
	        ,  nextText: '다음달'
            ,  currentText: '오늘'
            ,  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			,  dayNamesShort: ['일','월','화','수','목','금','토'] 
	        ,  dayNamesMin: ['일','월','화','수','목','금','토'] 
			,  weekHeader: 'Wk'
			, autoSize: true //오토리사이즈(body등 상위태그의 설정에 따른다)
	        , changeMonth: true //월변경가능 
	        , changeYear: true //년변경가능
	        , yearRange: '1980:2020' //년도 선택 제한 1980년부터 2020년까지
	        , showMonthAfterYear: true //년 뒤에 월 표시              
	        , buttonText: '달력선택' //버튼 텍스트 표시
 
		});
		//jquery ui - month picker : 동적  css 변경 적용.
		$("#ui-datepicker-div").css("background-color","#fff");
		
		// 취소
		$(".cencle").on("click", function(){
			location.href = "/violet/cust/login";
		}) 
		
		$("#reg_submit").on("click", function(){
			if($("#cust_id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#cust_id").focus();
				return false;
			}
			console.log("bir : " + $("#cust_birth").val());
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}else if(idChkVal == "Y"){
				$("#regForm").submit();
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
			if($("#cust_birth").val()==""){
				alert("생년월일을 입력해주세요.");
				$("#cust_birth").focus();
				return false;
			}
			if($("#cust_gender").val()==""){
				alert("성별을 입력해주세요.");
				$("#cust_gender").focus();
				return false;
			}
			if($("#cust_email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#cust_email").focus();
				return false;
			}
			if($("#cust_phone").val()==""){
				alert("연락처를 입력해주세요.");
				$("#cust_phone").focus();
				return false;
			}
			if($("#cust_address").val()==""){
				alert("주소를 입력해주세요.");
				$("#cust_address").focus();
				return false;
			}
			
			alert("회원가입이 완료되었습니다.");
		});
		
	})
	
	function fn_idChk(){
		//로딩페이지 호출
		//loadingPage(true);
		$.ajax({
			url : "../cust/idChk",
			type : "post",
			dataType : "json",
			data : {"cust_id" : $("#cust_id").val()},
// 			success : function(data){
// 				if(data == 1){
// 					alert("중복된 아이디입니다.");
// 				}else if(data == 0){
// 					$("#idChk").attr("value","Y");
// 					alert("사용가능한 아이디입니다.");
// 				}
// 			},
// 			fail : function(err){
// 				console.log("중복 체크 오류 입니다 => " + err)
// 			}
		}).done(function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value","Y");
				alert("사용가능한 아이디입니다.");
			}
		})/* .catch(function(err){
			console.log("중복 체크 오류 입니다 => " + err);
			return;
		}).always(function(){}); */
		
	}
</script>
<body>
	<h2 class="mainlogo">
		<a class="mainlogo-link" href="/violet">violet</a>
	</h2>
	<section id="container">
		<form action="/violet/cust/custReg" method="post" id="regForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_id">아이디</label> 
				<input class="form-control" type="text" id="cust_id" name="cust_id" maxlength="20" pattern="^([a-z0-9_]){7,20}$" placeholder="영문/숫자 조합하여 8~20자로 입력" required/>
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_password">패스워드</label> 
				<input class="form-control" type="password" id="cust_password" name="cust_password" maxlength="20" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,20}$" placeholder="영문대소문자/특수문자/숫자 조합하여 8~20자로 입력" required />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_name">성명</label> 
				<input class="form-control" type="text" id="cust_name" name="cust_name" maxlength="25" pattern="[가-힣]{2,25}" placeholder="이름은 한글로 입력" required />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_birth">생년월일</label><br>
				<input type="text" class="datepicker" id="cust_birth" name="cust_birth" required/> <!-- 날짜설정해주는 jquery ui datepicker -->
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_gender">성별</label><br>
				<input type="radio" id="cust_gender" name="cust_gender" value="1" />남자
				<input type="radio" id="cust_gender" name="cust_gender" value="2" />여자
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_phone">연락처</label> 
				<input class="form-control" type="text" id="cust_phone" name="cust_phone" required/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_email">이메일</label> 
				<input class="form-control" type="text" id="cust_email" name="cust_email" required/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="cust_address">주소</label> 
				<input class="form-control" type="text" id="cust_address" name="cust_address" required/>
			</div>
			<input type="hidden" value="0" id="different" name="differnet" />

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="reg_submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>

</html>