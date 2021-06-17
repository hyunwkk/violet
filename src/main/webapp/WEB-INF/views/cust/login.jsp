<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/headerbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
   overflow-x:hidden;
   font-family: "Lato", sans-serif;
}

.container{
	margin-left:38%;
	margin-top:30px;
}

.mainlogo {
   text-align: center;
   /* margin-left: 50px; */
   width:100%;
   padding-bottom: 20px;
   font-size: 40px;
   height: 30px;
}

.mainlogo-link {
   text-decoration: none;
   color: black;
}

/* #container {
   width:100%;
   margin-top:30px;
   margin-left:50%;
   z-index: 1;
} */

#register {
	margin-left: 15px;
   	width:50%;
   	text-align:center;
   
}

#findBtn {	
   	font-size: 14px;
	width:100%;
	text-align:center;
}

#minicon{
	margin-top:10px;
	display:flex;
	width:100%;

}

.panel-title{
	text-align:center;
}
</style>
</head>

<script type="text/javascript">
   $(document).ready(function(){
      $("#logoutBtn").on("click", function(){
         location.href="cust/logout";
      })
      
      $("#register").on("click", function(){
         location.href="./register";
      })
      
      $("#login_submit").on("click", function(){
    	  
    	  $.ajax({
         url: "/violet/cust/idChk",
         type: "POST",
         dataType : "json",
         data: $("#loginForm").serializeArray(),
         success: function(data){
               if(data == true){
                  $("#loginForm").submit();
               }else{
                  alert("아이디가 일치하지 않습니다.");
                  location.href="/violet/cust/login";
               }
            }
         
         })
    	      	  
         $.ajax({
         url: "/violet/cust/passChk",
         type: "POST",
         dataType : "json",
         data: $("#loginForm").serializeArray(),
         success: function(data){
               if(data == true){
                  $("#loginForm").submit();
               }else{
                  alert("비밀번호가 일치하지 않습니다.");
                  location.href="/violet/cust/login";
               }
            }
         
         })
      })   
   })
</script>
<body>
   <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3><br>
                    </div>
                    <div class="panel-body">
                        <form id='loginForm' method="post" action="/violet/cust/login">
                            <fieldset>
                                <div class="form-group">
                                	<label for="cust_id">id </label><br/>
                                    <input class="form-control" type="text" id="ucust_id" name="cust_id" autofocus>
                                </div>
                                <div class="form-group">
                                	<label for="cust_id">password </label><br/>
                                    <input class="form-control" type="password" id="cust_password" name="cust_password">
                                </div>
		
                            </fieldset>
                        </form>
                        <button type="button" id="login_submit" class="btn btn-lg btn-success btn-block">login</button>
                        <div id="minicon">
	                        <a href="/violet/cust/custfindid" id="findBtn register" class="btn btn-outline-success">아이디 찾기</a>&ensp;
	                        <a href="/violet/cust/custfindpassword" id="findBtn register" class="btn btn-outline-success">비밀번호 찾기</a>&ensp;
	                        <a href="/violet/cust/register" id="findBtn register" class="btn btn-outline-success">회원가입</a>
                       </div>
                        
                    </div>          
                </div>
            </div>
        </div>
    </div>
</body>
</html>