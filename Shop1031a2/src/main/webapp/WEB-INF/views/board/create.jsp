<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="/resources/js/upload.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>글쓰기</title>

<style type="text/css">
.fileDrop {
	height: 130px;
	border: 1px solid #cbcbcb ;
	background: #ffffff;
	margin: auto;
	border-radius:5px;
	
	
}
.uploadedList {
	list-style-type: none;
}
</style>
</head>
<body>
	<div class="container"
		style="background-color: #ffffff; margin-top: 50px; border-radius: 5px;">
		<!-- 폼 시작 -->
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="well">
					<form id = "myForm" class="form-horizontal" action="create" method="post">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-3 control-label"><h2>글쓰기</h2></label>
							</div>
							<div class="form-group">
								<label for="title" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" name="title">
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-lg-2 control-label">쓰니</label>
								<div class="col-lg-10 ">
								<div class="col-lg-10 " value="${login.mid}">${login.mid}	</div>
								<input type="text" class="form-control" name="writer" value="${login.mid}" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="content" rows="10"
										id="textArea"></textarea>
								</div>
							</div>
							<hr style="border-color: #cbcbcb;">
							<div class="form-group">
								<label for="fileDrop" class="col-lg-2 control-label">파일 추가 <br><small>드래그&드롭하세요</small></label>
								<div class="col-lg-10">
								
									<div class="fileDrop"></div><br>
									<ul class="uploadedList clearfix"></ul>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-primary">저장</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!--
	imgsrc : 이미지파일여부에따라 썸넬 혹은 아이콘
	getLink : 업로드한 파일명
	fileName : 오리지널 파일명
	fullName : uuid+오리지널 파일명
	
			{{#each.}}{{/each}}
	 -->
	 <!-- ▼▼▼업로드파일미리보기 ▼▼▼  -->
	<script id="source" type="text/x-handlebars-template">
	<li class="col-xs-3">
		<span><img src="{{imgsrc}}"></span>
		<div>			
			<a href="{{getLink}}">{{fileName}}</a>
			<a class="btn delbtn"  href="{{fullName}}"><span  class="deleteFile glyphicon glyphicon-remove"></span></a>
		</div>
	</li>
	</script>
	
	 <!-- ▼▼▼스크립트으▼▼▼  -->
	<script type="text/javascript">
		$(document).ready(function() {

			var source = $("#source").html();
			var template = Handlebars.compile(source);
			
			//글 저장버튼눌렸을때 이미지도 같이 저장할수있게 하려고
			$("button[type='submit']").click(function(event) {
				//$("form").submit();
				event.preventDefault();

				var $form = $("#myForm");
				var str = "";
				
				 $(".delbtn").each(function(index) {
					str+="<input type ='hidden' name='files["+index+"]'  value = '" + $(this).attr("href") + "'>";
				});
				 $form.append(str);
				 $form.get(0).submit();
				 
			});

			
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			
			$(".fileDrop").on("drop", function(event) {

				event.preventDefault();

				var files = event.originalEvent.dataTransfer.files;

				var file = files[0];
				var formData = new FormData();//폼태그가 없으니까 스크립트에서 폼객체만든거다.
				formData.append("file", file);//폼에다 데이터를 넣고

				//▼▼▼ ajax ▼▼▼//폼데이터에 들어있는 업로드 파일에대한 정보를 에이작스로 보내는중
				$.ajax({
					type : 'post',
					url : "/uploadAjax",
					dataType : 'text',
					data : formData,
					processData : false,
					contentType : false,
					success : function(result) {
						alert("성공 > " + result);
						var data = getFileInfo(result);
						var ht = template(data);
						$(".uploadedList").append(ht);						
					}
				});
			});
			
			//▼▼▼ ajax ▼▼▼//업로드된파일 지우기
			$(".uploadedList").on("click","li div .delbtn",function(event){

				event.preventDefault();
				
				 var delbtn = $(this);
				 var delLi = $(this).parent("div").parent("li");
				 console.log("콘솔delbtn > "+delbtn);
				 console.log("콘솔delLi > "+delLi);
				 
				 $.ajax({
					 type:"post",
					 url : "/deleteFile",
					 dataType : "text",
					 data : {
						 fileName :  delbtn.attr("href")
					 },
					 success: function(result){
						 console.log("콘솔result > "+result);
						 if(result =="DELETE_SUCCESS"){
							 alert("삭제성공");
							 delLi.remove();
						 }
					 }
					 
				 });
					
			});
		});
	</script>
</body>
</html>