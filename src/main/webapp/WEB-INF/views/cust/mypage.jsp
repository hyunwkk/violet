<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/headerbar.jsp" %>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Custom CSS -->
<link href="<c:url value="/resources/dist/css/sb-admin-2.css"/>" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
<title>회원정보수정</title>
<c:if test="${member.cust_id == null && admin.cust_id == null }">
   <script>
      alert("로그인 후 이용가능합니다.");
      location.href="../cust/login";
   </script>
</c:if>
<style>

#container {
	padding: 40px 400px 40px 400px;
	z-index: 1;
}

#updatelogo {
	margin-left: 35%;
}

.uploadResult{
		width:100%
		display:flex;
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
	  width: 30%;
	}
	
	#updatepassword button:hover{
	text-decoration: none;
	background-color: #0B2161;
	}
	
	.btn-secondary {
	background-color: #0B2161;
	opacity:0.8;
	font-size:15px;
	}
	
	
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {

	// 취소
	$(".cencle").on("click", function() {

		location.href = "/violet";

	})

	$("#update_submit").on("click", function() {
		if ($("#cust_password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#cust_password").focus();
			return false;
		}
		if ($("#cust_name").val() == "") {
			alert("성명을 입력해주세요.");
			$("#cust_name").focus();
			return false;
		}
		
		$.ajax({
			url: "/violet/cust/passChk",
			type: "POST",
			dataType : "json",
			data: $("#updateForm").serializeArray(),
			success: function(data){
				if(data==true){
					if(confirm("회원수정을 하시겠습니까?")){
						
						var formObj = $("form");
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
						
						
						
						$("#updateForm").submit();
					}
				}else{
					alert("패스워드가 일치하지 않습니다.");
					return;
				}
			}
		})
		
		/* alert("수정이 완료되었습니다."); */
	});

})
</script>
<body>
	<div>
		<div>
			<button type="button" class="btn btn-secondary" id="updatepassword"  onclick="location.href='/violet/cust/updatepassword' ">비밀번호 변경</button>
			<button type="button" class="btn btn-secondary" id="delete" onclick="location.href='/violet/cust/delete' ">회원탈퇴</button>

		</div>		
	</div>


	<section id="container">
			<h2 id="updatelogo">회원정보수정</h2><br/>
		<form role="form" id="updateForm" action="/violet/cust/custUpdate" method="post">
			<c:if test="${member != null }">
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_id">아이디</label> 
					<input class="form-control" type="text" id="cust_id" name="cust_id" value="${member.cust_id}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_password">패스워드</label> 
					<input class="form-control" type="password" id="cust_password" name="cust_password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_name">성명</label> 
					<input class="form-control" type="text" id="cust_name" name="cust_name" value="${member.cust_name}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_address">주소</label> 
					<input class="form-control" type="text" id="cust_address" name="cust_address" value="${member.cust_address}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_phone">전화번호</label> 
					<input class="form-control" type="text" id="cust_phone" name="cust_phone" value="${member.cust_phone}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_email">이메일</label> 
					<input class="form-control" type="text" id="cust_email" name="cust_email" value="${member.cust_email}" />
				</div>
				
				<div class="row">
				  <div class="col-lg-12">
				    <div class="panel panel-default">
				
				      <div class="panel-heading">사진 첨부 수정</div>
				      <div class="panel-body">
				        <div class="form-group uploadDiv">
				            <input type="file" name='uploadFile' multiple="multiple"/>
				        </div>
				        
				        <div class='uploadResult'> 
				          <ul>
				          
				          </ul>
				        </div>
				      </div>
				  
				    </div>
				  </div>
				</div>				
			</c:if>
			
			<c:if test="${admin != null }">
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_id">아이디</label> 
					<input class="form-control" type="text" id="cust_id" name="cust_id" value="${admin.cust_id}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_password">패스워드</label> 
					<input class="form-control" type="password" id="cust_password" name="cust_password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_name">성명</label> 
					<input class="form-control" type="text" id="cust_name" name="cust_name" value="${admin.cust_name}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_address">주소</label> 
					<input class="form-control" type="text" id="cust_address" name="cust_address" value="${admin.cust_address}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_phone">전화번호</label> 
					<input class="form-control" type="text" id="cust_phone" name="cust_phone" value="${admin.cust_phone}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="cust_email">이메일</label> 
					<input class="form-control" type="text" id="cust_email" name="cust_email" value="${admin.cust_email}" />
				</div>
				
				<div class="row">
				  <div class="col-lg-12">
				    <div class="panel panel-default">
				
				      <div class="panel-heading">프로필 사진 수정</div>
				      <div class="panel-body">
				        <div class="form-group uploadDiv">
				            <input type="file" name='uploadFile' multiple="multiple"/>
				        </div>
				        
				        <div class='uploadResult'> 
				          <ul>
				          
				          </ul>
				        </div>
				      </div>
				  
				    </div>
				  </div>
				</div>
			</c:if>
		</form>
			<div class="form-group has-feedback">
				<button class="btn btn-success" data-oper='modify' type="button" id="update_submit">수정완료</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
	</section>

</body>


<script>
 $(document).ready(function() {
	  (function(){
	    
	    var cust_id = '<c:out value="${member.cust_id}"/>';
	    
	    $.getJSON("/violet/cust/getAttachList", {cust_id: cust_id}, function(arr){
	    
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
	      
	    if(confirm("정말 사진을 삭제 하시겠습니까? ")){
	    	
	   	  /* var targetFile = $(this).data("file")
	   	  var type = $(this).data("type")
	     */
	      var targetLi = $(this).closest("li");
	      targetLi.remove();
	    
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

</html>