<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					data-dismiss="modal">Close</button>

			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%@include file="../includes/header.jsp" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<title>notice</title>
<head>
</head>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

 <div class="row">
     <div class="col-lg-12">
         <div class="panel panel-default">
             <div class="panel-heading">
                 	공지사항 목록
 
             <c:if test="${admin != null}">
                 <button id='regBtn' type="button" class="btn btn-xs pull-right">공지사항 등록</button>
              </c:if>
             </div>
             
             <!-- /.panel-heading -->
             <div class="panel-body">
                 <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                     <thead>
                         <tr>
                             <th>번호</th>
                             <th>제목</th>
                             <th>작성자</th>
                             <th>작성일</th>
                             <th>조회수</th>
                         </tr>
                     </thead>     
                  <c:forEach items="${list}" var="notice">
                   <tr>
                   	<td><c:out value="${notice.notice_bno}" /></td>
                   	<td><a href='/violet/notice/get?notice_bno=<c:out value="${notice.notice_bno}"/>'>
                   	<c:out value="${notice.notice_title}" /></a></td>
                   	<td><c:out value="${notice.notice_writer}" /></td>
                   	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}" /></td>
                    <td><c:out value="${notice.hit} " /></td>
                   </tr> 
                   </c:forEach>
                  </table>
                  
             </div>
             <!-- /.panel-body -->
         </div>
         <!-- /.panel -->
     </div>
     <!-- /.col-lg-6 -->
 </div>
 <!-- /.row -->
          
<script type="text/javascript">

	$(document).ready(function() {
		
		var result = '<c:out value="${result}"/>';

		checkModal(result);
		
		history.replaceState({},null,null);
		
		// 공지사항 등록 후 알림 처리
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result)
								+ " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		
		// 공지사항 등록 페이지 이동
		$("#regBtn").on("click", function(){
			self.location="/violet/notice/register";
		})
						
	});
</script>	
	
<%@include file="../includes/footer.jsp"%>