<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <link rel="stylesheet" href="/resources/style/main.css" />
  <style type="text/css">
  .dropArea {
	width: 66%;
	height: 100px;
	border: 1px solid #ededed;
	background: #efefef;
	margin: 10px auto 0 auto;
	border-radius: 8px;
}

.uploadFiles li {
	list-style-type: none;
}
</style>
  </head>
<body>
<div class="container">
	<div class="row containerBig">
		<div class="col-sm-offset-1 col-sm-10 col-xs-12">
	
		<jsp:include page="../main/header.jsp"/>
		
		<div class="create_box">
		<form id="PcreateForm" class="form-horizontal" action="/product/create" method="post">
			<div class="form-group">
			  <label for="sel1" class="control-label col-xs-2">대분류 :</label>
			  <div class="col-xs-2">
				  <select class="form-control" id="category1" name="category1">
				    <c:forEach items="${category1List}" var="category1">
				    	<option value="${category1}" >${category1}</option>
				    </c:forEach>
				  </select>
			  </div>
			</div>
			
			<div class="form-group">
			  <label for="sel1" class="control-label col-xs-2 pull-left">소분류 :</label>
			  <div class="col-xs-3">
				  <select class="form-control" id="category2"  name="category2">
				    <c:forEach items="${category2List}" var="category2">
				    	<option value="${category2}">${category2}</option>
				    </c:forEach>
				  </select>
			  </div>
			</div>

			<div class="form-group">
				<label for="productName" class="control-label col-xs-2">제품명 :</label>
				<div class="col-xs-8">
				<input id="productName" name="productName" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="productPrice" class="control-label col-xs-2">가격 :</label>
				<div class="col-xs-2">
				<input id="productPrice" name="productPrice" class="form-control">
				</div>

				<label for="rest" class="control-label col-xs-2">재고수량 :</label>
				<div class="col-xs-2">
				<input id="rest" name="rest" class="form-control">
				</div>
			</div>
			<div class="form-group">
			  <label for="productContent" class="control-label col-xs-2">상품설명 :</label>
			  <div class="col-xs-8">
			  <textarea class="form-control" rows="10" id="comment" name="productContent"></textarea>
			  </div>
			</div>
	
		</form>
		
		<div class="form-group">
			<label class="control-label col-xs-5 col-xs-offset-2">상품이미지 첨부(Drop)</label></br>
			<div class="dropArea"></div>
		</div>
		
		<div class="uploadfilesShown">
			<ul class="uploadFiles clearfix">
			</ul>
		</div>
		
		<div class="form-group col-xs-5 col-xs-offset-2">
			<button class="btn btn-submit btn-primary" type="submit">상품 등록</button>
			<button class="btn btn-reset btn-default" type="reset">초기화</button>
		</div>
		</div> <!-- create_box -->
	</div> 
	
</div> <!-- row
  <script src="/resources/js/product.js" type="text/javascript"></script> -->

</div> <!-- container -->
	<script id="uploadListSource" type="text/x-handlebars-template">
	<li class="imgPreview" style="margin-left:60px; width:200px; height:150px; position:relative;">
			<span style="padding-left:50px;"><img src="{{imgsrc}}"></span>
			
				<div style="text-align:center; margin-left:20px;>
				<a href="{{getLink}}" style="border:1px solid pink;">{{fileName}}</a>
				<a class="btn delbtn" href="{{productImgPath}}"><span class="glyphicon glyphicon-remove"></span></a>
				</div>

	</li>
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		var source = $("#uploadListSource").html();
		var template = Handlebars.compile(source);
		
		
		$(".dropArea").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$(".dropArea").on("drop", function(event) {
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type: 'post',
					url: "/uploadAjax",
					dataType: 'text',
					data: formData,
					processData: false,
					contentType:false,
					success: function(result) {
						alert(result);
						
						var data = getFileInfo(result);
						var ht = template(data);
						$(".uploadFiles").append(ht);
					}
				});
		
		});
		
		$(".uploadFiles").on("click", "li div .delbtn", function(event) {
			event.preventDefault();
			var delBtn = $(this);
			var delLi = $(this).parent("div").parent("li");
			
			$.ajax({
				type:"post",
				url:"/deleteFile",
				dataType:"text",
				data: {
					fileName:delBtn.attr("href")
				},
				success:function(result){
					if(result == "DELETE_SUCCESS"){
						alert("삭제 성공");
						delLi.remove();
					}	
				}
			});
		});


		
		$("button[type = 'submit']").click(function (event) {
			event.preventDefault();
			var $form = $('#PcreateForm');
			var str = "";
			var number_pattern = /(^[0-9_]{1,20}$)/;
			//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
			console.log("productName"+$("#productName").val())
			console.log("productPrice"+$("#productPrice").val())
			console.log("rest"+$("#rest").val())
		        
			// 버튼 눌렀을때 
			console.log("버튼 눌렀을때")
			if ($("#productName").val() == "") {//공란일때
				alert("상품명을 입력해주세요 ");
				$("#productName").focus();
				return false ;
			} else if (!number_pattern.test($("#productPrice").val())) {//정규식 확인
				alert("가격은 숫자로만 입력해주세요");
				$("#productPrice").focus();
				return false ;
			} else if (!number_pattern.test($("#rest").val())) {//정규식 확인
				alert("가격은 숫자로만 입력해주세요");
				$("#rest").focus();
				return false ;
			} else {//다 괜찮으면 뿅
				$(".delbtn").each(function() { // each:반복문

					var oimg=$(this).attr("href");
					alert("$(this).attr(href)"+$(this).attr("href"));
					var prefix = oimg.substring(0, 12);
					var suffix = oimg.substring(14);

				    alert("prefix / "+prefix)
			        alert("suffix / "+suffix)
					str+="<input type='hidden' name='productImgPath' value='" + prefix+suffix+ "'>";
				});
				$form.append(str);
				$form.get(0).submit();
				return true ;
			}


			
			
		});
		
		
		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
		
		function getFileInfo(productImgPath) {
			var fileName, imgsrc, getLink;
			
			fileName = productImgPath.substring(productImgPath.lastIndexOf("_") + 1);
			
			if(checkImageType(productImgPath)){
				imgsrc = "/displayFile?fileName=" + productImgPath;
				
				var prefix = productImgPath.substring(0, 12);
				var suffix = productImgPath.substring(14);
				getLink = "/displayFile?fileName=" + (prefix + suffix);

			} else {
				imgsrc = "/resources/icon.png";
				getLink = "/displayFile?fileName=" + productImgPath;
			}
			return {productImgPath: productImgPath, fileName: fileName,
				imgsrc: imgsrc, getLink: getLink}
		}
		


		$("#category1").on("change", function() {
			var category1=$(this).val();
			
			$.getJSON("/product/getCategory2/"+ category1, function (result) {
				var str="";
				$(result).each(function() {
					//<option>${category2}</option>
					str+="<option>"+this+"</option>";
				});
				
				$("#category2").html(str);
				
			})
			
		});

		
	});
	
	</script>
</body>


</html>