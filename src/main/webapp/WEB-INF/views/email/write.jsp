<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@include file="../includes/headerbar.jsp" %>  
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>email</title>
<style>
	.writeform {
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file="admin_menu.jsp" %>

	<div class="container">
	  <h2>이메일 보내기</h2></br>
	  <p>상대방에게 원하는 메일을 보내보세요!</p>
	  <form method="post" action="${rootPath}/email/send.do">
	    <div class="form-group">
	      <label>발신자 이름 :</label>
	      <input class="form-control" name="senderName">
	    </div>
	    <div class="form-group">
	      <label>발신자 이메일 :</label>
	      <input class="form-control" name="senderMail">
	    </div>
	    <div class="form-group">
	      <label>수신자 이메일 :</label>
	      <input class="form-control" name="receiveMail">
	    </div>
	    <div class="form-group">
	      <label>제목 :</label>
	      <input class="form-control" name="subject">
	    </div>
	    <div class="form-group">
	    	<label>내용 :</label>
	      	<textarea class="form-control" rows="5" name="message" required placeholder="이름, 이메일, 연락처, 하고싶은 말을 순서대로 기입해 주세요."></textarea>
	    </div>
	    
	    <input type="submit" value="전송">
	  </form>
	  <span style="color:red;">${message}</span>
	</div>




	<%-- <h2>이메일 보내기</h2><br/>
	<form method="post" action="${rootPath}/email/send.do"> 
	 
		발신자 이름 : <input name="senderName"><br>
		발신자 이메일 : <input name="senderMail"><br>
		수신자 이메일 : <input name="receiveMail"><br>
		제목 : <input name="subject"><br>
		내용 : <textarea rows="5" cols="80" name="message"  placeholder="이름, 이메일, 연락처, 하고싶은 말을 순서대로 기입해 주세요."></textarea>
		<br>
		<input type="submit" value="전송">
	</form> --%>



 
</body>
</html>
