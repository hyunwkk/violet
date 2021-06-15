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
		<h1 class="page-header">게시물 조회</h1>
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
				
				<div class="form-group">
					<label>번호</label> <input class="form-control" name='notice_bno'
					value='<c:out value="${notice.notice_bno}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='notice_title'
					value='<c:out value="${notice.notice_title}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='notice_content'
					 readonly="readonly"><c:out value="${notice.notice_content}" /></textarea>
				</div>
				
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='notice_writer'
					value='<c:out value="${notice.notice_writer}"/>' readonly="readonly">
				</div>
				<c:if test="${admin != null}">
				<button data-oper='modify' class="btn btn-default"
				onclick="location.href='/violet/notice/modify?notice_bno=<c:out value="${notice.notice_bno}"/>'">
				Modify</button>
				</c:if>
				<button data-oper='list' class="btn btn-info"
				onclick="location.href='/violet/notice/list'">목록</button>
	
			</div>
			<!-- end panel body -->
		</div>
		<!-- end panel body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>