<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
	.uploadResult2{
		width:100%
	}
	
	.uploadResult2 ul{
	  flex-flow: row;
	  justify-content: center;
	  align-items: center;
	}
	.uploadResult2 ul li {
	  list-style: none;
	  padding: 10px;
	  align-content: center;
	  text-align: center;
	}
	.uploadResult2 ul li img{
	  width: 50%;
	}
	
	
</style>

<title>story</title>
<c:if test="${member.cust_id == null && admin.cust_id == null }">
	<script>
		alert("로그인 후 이용가능합니다.");
		location.href="../cust/login";
	</script>
</c:if>

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
		
		<a style="text-decoration:none;position: fixed;left: 7%;font-size:30px;bottom: 30px;display: none;z-index: 999;" id="MOVE_TOP_BTN" href="#">TOP</a>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-body">

					<c:forEach var="story" items="${story}">
					<a style="text-decoration:none;" href='/violet/story/get?story_bno=<c:out value="${story.story_bno}"/>'>
						<div class="form-group">
							Bno
							<input class="gets form-control" data-story_bno="${story.story_bno}" name='story_bno' value='<c:out value="${story.story_bno}"/>' readonly="readonly" />
						</div>
						
						<div class="form-group">
							<label>id</label>
							<textarea class="form-control" rows="1" name='cust_id' readonly="readonly"><c:out value="${story.cust_id}" /></textarea>
						</div>
	
							<div class="col-lg-12">
								<div class="panel panel-default">
									
									<div class="panel-body">
									
										<div class='uploadResult2'>
											<div class='uploadResult'>
												<ul>
												</ul>
											</div>
										</div>
									
									</div>
								</div>
							</div>
	
						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control final" rows="3" name='story_text' readonly="readonly"><c:out value="${story.story_text}" /></textarea>
						</div>
						
						</br></br></br></br></br></br></br>
						<div class="here"></div>
					</a>
			</div>
		</div>
	</div>
</div>



			
			
<script type="text/javascript" src="/violet/resources/js/story.js"></script> 
<script type="text/javascript" src="/violet/resources/js/jquery-ui.min.js"></script>  
      
<script>
	$(document).ready(function(){
		
		(function(){
			
			var story_bno = '<c:out value="${story.story_bno}"/>';
			
			$.getJSON("/violet/story/getAttachList", {story_bno: story_bno}, function(arr){
				console.log(arr);
				
			       var str = "";
			       
			       $(arr).each(function(i, attach){
			       
			         //image type
			         if(attach.fileType){
			           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
			           
			           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			           str += "<img src='/violet/display?fileName="+fileCallPath+"'>";
			           str += "</div>";
			           str +"</li>";
			         }else{
			             
			           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			           str += "<span> "+ attach.fileName+"</span><br/>";
			           str += "<img src='/resources/img/attach.png'></a>";
			           str += "</div>";
			           str +"</li>";
			         }				
			});
			       
			    $(".uploadResult ul").html(str); 
			    $('div').removeClass('uploadResult');
			    
			   
			});
			
		})();
		
	});
</script>


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/violet/story/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#story_bno").remove();
    operForm.attr("action","/violet/story/getAll")
    operForm.submit();
    
  });  
});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(result){
		
			if (result === '' || history.state){
				return;
			}
			if (parseInt(result) > 0){
				$(".modal-body").html("스토리 " + parseInt(result) + " 번이 등록되었습니다."); 
			}
			$("#myModal").modal("show");
		}
		
	});
</script>

<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>	

</c:forEach>	

<%@include file="../includes/footer.jsp"%>