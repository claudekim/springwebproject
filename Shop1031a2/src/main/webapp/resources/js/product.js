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
		var oimg=$(this).attr("href");

		alert("$(this).attr(href)"+$(this).attr("href"));
		//var prefix = oimg.substring(0, 12);
		//var suffix = oimg.substring(14);
		//var number_pattern = /(^[0-9_]{1,20}$)/;
		//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
		console.log("스크립트시작")
		console.log("productName"+$("#productName").val())
		console.log("productPrice"+$("#productPrice").val())
		console.log("rest"+$("#rest").val())
	        
		// 버튼 눌렀을때 
	    alert("prefix / "+prefix)
        alert("suffix / "+suffix)
		console.log("버튼 눌렀을때")
		if ($("#productName").val() == "") {//공란일때
			alert("상품명을 입력해주세요 ");
			$("#productName").focus();
			return false;
		} else if (!number_pattern.test($("#productPrice").val())) {//정규식 확인
			alert("가격은 숫자로만 입력해주세요");
			$("#productPrice").focus();
			return false;
		} else if (!number_pattern.test($("#rest").val())) {//정규식 확인
			alert("가격은 숫자로만 입력해주세요");
			$("#rest").focus();
			return false;
		} else {
			$(".delbtn").each(function() { // each:반복문
				str+="<input type='hidden' name='productImgPath' value='" + prefix+suffix+ "'>";
			});
			$form.append(str);
			//$form.get(0).submit();
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