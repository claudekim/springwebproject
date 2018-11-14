<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">	</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">	</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<title>글 보기</title>
</head>
<body>
	<form role="form">
	
		<input value="${page}" name="page" type="hidden">
		<input value="${perPage}" name="perPage" type="hidden">
		<input value="${vo.bno}" name="bno" type="hidden">
		<input value="${keyword}" name="keyword" type="hidden">
		<input value="${searchType}" name="searchType" type="hidden">
		
	</form>
	<div class="container"
		style="background-color: #ffffff; margin-top: 50px; border-radius: 5px;">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="page-header">
					<h2>글 보기</h2>
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
						<td colspan="2"><textarea rows="7" readonly
								style="width: 100%; border-radius: 10px; border-color: #ffffff;">${vo.content}</textarea></td>
					<tr>
				</table>
				<div class="form-group" style="text-align: right;">
					<button type="submit" class="btn btn-warning  btn-xs  listmodify">수정</button>
					<button type="submit" class="btn btn-danger  btn-xs  listdelete">삭제</button>
					<button type="button" class="btn btn-primary  btn-xs  listall">목록보기</button>
				</div>
				<div class="form-group" style="text-align: left: ;">
					<button type="submit" class="btn btn-success btn-xs " id="reply_form">댓글쓰기</button>
					</div>
			</div>
		</div>
			<!-- ▼▼▼토글시작▼▼▼ -->
		<div class="row">
			<div class="col-sm-2"></div>
			<div id="myCollapsible" class="collapse col-sm-8">
				<div class="form-group">
					<label for="replyer">작성자</label> <input id="replyer"
						class="form-control">
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

		<!-- ▼▼▼댓글리스트시작▼▼▼-->
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8" id="replies">
			</div>
		</div>
		<!-- 댓글리스트 끝-->
		
		<!-- ▼▼▼수정모달창▼▼▼ -->
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
					</div>
				</div>
			</div>
		</div>
		<!-- 수정모달창 -->
	</div>
	<!-- div 컨테이너 끝-->

	<!-- ▼▼▼▼▼▼▼▼▼▼▼▼댓글불러올때 핸들바스▼▼▼▼▼▼▼▼▼▼▼▼-->
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
						<button data-rno="{{rno}}" class="btn btn-default callModal">수정</button>
						<button  data-rno="{{rno}}" class="btn  btn-basic replyDelete">삭제</button>
					</div>
				</div>
			</div>
		{{/each}}
	</script>
	
	
	<!-- ▼▼▼▼▼▼▼▼▼▼▼▼スクリプトスタット！▼▼▼▼▼▼▼▼▼▼▼▼-->
	<script type="text/javascript">
		var bno = ${vo.bno};//번호 선언

		$(document).ready(function() {
			//▼▼▼▼댓글리스트 함수▼▼▼▼
			function getAllLIst() {
				$.getJSON("/replies/all/" + bno, function(data) {
					var source = $("#source").html();
					var template = Handlebars.compile(source);
					$("#replies").html(template(data));
				});
			};
			//▼▼▼▼댓글리스트 호출▼▼▼▼
			getAllLIst();

			//▼▼▼▼reply_form 댓글 쓰기버튼이 눌렸을때 토글▼▼▼▼
			$("#reply_form").click(function() {
				$("#myCollapsible").collapse("toggle");
			});

			//▼▼▼▼replyInsertBtn 댓글 등록버튼이 눌렸을때 ▼▼▼▼
			$("#replyInsertBtn").click(function() {
				var replyer = $("#replyer").val(); //쓰니 소환
				var replyText = $("#replyText").val();//내용 소환

				//▼▼▼ajax 시작
				$.ajax({
					type : 'post',
					url : '/replies',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					dateType : 'text',
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						replyText : replyText
					}),
					//▼▼▼성공하면하고싶은것
					success : function(result) {
						if (result == "REPLYINSERT_SUCCESS") {
							alert("댓글쓰기 성공");
							$("#replyer").val("");
							$("#replyText").val("");
							$("#myCollapsible").collapse("toggle");//닫아줄래 ㅎㅎ		

							getAllLIst();
						}
					},
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
						getAllLIst();
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
							getAllLIst();
						},
						error : function(result) {
							alert("댓글 삭제 실패");
						}
					});//ajax 삭제 끝!
				} else {
					alert(" > 오예 살았다!!!!ㅋㅋㅋ");
				}
			});//댓글 모달 삭제 끝!

			//▼▼▼▼(모달 아님 X)댓글창에서 바로 삭제눌렀을때 나와라 ▼▼▼▼
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
								alert("뉴ㅠㅠㅠ삭제했다ㅠ");
							}
							getAllLIst();
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
			$(".listmodify").click(function() {
				$form.attr("action", "/sboard/update")
				$form.attr("method", "get");
				$form.submit();
			})
			//▼▼▼▼delete1 삭제버튼이 눌렸을때▼▼▼▼
			$(".listdelete").click(function() {
				$form.attr("method", "post");
				$form.attr("action", "/sboard/delete")
				$form.submit();
			})
			//▼▼▼▼listall 목록보기가 눌렸을때▼▼▼▼
			$(".listall").click(function() {
				$form.attr("action", "/sboard/listcriteria")

				$form.attr("method", "get");
				$form.submit();
			})

		});

		var result = "${msg}";
		if (result == "INSERT_SUCCESS") {
			alert("글쓰기 성공");
		} else if (result == "UPDATE_SUCCESS") {
			alert("수정 성공");
		}
	</script>
</body>
</html>