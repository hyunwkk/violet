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

#container {
   width:100%;
   margin-left:45%;
   z-index: 1;
}

#register {
   margin-left: 33px;
}

#findBtn {
   font-size: 14px;
   margin-left: 10px;
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
   
   <div id="container">
   <form id='loginForm' method="post" action="/violet/cust/login">
      <c:if test="${member == null}">
         <div>
            <label for="cust_id">아이디 </label><br/>
            <input type="text" id="ucust_id" name="cust_id">
         </div><br/>
         <div>
            <label for="cust_password">비밀번호</label><br/>
            <input type="password" id="cust_password" name="cust_password">
         </div><br/>
         <div>
            
            <!-- test f -->
            <c:if test="${msg == false}">
               <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
            </c:if>
            <button type="button" id="register" onclick="location.href='./register'">회원가입</button>
         </div>
      </c:if><br/>
      <a href="/violet/cust/custfind" id="findBtn">아이디/비밀번호 찾기</a>
   </form>
   <button type="button" id="login_submit">로그인</button>
   </div>
</body>
</html>