// 무한 스크롤
var lastScrollTop = 0;
var easeEffect = 'easeInQuint';

$(window).scroll(function(){

	var currentScrollTop = $(window).scrollTop();
	
	if(currentScrollTop - lastScrollTop > 0){
		
		console.log("down-scroll");
		
		if($(window).scrollTop() >= ($(document).height()-$(window).height())){
			var lastbno = $(".gets:last").attr("data-story_bno");
			$.ajax({
				type : 'POST',
				url : 'getinfiniteScrollDown',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					story_bno : lastbno
				}),
				
				success : function(data){
					var str = "";
					
					if(data != ""){
						$(data).each(
								function(){
									console.log(this);
								  str	+=	"<a style='text-decoration:none;' href='/violet/story/get?story_bno=" + this.story_bno + "'>" 
										+   "<div class='form-group'>"
										+	"Bno" + "<input class='gets form-control'"+ " data-story_bno='" + this.story_bno + "' name='story_bno'" + " value='" + this.story_bno + "'" + " readonly='readonly' />"
										+	"</div>"
										+	"<div class='form-group'>"
										+	"<label>" + "id" + "</label>"
										+	"<textarea class='form-control'" + " rows='1'" + " name='cust_id'" + " readonly='readonly'>" + this.cust_id + "</textarea>"
										+	"</div>"
										+	"<div class='row'>"
										+		"<div class='col-lg-12'>"
										+			"<div class='panel panel-default'>"
										+				"<div class='panel-body'>"
										+					"<div class='uploadResult2'>"
										+					"<div class='uploadResult'>"
										+						"<ul>"
										+						"</ul>"
										+					"</div>"
										+					"</div>"
										+				"</div>"
										+			"</div>"
										+		"</div>"
										+	"</div>"
										+	"<div class='form-froup'>"
										+		"<label>" + "Text area" + "</label>"
										+		"<textarea class='form-control final'" + " rows='3'" + " name='story_text'" + " readonly='readonly'>" + this.story_text + "</textarea>"
										+	"</div>"
										+	"</br></br></br></br></br></br></br>"
										+	"</a>"
						$.getJSON("/violet/story/getAttachList", {story_bno: this.story_bno}, function(arr){
							console.log(arr);
							
						       var str = "";
						       var bno = this.story_bno
						       $(arr).each(function(i, attach){
							         //image type
							         if(attach.fileType){
							           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
							           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div class='"+attach.fileName+"'>";
							           str += "<img src='/violet/display?fileName="+fileCallPath+"'>";
							           str += "</div>";
							           str +"</li>";
							         }else{
							           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div class='"+attach.fileName+"'>";
							           str += "<span> "+ attach.fileName+"</span><br/>";
							           str += "<img src='/resources/img/attach.png'></a>";
							           str += "</div>";
							           str +"</li>";
							         }				
							});
							  
							    $(".uploadResult ul").html(str);
							   $('div').removeClass('uploadResult');
							    
							});										
										
								});						
						
							$(".here").before(str);
					}
					else{
						alert("더 이상의 스토리가 없습니다!");
					}

					}
				}); 
				
			}
		}
	
});

