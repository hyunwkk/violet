<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

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
    <h1 class="page-header">story Modify</h1>
  </div>
</div>


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">story Modify</div>
      <div class="panel-body">

      <form role="form" action="/violet/story/modify" method="post">
      
 
		<div class="form-group">
		  <label>Bno</label> 
		  <input class="form-control" name='story_bno' 
		     value='<c:out value="${story.story_bno }"/>' readonly="readonly">
		</div>
		
		
		<div class="form-group">
		  <label>Writer</label> 
		  <input class="form-control" name='cust_id'
		    value='<c:out value="${story.cust_id}"/>' readonly="readonly">            
		</div>
		
		
		<div class="form-group">
		  <label>Text area</label>
		  <textarea class="form-control" rows="3" name='story_text' ><c:out value="${story.story_text}"/></textarea>
		</div>
		
		
		<div class="form-group">
		  <label>RegDate</label> 
		  <input class="form-control" name='story_regdate'
		    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${story.story_regdate}" />'  readonly="readonly">            
		</div>
		
		<div class="form-group">
		  <label>Update Date</label> 
		  <input class="form-control" name='story_updatedate'
		    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${story.story_updatedate}" />'  readonly="readonly">            
		</div>
		
		<div class="row">
		  <div class="col-lg-12">
		    <div class="panel panel-default">
		
		      <div class="panel-heading">Files</div>
		      <div class="panel-body">
		        <div class="form-group uploadDiv">
		            <input type="file" name='uploadFile' multiple="multiple">
		        </div>
		        
		        <div class='uploadResult'> 
		          <ul>
		          
		          </ul>
		        </div>
		      </div>
		  
		    </div>
		  </div>
		</div>
		
          	<c:if test="${member.cust_different == 0}">
	           <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
	           <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
	           <button type="submit" data-oper='list' class="btn btn-info">List</button>
	        </c:if>
	        
	        <c:if test="${admin.cust_different == 1}">
	           <button type="submit" data-oper='adminremove' class="btn btn-danger">Remove</button>
	           <button type="submit" data-oper='list' class="btn btn-info">List</button>        
	        </c:if>
		</form>


      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/violet/story/remove");
     
	    }else if(operation === 'adminremove'){
          if(confirm("삭제 하시겠습니까?")){
              alert("삭제되었습니다.");
             formObj.attr("action", "/violet/story/adminremove");
           } else{
              return;
           }
	           
           }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/violet/story/getAll").attr("method","get");
	      
	    }else if(operation === 'modify'){
	    	
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
	    	
	    }
	    
	    formObj.submit();
	  });

});
</script>

<script>

$(document).ready(function() {
  (function(){
    
    var story_bno = '<c:out value="${story.story_bno}"/>';
    
    $.getJSON("/violet/story/getAttachList", {story_bno: story_bno}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/violet/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/violet/resources/img/attach.png'></a>";
            str += "</div>";
            str +"</li>";
          }
       });

      
      $(".uploadResult ul").html(str);
      
    });
  })();
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    	
   	  var targetFile = $(this).data("file")
   	  var type = $(this).data("type")
    
      var targetLi = $(this).closest("li");
      
      $.ajax({
    	  url: '/violet/deleteFile',
    	  data: {fileName: targetFile, type:type},
    	  dataType:'text',
    	  type: 'POST',
    	  	success: function(result){
    	  		alert(result);
    	  		targetLi.remove();
    	  	}
      })
    }
  });  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/violet/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result);  

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/violet/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/violet/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }
  
});

</script>


<%@include file="../includes/footer.jsp"%>