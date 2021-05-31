<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Notice Register</h1>
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
				<form role="form" action="/violet/notice/register" method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='notice_title'>
					</div>
					
					<div class="form-group">
						<label>Test area</label>
						<textarea class="form-control" rows="3" name='notice_content' id ="textarea1"></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='notice_writer'>
					</div>
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
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