<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

<title>Notice Register</title>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header"></h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
			<div class="panel-heading">공지사항을 등록하세요.</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/violet/notice/register" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='notice_title'>
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='notice_content' id ="textarea1"></textarea>
					</div>
					
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='notice_writer'>
					</div>
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">재입력</button>
				</form>
			</div>
			<!-- end panel body -->
		</div>
		<!-- end panel body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/footer.jsp"%>