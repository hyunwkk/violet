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
                    	<div>
						<button class="btn" onclick="location.href='/violet/story/getAll'">All Story</button>
						<button class="btn" onclick="location.href='/violet/story/getmystory'">My Story</button>
						<button type="button" class="btn pull-right" onclick="location.href='/violet/story/register' ">
						<img class="register-image" width="50px" height="50px" src="/violet/resources/images/pen.png" />
						</button>
						</div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            My Story List
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
                                
                                <c:forEach items="${list}" var="story" varStatus="status">
                                <c:if test="${member.cust_id == story.cust_id }">
                                <tr class="listToChange">
	                                <td class="scrolling" data-story_bno="${story.story_bno}">${story.story_bno}</td>
	                                <td>${story.cust_id }</td>
	                                <td><a href='/violet/story/get?story_bno=<c:out value="${story.story_bno }"/>'>
	                                ${story.story_text }</a></td>
	                                <td class="final"><fmt:formatDate pattern="yyyy. M. dd"
	                                value="${story.story_regdate}" /></td>
                                </tr>
                                </c:if>
                                </c:forEach>
                           </table>
                           
                        </div>
                    </div>
                </div>
            </div>
  

<%@include file="../includes/footer.jsp"%>