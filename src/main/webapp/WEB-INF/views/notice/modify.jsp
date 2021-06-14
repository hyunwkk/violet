<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<title>notice</title>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시물 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
			<div class="panel-heading">Notice Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				
				<form role="form" action="/violet/notice/modify" method="post">
					
					<div class="form-group">
						<label>번호</label> <input class="form-control" name='notice_bno'
						value='<c:out value="${notice.notice_bno}"/>' readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='notice_title'
						value='<c:out value="${notice.notice_title}"/>'>
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='notice_content'>
						<c:out value="${notice.notice_content}" /></textarea>
					</div>
					
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='notice_writer'
						value='<c:out value="${notice.notice_writer}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>등록날짜</label> <input class="form-control" name='regdate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${notice.regdate}"/>' readonly="readonly">
					</div>
					
					<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info">목록</button>
					
				</form>
			</div>
			<!-- end panel body -->
		</div>
		<!-- end panel body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/violet/notice/remove");				
			}else if(operation === 'list'){
				self.location= "/violet/notice/list";
				return;
			}
			formObj.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>