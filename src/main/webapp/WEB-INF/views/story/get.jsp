<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            
            <div class="modal-body">
              <div class="form-group">
	              <div class="form-group">
	                <input class="form-control" name='cust_id' value="" readonly="readonly" />
	              </div>
	                <label>Reply</label>
	                <input class="form-control" name='reply' value='New Reply'>
              </div>      

              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='reply_regdate' value='2018-01-01 13:13'>
              </div>
      
            </div>
            
			<div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		    </div> 
		    
	      </div>
        </div>
      </div>
<!-- Modal -->

<%@include file="../includes/header.jsp"%>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
	.uploadResult{
		width:100%
	}
	
	.uploadResult ul{
	  flex-flow: row;
	  justify-content: center;
	  align-items: center;
	}
	.uploadResult ul li {
	  list-style: none;
	  padding: 10px;
	  align-content: center;
	  text-align: center;
	}
	.uploadResult ul li img{
	  width: 50%;
	}
	
</style>
<title>story</title>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                </div>
                <!-- /.col-lg-12 -->
            </div>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Story</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-body">
				
					<div class="form-group" >
						Bno<input data-story_bno="${story.story_bno}" class="form-control" name='story_bno' value='<c:out value="${story.story_bno}"/>' readonly="readonly" />
					</div>
					
					<div class="form-group">
						<label><c:out value="${story.cust_id }"/></label>
					</div>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								
								<div class="panel-body">
									<div class='uploadResult'>
										<ul>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					

					<div class="form-group">
						<textarea style="background:#fff" class="form-control" rows="3" name='story_text' readonly="readonly"><c:out value="${story.story_text}" /></textarea>
					</div>

					<button data-oper='list'
							class="btn btn-info">List
					</button>
					
					<c:if test="${member.cust_id == story.cust_id || admin.cust_different ==1}">
					<button data-oper='modify'
							class="btn btn-default">
							Modify
					</button>
					</c:if>
					
					<form id='operForm' action="/story/modify" method="get">
					  <input type='hidden' id='story_bno' name='story_bno' value='<c:out value="${story.story_bno}"/>' />
					</form>
					
			</div>
		</div>
	</div>
</div>


	<div class='row'>
	
	  <div class="col-lg-12">
	
	    <div class="panel panel-default">
	      
	      <div class="panel-heading">
	        <i class="fa fa-comments fa-fw"></i> 댓글
	        <c:if test="${member.cust_different == 0 || admin.cust_different == 0}">
	        	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 쓰기</button>
	        </c:if>
	      </div>      
	      
	      <div class="panel-body">        
	        <ul class="chat">
	        </ul>
	      </div>
	
		<div class="panel-footer"></div>
	
			</div>
	  </div>
	</div>





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
			});
			
		})();
		
	});
</script>

<script type="text/javascript" src="/violet/resources/js/reply.js"></script>


<script>
$(document).ready(function(){
	
	  var bnoValue = '<c:out value="${story.story_bno}"/>';
	  var replyUL = $(".chat");
	  var custId = '<c:out value="${member.cust_id}"/>';
	  
	  
	  $('input[name=cust_id]').attr('value', custId);
	  
	    showList(1);
	    
	    function showList(page){
	    	
	    	console.log("show list " + page);
	        
	        replyService.getList({story_bno:bnoValue,page: page|| 1 }, function(list) {
           
	         var str="";
	         
	         if(list == null || list.length == 0){
	           replyUL.html("");
	           
	           return;
	         }
	         for (var i = 0, len = list.length || 0; i < len; i++) {
	           str +="<li class='left clearfix' data-reply_rno='"+list[i].reply_rno+"'>";
	           str +="  <div><div><strong class='primary-font'>"
	        	   +list[i].cust_id+"</strong><br/>";
	           str +="    <small class='pull-right text-muted'>"
	               + replyService.displayTime(list[i].reply_regdate)+ "&nbsp&nbsp</small></div>";
	          
	           str +="    <p>"+list[i].reply+"</p></div></li>";
	           
	         }
	         
	         replyUL.html(str);
	     
	       });
	         
	     }
	     
	     
	     var modal = $(".modal");
	     var modalInputReply = modal.find("input[name='reply']");
	     var modalInputReplyer = modal.find("input[name='cust_id']");
	     var modalInputReplyDate = modal.find("input[name='reply_regdate']");
	     
	     var modalModBtn = $("#modalModBtn");
	     var modalRemoveBtn = $("#modalRemoveBtn");
	     var modalRegisterBtn = $("#modalRegisterBtn");
	     
	     var cust_id = null;
	     cust_id = '<c:out value="${member.cust_id}" />';
	     var replyer = modalInputReplyer.val();
	     
	     $("#modalCloseBtn").on("click", function(e){
	     	
	     	modal.modal('hide');
	     });
	     
	     $("#addReplyBtn").on("click", function(e){
	       
	       modal.find("input").val("");
	       modal.find("input[name='cust_id']").val(cust_id);
	       modalInputReplyDate.closest("div").hide();
	       modal.find("button[id !='modalCloseBtn']").hide();
	       
	       modalRegisterBtn.show();
	       
	       $(".modal").modal("show");
	       
	     });	     
	     
	     
	     modalRegisterBtn.on("click",function(e){
	         
	         var reply = {
	               reply: modalInputReply.val(),
	               cust_id:modalInputReplyer.val(),
	               story_bno:bnoValue
	             };
	         replyService.add(reply, function(result){
	           
	           alert(result);
	           
	           modal.find("input").val("");
	           modal.modal("hide");
	           
	           showList(1);
	           
	         });
	         
	       });	     
	     
	     //댓글 조회 클릭 이벤트 처리 
	     $(".chat").on("click", "li", function(e){
		  
	       var rno = $(this).data("reply_rno");
	       
	       replyService.get(rno, function(reply){
	       
	         modalInputReply.val(reply.reply);
	         modalInputReplyer.val(reply.cust_id);
	         modalInputReplyDate.val(replyService.displayTime( reply.reply_regdate))
	         .attr("readonly","readonly");
	         modal.data("reply_rno", reply.reply_rno);
	         
	         modal.find("button[id !='modalCloseBtn']").hide();
	         
        	 $("#modalModBtn").show();
         	 $("#modalRemoveBtn").show();
	         
	         $(".modal").modal("show");
	             
	       });
	     });  
	     
		     modalModBtn.on("click", function(e){
		    	  
		      	  var reply={reply_rno:modal.data("reply_rno"), reply: modalInputReply.val()};
		      	var replyer = modalInputReplyer.val();
		      	  
		      	  if(cust_id != replyer){
		      		  alert("자신이 작성한 댓글만 수정 가능합니다.");
		      		  modal.modal("hide");
		      		  return;
		      	  } 
		      	  
		      	  replyService.update(reply, function(result){
		      	        
		      	    alert(result);
		      	    modal.modal("hide");
		      	    showList(1);
		      	    
		      	  });
		      	  
		      	});
	     
	    	modalRemoveBtn.on("click", function (e){
	    	   	  
	    	   	  var rno = modal.data("reply_rno");
	    	   	  var replyer = modalInputReplyer.val();
	    	   	  
		      	  if(cust_id != replyer){
		      		  alert("자신이 작성한 댓글만 삭제 가능합니다.");
		      		  modal.modal("hide");
		      		  return;
		      	  } 
	    	   	  
	    	   	  replyService.remove(rno,function(result){
	    	   	        
	    	   	      alert(result);
	    	   	      modal.modal("hide");
	    	   	      showList(1);
	    	   	      
	    	   	  });
	    	   	  
	    	   	});
	     
	console.log(replyService);
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

<%@include file="../includes/footer.jsp"%>