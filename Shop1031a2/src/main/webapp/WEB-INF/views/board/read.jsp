<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">	</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">	</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script	src="/resources/js/upload.js" type="text/javascript"></script>

<style type="text/css">
.container {
	margin-top: 100px;
	margin-bottom: 100px;
	padding-top: 50px;
	padding: 50px;
	border: Dashed 2px #000000;
	border-radius: 8px;
}
.show {
	position: absolute;
	overflow: auto;
	max-height: 800px;
	max-width: 1200px;
	margin: auto;
	top: 0px;
	left:0px;
}

.popup {
	margin: auto;
}

.front {
	border: 1px silver;
	margin: auto;
	opacity: 1px;
	z-index: 1000;
	top: 0px;
	left:0px;
}

body {
	background-color: #000000;
}
.uploadedList {
	list-style: none;
	margin-bottom: 50px;
}
</style>
</head>
<title>글 보기</title>

</head>

<body>

	<!-- 커스터머 속성 data-하고싶은거="" 이캐쓴다-->
	<form role="form">

		<input value="${page}" name="page" type="hidden"> <input
			value="${perPage}" name="perPage" type="hidden"> <input
			value="${vo.bno}" name="bno" type="hidden">

	</form>
	
	<div class="container"	 style="background-color: #ffffff; margin-top: 50px; border-radius: 5px;">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="page-header">
					<h3>글 보기</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-bordered" style="border-radius: 10px;">
					<tr>
						<td style="text-align: center;">제목</td>
						<td>${vo.title}</td>
					</tr>
					<tr>
						<td style="text-align: center;">작성자</td>
						<td>${vo.writer}</td>
					</tr>
					<tr>
						<td style="text-align: center;">작성일</td>
						<td>${vo.regdate}</td>
					</tr>
					<tr>
						<td style="text-align: center;">조회수</td>
						<td>${vo.viewcnt}</td>
					</tr>
					<tr>
					<!--  여기에 파일을 넣을꺼야!!!!!!!!!!!!!!!!!!!!!!!!11 -->
						<td style="text-align: center;">첨부파일</td>
						<td><span class="uploadedListFile clearfix" ></span></td>
					</tr>
					<tr>
					<!--글 내용 -->
						<td colspan="2">
							<div style="display: none;" class=" popup front">
								<img id="popup_img">
							</div>
							<!--  여기에 이미지를 넣을꺼야!!!!!!!!!!!!!!!!!!!!!!!!11 -->
						<span class="uploadedListImg clearfix" ></span>
						<textarea rows="7" readonly
								style="width: 100%; border-radius: 10px; border-color: #ffffff;">${vo.content}</textarea></td>
					</tr>
				</table>
				
				<!-- ▼▼▼수정/삭제/목록버튼▼▼▼ -->
				<div class="form-group" style="text-align: right;">
						<c:if test="${vo.writer == login.mid}">
							<button type="submit" class="btn btn-warning  btn-xs  listModify">수정</button>
							<button type="submit" class="btn btn-danger  btn-xs  listDelete">삭제</button>
						</c:if>
					<button type="button" class="btn btn-primary  btn-xs  listAll">목록보기</button>
				</div><hr>
				<!-- 버튼 끝 -->
					<!--▼▼▼ 선생님이랑 한거 ▼▼▼-->
				<div class="form-group" >
				<label for="uploadedList clearfix" >첨부파일</label>
				<ul class="uploadedList clearfix" >
				</ul>
				</div><hr>
				
				<!-- ▼▼▼댓글리스트 페이징 처리 시작▼▼▼ -->
				<div class="text-center">
					<ul class="pagination pagination-sm">
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->
				
				<!-- ▼▼▼댓글쓰기 토글 버튼!▼▼▼-->
				<div class="form-group" style="text-align: left;">
				<c:choose>
					<c:when test="${not empty login}">
						<button type="submit" class="btn btn-success btn-xs" id="reply_form">댓글쓰기</button>
					</c:when>
					<c:otherwise>
					<button type="submit" class="btn btn-success btn-xs" id="login_form">로그인 하고 댓글쓰기</button>
					</c:otherwise>
				</c:choose>
				</div>
				<!-- 토글 버튼 끝 -->
				
			</div>
		</div>
		
		<!-- ▼▼▼댓글쓰기 토글시작▼▼▼ -->
		<div class="row">
			<div class="col-sm-2"></div>
			<div id="myCollapsible" class="collapse col-sm-8">
				<div class="form-group">
					<label for="replyer">작성자</label> <input id="replyer"
						class="form-control" readonly="readonly" value="${login.mid }">
				</div>
				<div class="form-group">
					<label for="replyText">내용</label> <input id="replyText"
						class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-defult" id="replyInsertBtn">등록</button>
				</div>
			</div>
		</div>
		<!-- 토글끝 -->
		
		<!-- ▼▼▼댓글 리스트시작▼▼▼-->
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8" id="replies">
			</div>
		</div>
		<!-- 댓글리스트 끝-->	
		
		<!-- ▼▼▼수정 모달창▼▼▼ -->
		<div class="row">
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog  modal-sm">
					<div class="modal-content" style="border-color: #ffffff">
						<div class="modal-header" >
							<h4 class="modal-title"> 댓글 수정 </h4>
							<button data-dismiss="modal" class="close">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="modal_rno">댓글번호</label> 
								<input readonly class="form-control" id="modal_rno">
							</div>
							<div class="form-group">
								<label for="modal_replyText">댓글내용</label> 
								<input class="form-control" id="modal_replyText">
							</div>
						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" id="modal_update" class="btn btn-default ">수정</button>
							<button data-dismiss="modal" id="modal_delete" class="btn  btn-danger">삭제</button>

							<!-- <button data-dismiss="modal" id="modal_close" class="btn  btn-basic">
							닫기</button>-->
						</div>
					</div >
				</div >
			</div>
		</div >
		<!-- 수정모달창 -->
		
	</div>
	<!-- div 컨테이너 끝-->

	
	<!-- ▼▼▼▼▼첨부파일 불러오기(수업) 핸들바스▼▼▼▼▼-->
	<script type="text/x-handlebars-template" id="templateAttach">
					<li data-src={{fullName}} class="col-xs-3 pull-left">
						<div><a class="largeShow" href ="{{getLink}}"><span> <img src="{{imgsrc}}"></span>{{fileName}}</a></div>
					</li>
	</script>
	
	<!-- ▼▼▼▼▼댓글불러와서 넣을 핸들바스(수업)▼▼▼▼▼-->
	<script type="text/x-handlebars-template" id="source">
				{{#each.}}
				<div class="panel panel-info">
					<div class="panel-heading panel-xs">
						<span>번호 : {{rno}}   |   작성자 : {{replyer}}</span>
						<span class="pull-right">{{regdate}}</span>
					</div>
					<div class="panel-body">
					<p class="{{rno}}" >{{replyText}}</p>
  						<div class="btn-group btn-group-xs  pull-right">
							<button data-replyer="{{replyer}}" data-rno="{{rno}}" class="btn btn-default callModal">수정</button>
							<button  data-replyer="{{replyer}}" data-rno="{{rno}}" class="btn  btn-basic replyDelete">삭제</button>
						</div>

					</div>
				</div>
				{{/each}}
	</script>
	
	<!-- ▼▼▼▼▼첨부파일이미지 불러오기 핸들바스▼▼▼▼▼-->
	<script type="text/x-handlebars-template" id="templateAttach1">
	<div>
	<a  class="largeShow" href="{{getLink}}"><img src = "{{getLink}}" style="max-width: 600px;"></a>
	<br>{{fileName}}
	</div><br>	
	</script>
				
	<!-- ▼▼▼▼▼첨부파일 불러오기 핸들바스▼▼▼▼▼-->
	<script type="text/x-handlebars-template" id="templateAttach2">

	▷ {{fileName}} <small><a href="{{getLink}}">다운받기</a></small><br>
	
	</script>
	
	
	
	
	
	
	
	<!-- ▼▼▼▼▼▼▼▼▼▼▼▼스크립트 스타토!▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼-->
	<script type="text/javascript">
		var bno = ${vo.bno};
	    var replyPage = 1;
		$(document).ready(function() {
			//▼▼▼▼첨부파일 가져와▼▼▼▼
			$.getJSON("/board/getAttach/"+bno,function(result){
				 var template = Handlebars.compile($("#templateAttach").html());
				$(result).each(function () {
					var fileInfo = getFileInfo(this);
					var html = template(fileInfo);
					$(".uploadedList").append(html);
				});
			});

			//▼▼▼▼첨부파일 가져와 수업아님▼▼▼▼
			$.getJSON("/board/getAttach/"+bno,function(list){
				 var template1 = Handlebars.compile($("#templateAttach1").html());
				 var template2 = Handlebars.compile($("#templateAttach2").html());
				$(list).each(function () {
					var fileInfo1 = getImgFileInfo(this);//첨부이미지만 불러오기
					var fileInfo2 = getFileInfo(this);//첨부파일이름 불러오기
					
					var html1 = template1(fileInfo1);//첨부이미지만 불러오기
					var html2 = template2(fileInfo2);//첨부파일이름 불러오기
					
					$(".uploadedListImg").append(html1);//첨부이미지만 불러오기
					$(".uploadedListFile").append(html2);//첨부파일이름 불러오기
				});
			});
			//▼▼▼▼내가 선택한 이미지눌렀을때 수업아님▼▼▼▼
			  $(".uploadedListImg").on("click", ".largeShow", function(event){
		    	 var fileLink= $(this).attr("href");
		    		if(checkImageType(fileLink)){
		    			 event.preventDefault(); 
		    			$imgTag = $("#popup_img");
		    			$imgTag.attr("src", fileLink);
		    			 $(".popup").show("slow");
		    			 $imgTag.addClass("show");
		    			 popup
		    				alert( "높이 : " + window.innerHeight  );
		    				var takasa =  window.innerHeight
			    			 $(".front").css.top = takasa/2 ;
			    			 $(".popup").css.top = takasa/2 ;
		    		}
		      });
		      $("#popup_img").click(function () {
	    			 $(".popup").hide("slow");
			});
			//▼▼▼▼내가 선택한 이미지눌렀을때 ▼▼▼▼
		      $(".uploadedList").on("click", ".largeShow", function(event){
		    	 var fileLink= $(this).attr("href");
		    		if(checkImageType(fileLink)){
		    			 event.preventDefault(); 
		    			$imgTag = $("#popup_img");
		    			$imgTag.attr("src", fileLink);
		    			 $(".popup").show("slow");
		    			 $imgTag.addClass("show");
		    			//	alert( window.innerHeight);
		    			// $(".front").style.top = window.innerHeight;
		    		}
		      });
		      $("#popup_img").click(function () {
	    			 $(".popup").hide("slow");
			});
		      
			//▼▼▼▼첨부이미지만 불러오기▼▼▼▼
			function getImgFileInfo(fullName) {
				var fileName, imgsrc , getLink;

				if(checkImageType(fullName)){
					fileName = fullName.substring(fullName.lastIndexOf("_")+1); 
					
					imgsrc = "/displayFile?fileName="+fullName; 
					var prefix = fullName.substring(0,12); 
					var suffix = fullName.substring(14);
					getLink = "/displayFile?fileName="+(prefix+suffix);
						
				}
				return {fullName : fullName, fileName : fileName , getLink : getLink , imgsrc : imgsrc};
			} 

			getLIstCriteria(replyPage)//1페이지를 선택하겠다.
			
			//▼▼▼▼내가 선택한 페이지 a태그눌렀을때▼▼▼▼
		      $(".pagination").on("click", "li a", function(event){
		        //a에있는 주소가 없는주소니까 초기화해주라
		         event.preventDefault();   //이벤트를 초기화해주고 
		         replyPage = $(this).attr("href");  //누른 값(attr)을 page에 넣어주고
		         getLIstCriteria(replyPage);    // 그 해당 페이지 띄우기
		        
		      });
			
			
			
			
			//▼▼▼▼댓글리스트 함수((이게진짜지!))▼▼▼▼
			function getLIstCriteria(page) {
				$.getJSON("/replies/"+bno+"/"+page , function(data) {
					
					//var data = JSON. parse(data);
					var source = $("#source").html();
					var template = Handlebars.compile(source);
					var list=data.list;
					
					 for(var i =0 ; i<list.length;i++){
						 for(x in list[i]){
							 var dd =list[i][x];
							 console.log(dd);
						 }
					 }
					 
					$("#replies").html(template(list));
					
					var mid='${login.mid}';
					var $btns=$(".callModal");
					
					$btns.each(function(){
						var replyer = $(this).attr("data-replyer");
						
						if(mid == replyer){
						}else{

							alert("mid"+mid + " = replyer " + replyer);
							$(this).removeClass("callModal")
							.addClass("disabled");
						}
						
					})
					
					  printPaging(data.pageMaker);
			          
		        });
		     }

		//▼▼▼▼댓글페이지 처리▼▼▼▼
		 function printPaging(pageMaker){
		        
		         var str = "";
		        
		         if(pageMaker.cri.page>=1){
		        	  if(pageMaker.cri.page>1){
		         		   str += "<li><a href=' " + (pageMaker.cri.page-1) + " '>◀</a></li>";
		        	  }else{
				           str += "<li><span>◀</span></li>";	        		  
		        	  }
		         }
		        
		         for(var i=pageMaker.beginPageNum; i <= pageMaker.stopPageNum; i++){           
		               var strClass = pageMaker.cri.page == i ? "class='active'" : "";
		              str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		         }
		        
		         if(pageMaker.cri.page<=pageMaker.totalPageNum){
		        	 if(pageMaker.cri.page<pageMaker.totalPageNum){
		        		 str += "<li><a href= ' " + (pageMaker.cri.page + 1) + " ' > ▶ </a></li>";
		        	  }else{
				           str += "<li><span>▶ </span></li>";	        		  
		        	  } 
		         }	        
		         
		         $('.pagination').html(str); //페이지       
		      }
			 
  

			//▼▼▼▼내가 선택한 페이지 a태그눌렀을때▼▼▼▼
		      $(".pagination").on("click", "li a", function(event){
		        
		         event.preventDefault();   //이벤트를 초기화해주고 
		         replyPage = $(this).attr("href");  //누른 값을 page에 넣어주고
		         getLIstCriteria(replyPage);    // 그 해당 페이지 띄우기
		        
		      });
			
			//▼▼▼▼댓글리스트 호출▼▼▼▼
			getLIstCriteria(replyPage);
			//▼▼▼▼reply_form 댓글 쓰기버튼이 눌렸을때 토글▼▼▼▼
			$("#login_form").click(function() {
				<% 
				
				String uri = request.getRequestURI().substring(14, 25);
				String query = "?"+request.getQueryString();
				String dest = uri+query;
				System.out.println(dest);
				session.setAttribute("dest",dest);
				
				%>
				self.location = "/user/login"	;
			});
			//▼▼▼▼reply_form 댓글 쓰기버튼이 눌렸을때 토글▼▼▼▼
			$("#reply_form").click(function() {
				$("#myCollapsible").collapse("toggle");
			});

			//▼▼▼▼replyInsertBtn 댓글 등록버튼이 눌렸을때 ▼▼▼▼
			$("#replyInsertBtn").click(function() {
				var replyer = $("#replyer").val(); //쓰니 소환
				var replyText = $("#replyText").val();//내용 소환

				if(replyText==null || replyText ==""){
					 $("#replyText").focus();
					 return;
				}
	
				//▼▼▼ajax 시작
				$.ajax({
					//▼▼▼어떤방식으로 보낼꺼니?
					type : 'post',
					//▼▼▼어디다 보낼거니?
					url : '/replies',
					//▼▼▼헤더는 어캐해서 보낼거야?
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					//▼▼▼돌아오는값은 뭐야? 스트링으로 옴=>텍스트 ㅇㅇ
					dateType : 'text',
					//▼▼▼보낼애들 바구니에 정리해서 넘겨버렷!
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						replyText : replyText
					}),
					//▼▼▼성공하면하고싶은것
					success : function(result) {
						if (result == "REPLYINSERT_SUCCESS") {
							alert("댓글쓰기 성공");
							//$("#replyer").val("");
							$("#replyText").val("");
							$("#myCollapsible").collapse("toggle");//닫아줄래 ㅎㅎ		

							getLIstCriteria(replyPage);
						}
					},
					/*▼▼▼작업이 어찌되든 난 이걸할거야!!!!
					complete : function() {
						alert("작업성공 상관없이호출이 되버렷!");
					},*/
					//▼▼▼실패하면 할것
					error : function(result) {
						alert("댓글쓰기 실패");
					}
				});//ajax 끝!
			});

			//▼▼▼▼(모달) 댓글창 수정눌렀을때 나와라 (모달)▼▼▼▼
			$("#replies").on("click", ".callModal", function() {
				var rno = $(this).attr("data-rno");
				var replyText = $("p." + rno).text();

				//콘솔확인
				console.log("모달보낼번호> " + rno);
				console.log("모달보낼내용> " + replyText);
				$("#modal_rno").val(rno);
				$("#modal_replyText").val(replyText);
				$("#myModal").modal("show");
			});

			//▼▼▼▼(모달)댓글 수정완료버튼이 눌렸을때 (모달)▼▼▼▼
			$("#modal_update").click(function() {
				var newRno = $("#modal_rno").val();//수정할 번호소환
				var newReplyText = $("#modal_replyText").val();//수정내용 소환
				//콘솔확인
				console.log("수정할 번호> " + newRno);
				console.log("수정할 내용> " + newReplyText);
				//▼▼▼ajax 시작
				$.ajax({
					type : 'put',
					url : '/replies/' + newRno,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'PUT'
					},
					dateType : 'text',
					data : JSON.stringify({
						replyText : newReplyText
					}),
					success : function(result) {
						if (result == "REPLYUPDATE_SUCCESS") {
							alert("댓글수정 성공");
						}
						getLIstCriteria(replyPage);
					},
					error : function(result) {
						alert("댓글수정 실패");
					}
				});//ajax 끝!
			});//댓글 수정 끝!

			//▼▼▼▼(모달) 댓글 삭제버튼이 눌렸을때 (모달에서!)▼▼▼▼
			$("#modal_delete").click(function() {
				var deleteRno = $("#modal_rno").val();//삭제할 번호소환

				//콘솔확인
				console.log("삭제할 번호> " + deleteRno);

				//유저기호조사?
				if (confirm("정말 삭제할거야...?")) {
					//▼▼▼ajax 시작
					$.ajax({
						type : 'delete',
						url : '/replies/' + deleteRno,
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'DELETE'
						},
						dateType : 'text',
						success : function(result) {
							if (result == "REPLYDELETE_SUCCESS") {
								alert("뉴ㅠㅠㅠ삭제했다ㅠ");
							}
							getLIstCriteria(replyPage);
						},
						error : function(result) {
							alert("댓글 삭제 실패");
						}
					});//ajax 삭제 끝!
				} else {
					alert(" > 오예 살았다!!!!ㅋㅋㅋ");
				}
			});//댓글 모달 삭제 끝!

			//▼▼▼▼댓글창에서 바로 삭제눌렀을때 나와라 ▼▼▼▼
			//▼▼▼▼모달 아님!!!!▼▼▼▼
			$("#replies").on("click", ".replyDelete", function() {
				var deleteRno = $(this).attr("data-rno");//삭제할 번호소환

				//콘솔확인
				console.log("삭제할번호 > " + deleteRno);

				//유저기호조사?
				if (confirm("정말 삭제할거야?")) {
					//▼▼▼ajax 시작
					$.ajax({
						type : 'delete',
						url : '/replies/' + deleteRno,
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'DELETE'
						},
						dateType : 'text',
						success : function(result) {
							if (result == "REPLYDELETE_SUCCESS") {
								alert("뉴ㅠㅠㅠ삭제했음ㅠ");
							}
							getLIstCriteria(replyPage);
						},
						error : function(result) {
							alert("댓글 삭제 실패");
						}
					});//ajax 삭제 끝!
				} else {
					alert(" > 오예 살았다!!!!ㅋㅋ");
				}
			});//댓글 삭제 끝!

			var $form = $('form[role="form"]');//달러붙이면  태그가 선택된거	
			//▼▼▼▼modify 수정버튼이 눌렸을때▼▼▼▼
			$(".listModify").click(function() {
				$form.attr("action", "/board/update");
				$form.attr("method", "get");
				$form.submit();
			});
			//▼▼▼▼delete1 삭제버튼이 눌렸을때▼▼▼▼
			$(".listDelete").click(function() {
				$form.attr("method", "post");
				$form.attr("action", "/board/delete");
				$form.submit();
			});
			//▼▼▼▼listall 목록보기가 눌렸을때▼▼▼▼
			$(".listAll").click(function() {
				$form.attr("action", "/board/listcriteria");
				$form.attr("method", "get");
				$form.submit();
			});

		}); //$(document).ready(function() 끝!

		//▼▼▼▼글쓰거나 수정할때는 글보기로 ▼▼▼▼
		//▼▼▼▼바로와서 메시지뿌려주세요▼▼▼▼
		var result = "${msg}";
		if (result == "INSERT_SUCCESS") {
			alert("글쓰기 성공");
		} else if (result == "UPDATE_SUCCESS") {
			alert("수정 성공");
		}
	</script>
</body>
</html>