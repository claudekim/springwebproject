<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <title>TITLE</title>
  <style type="text/css">
  .fileDrop{
  width: 100%;
  height: 200px;
  border : 1px dotted red;
  }
  .uploadedList{
  }
  small {
	margin-left: 3px;
	color: gray;
	cursor: pointer;
}
  </style>

</head>
<body>


	<div class="fileDrop"></div>
	<div class="uploadedList"></div>
	<script type="text/javascript">
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		})
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			
			//for(var i; i<files.lenth();i++){
				
			//}
			var file = files[0];
			

			var formData = new FormData();//폼태그가 없으니까 스크립트에서 폼객체만든거다.
			formData.append("file", file);//폼에다 데이터를 넣고

			//▼▼▼ ajax ▼▼▼//폼데이터에 들어있는 업로드 파일에대한 정보를 에이작스로 보내는중
			$.ajax({
				type : 'post',
				url : '/uploadAjax',
				dataType : 'text',//성공하고 나서 받는정보
				data : formData,//업로드파일 가지고있는 폼데이터 올리기
				processData:false,//우알엘창에 데이터 올려줄거냐
				contentType:false,//폼테그에서 잉크타입 디폴트값이 있는ㄱ데 그거 사용안할꺼라는게 폴ㄷ스
				success: function(data){
					alert("성공 > " + data);
					var str = "";
					if(checkImageType(data)){
					str = "<div><a href='displayFile?fileName="+getImageLink(data)+"'><br><img src='displayFile?fileName="+data+"'/>"
							+getOriginalName(data)+"</a> <small data-src='"+data+"'>ⓧ</small></div>";
					}else{
						str = "<div><a href= 'displayFile?fileName=" +data+ "'><img src= '/resources/icom.png' /> " 
						+ getOriginalName(data) + "</a> <small data-src='"+data+"'>ⓧ</small></div> ";
					}
					$(".uploadedList").append(str);
					
				},
				error : function(data){
					alert("실패...왜?");
				} 
			});

		});
		
		$(".uploadedList").on("click","small",function(event){
		 var that = $(this);
		 
		 $.ajax({
			 type:"post",
			 url : "deleteFile",
			 dataType : "text",
			 data : {
				 fileName : that.attr("data-src")
			 },
			 success: function(result){
				 if(result =="DELETE_SUCCESS"){
					 alert("삭제성공");
					 that.parent("div").remove();
				 }
			 }
			 
		 });
			
		});
		 
		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);//이미지일떄 추루ㅜ추루챠오추르
			
		}
		function getOriginalName(fileName) {
			var originalName  = fileName.substring(fileName.lastIndexOf("_") + 1);
			return originalName;
			
		}
		function getImageLink(fileName) {//이미지일떄만쓰라
			if(!checkImageType(fileName)){
				retrun;
			}
			var prefix = fileName.substring(0,12);
			var suffix  = fileName.substring(14);
			return prefix+suffix;
		}
		
	</script>

</body>
</html>