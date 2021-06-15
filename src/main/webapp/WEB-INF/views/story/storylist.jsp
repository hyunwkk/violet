<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
    
<%@include file="../includes/header.jsp" %>
<title>story</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                <br/><br/><br/><br/><br/>
                    <h1 class="page-header">Story</h1>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Story List
                        </div>
                        <div class="panel-body">
                            <table class="list=table table table-striped table-bordered table-hover">
                                <thead>
                                    <tr class="scrollLocation">
                                        <th>번호</th>
                                        <th>작성자</th>
                                        <th>내용</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="list" varStatus="status">
                                <tr class="listToChange">
	                                <td class="scrolling" data-story_bno="${list.story_bno}">${list.story_bno}</td>
	                                <td>${list.cust_id }</td>
	                                <td><a href='/violet/story/get?story_bno=<c:out value="${list.story_bno }"/>'>
	                                ${list.story_text }</a></td>
	                                <td class="final"><fmt:formatDate pattern="yyyy. M. dd"
	                                value="${list.story_regdate}" />
	                               <!--  <button style="float:right;" type="button" data-oper='remove' class="btn btn-danger">삭제</button>
 -->	                                </td>

                                </tr>
                                </c:forEach>
                           </table>
                           
                        </div>
                    </div>
                </div>
            </div>
        
<%@include file="../includes/footer.jsp"%>