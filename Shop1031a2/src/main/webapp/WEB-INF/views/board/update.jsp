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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script	src="/resources/js/upload.js" type="text/javascript"></script>
<title>글쓰기</title>
<style type="text/css">
.fileDrop {
	height: 130px;
	border: 1px solid #cbcbcb;
	background: #ffffff;
	margin: auto;
	border-radius: 5px;
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
						<form id = "myForm"  class="form-horizontal" action="update" method="post">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="perPage" value="${perPage}">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-4 control-label"><h2>수정하기</h2></label>
							</div>
							<div class="form-group">
								<label for="bno" class="col-lg-2 control-label">글번호</label>
								<div class="col-lg-10">
									<input type="number" readonly="readonly" class="form-control" name="bno" value="${vo.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" name="title" value="${vo.title }">
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-lg-2 control-label">쓰니</label>
								<div class="col-lg-10">
									<input type="text" readonly="readonly" class="form-control" name="writer" value="${vo.writer}">
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="content" rows="10"
										id="textArea">${vo.content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2  control-label ">업로드 파일 드랍하세요</label>
								<div class="col-lg-10">
								<div class="fileDrop  form-control"></div></div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2">첨부파일 리스트</label>
								<div class="col-lg-10">
									<ul class="uploadedList clearFix " ></ul>
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
<!-- ★★★★★★★  핸들러  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->	
	<script id="source"  type="text/x-handlebas-template]">
			<li class="col-xs-4">
				<span><img alt="" src="{{imgsrc}}" style = "padding-bottom: 5px"></span>
					<div>
						<a href="{{getLink}}">{{fileName}}</a>
						<a href="{{fullName}}" class="btn btn-warning btn-xs delbtn">
							<span  class="deleteFile glyphicon glyphicon-remove"></span>
						</a>
					</div>
				</li>
	</script>
<!-- ★★★★★★★  스크립트  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->
	<script type="text/javascript">
		var bno = ${vo.bno};
		var source = $("#source").html();
		var template = Handlebars.compile(source);
		
		$(document).ready(function() {
			getAllAttach(bno);
			
			/*$("button[type='submit']").click(function() {
				//당긴는게  
				//나가는게핸들러어.??
				$("form").submit();
			});*/
			
			//글 저장버튼눌렸을때 이미지도 같이 저장할수있게 하려고
			$("button[type='submit']").click(function(event) {
				event.preventDefault();

				var $form = $("#myForm");
				var str = "";
				
				 $(".delbtn").each(function(index) {
					str+="<input type ='hidden' name='files["+index+"]'  value = '" + $(this).attr("href") + "'>";
				});
				 $form.append(str);
				 $form.attr("action","update");
				 $form.attr("method","post");
				 $form.get(0).submit();
			});
		});
		
		function getAllAttach(bno) {

			//▼▼▼ 가져왕 ▼▼▼
			$.getJSON("/board/getAttach/"+bno , function(result) {
				
				$(result).each(function() {
					var data = getFileInfo(this);		
					var ht = template(data);
					$(".uploadedList").append(ht);	
				})
			});
			
			//▼▼▼ 이미지이벤트 없애기 ▼▼▼
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			//▼▼▼ 파일 추가 ▼▼▼
			$(".fileDrop").on("drop", function(event) {

				event.preventDefault();

				var files = event.originalEvent.dataTransfer.files;
				var file=files[0];
				/*
				var file = "";
				for(var i=0; i<files.length() ; i++){
					file=files[i]
				}*/
				
				var formData = new FormData();
				formData.append("file", file);
				
				//▼▼▼ ajax ▼▼▼
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
			});//추가끝
			
			//▼▼▼ ajax ▼▼▼업로드된파일 지우기
			$(".uploadedList").on("click","li div .delbtn",function(event){

				event.preventDefault();
				
				 var delbtn = $(this);
				 var delLi = $(this).parent("div").parent("li");
				 
				 var delOk = confirm("수정버튼과 상관없이 바로 삭제됨  삭제할까요?");
				 if(delOk){
					 $.ajax({
						 type:"post",
						 url : "/board/deleteFile",
						 dataType : "text",
						 data : {
							 fileName :  delbtn.attr("href"),
							 bno : bno
						 },
						 success: function(result){
							 console.log("콘솔result > "+result);
							 if(result =="DELETE_SUCCESS"){
								 alert("삭제성공");
								 delLi.remove();
							 }
						 }
					 }); 
				 }
			});//파일지우기 끝
			
		 }		
	</script>
</body>
</html>