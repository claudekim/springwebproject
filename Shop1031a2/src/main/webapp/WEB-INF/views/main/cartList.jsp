<%@page import="kr.co.domain.CartListVO"%>
<%@page import="org.apache.ibatis.io.ResolverUtil.Test"%>
<%@page import="java.util.List"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/js/upload.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/style/main.css" />
<title>Welcome to TEAM</title>
</head>
<body>
	<div class="container">

		<div class="row containerBig">
			<div class="col-sm-offset-1 col-sm-10 col-xs-12">
				<!--기본틀 메뉴네비 -->
				<jsp:include page="../main/header.jsp" />

				<div class="row returnCatagory">
					<div class="col-sm-offset-1 col-sm-5 col-xs-6">
						<a href="#" onclick="history.back()"> ◀ 이전돌아가기 </a> <br>
						<br>

					</div>
				</div>
				<br>
				<!-- 상세이미지랑 수량 장바구니등등  -->
				<div class="row">
					<div class="col-sm-offset-1 col-sm-10  col-xs-12">

						<table class="table table-condensed">
							<thead>
								<tr>
									<th>상품</th>
									<th style="width: 90px; text-align: center; boder:dotted 1px; ">수량</th>
									<th  style="width: 80px; text-align: center; ">가격</th>
									<th  style="width: 20px; text-align: center; "></th>
								</tr>
							</thead>
							<tbody id="cartStart">
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<button class="btn " id="deleteAll">모두삭제</button>
										<button class="btn btn-success ">구매하기</button>
									<td colspan="2">
										total : <span id="hereTotal"></span> 원 </div>
									</td>
								</tr>
							</tfoot>
						</table>
						<br> <br>
					</div>
				</div>
				<!--회사 정보 맨밑 팀이름 	제작자 이름 학원 이름 등등~ -->
				<footer class="container-fluid text-left">
					<p>
						우리가 누군지 물어보신다면<br> 대답해드리는게 인지상정...... 팀플하는중입니다ㅜㅜ<br>
						김서울/김태훈/이슬아<br>
						<문의>중앙<br>
						Mail : asdf@asdfasdf.co.kt<br>
						Phone : 101-1010-1010 
					</p>
				</footer>
			</div>
		</div>

	</div>
	<!-- ▼▼▼▼▼ 핸들바스▼▼▼▼▼-->
	<script type="text/x-handlebars-template" id="source">
				{{#each.}}
		<tr>
			<td>
			<br>{{productName}} 
			</td>

			<td>
				<div class="count_range">
					<input class="count countItem" value="{{productQuantity}}" readonly
						name="countItem" style="width: 40px; text-align: center; margin-top:11px; margin-bottom:11px; ">
					<div class="btn-group-vertical btn-xs" >
						<input value="▲" count_range="p" class="btn btn-xs up" type="button"  name="up" style="display: none;">
						<input value="▼" count_range="m" class="btn btn-xs down" type="button" name="down" style="display: none;">
					</div><br>
					<input type="button" class="btn btn-xs canCount" name="canCount" value="수량변경"
					style="margin-bottom:11px; ">
					<input type="button" class="btn btn-xs changeCount" data-cln={{cartListNum}} name="changeCount" value="변경완료" 
					style="display: none; margin-bottom:11px; ">
				</div>
			</td>

			<td  style="text-align: right;"><br>{{productPrice}}원</td>
			<td style="text-align: center; margin-top:auto; margin-bottom:auto; "><br>
			<button class="btn btn-xs CountDelete" name="CountDelete"  data-cln={{cartListNum}}>삭제</button></td>
		</tr>
		{{/each}}
	</script>
	<!-- ▼▼▼▼▼ 스크립트 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼-->
	<script type="text/javascript">
		$(document).ready(function() {

			var id ='${id}';
			console.log(id);

			//▼▼▼▼장바구니 호출▼▼▼▼
			function getLIstCriteria() {
				$.getJSON("/main/cartList/"+id, function(data) {
					var source = $("#source").html();
					var template = Handlebars.compile(source);
					var length=data.length ; //카트에 들어있는 상품수
					var total=0;
					for(var i = 0 ; i<length  ; i++){
						//상품 가격 곱하기 수량
						data[i].productPrice=data[i].productPrice*data[i].productQuantity;
						total=total+data[i].productPrice;
						console.log(total +" / "+i);
					}
					$("#cartStart").html(template(data));
					  $("#hereTotal").add().text(total);
				});
			}
			getLIstCriteria();//장바구니 호출
			
			//▼▼▼▼하나 삭제눌렀을때 나와라 ▼▼▼▼ ▼▼▼▼
			$("#cartStart").on("click", ".CountDelete", function() {
				var cartListNum = $(this).attr("data-cln");//삭제할 번호소환

				//콘솔확인
				console.log("삭제할번호 > " + cartListNum);

				//물어보기
				if (confirm("장바구니에서 삭제하시겠습니까?")) {
					$.ajax({
						type : 'get',
						url : '/main/cartList/delete/'+cartListNum+'/'+id,
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'GET'
						},
						dateType : 'text',
						success : function(result) {
							if (result == "DELETE_OK") {
								alert("삭제되었습니다");
							}
							getLIstCriteria();//장바구니 호출
						},
						error : function(result) {
							alert("삭제실패");
						}
					});//ajax 삭제 끝!
				} 
			});//장바 하나 삭제 끝!

			//▼▼▼▼다 삭제눌렀을때 나와라 ▼▼▼▼ ▼▼▼▼
			$("#deleteAll").click(function() {

				//콘솔확인
				console.log("삭제할id > " + id);
				//물어보기
				if (confirm("장바구니에서 삭제하시겠습니까?")) {
					$.ajax({
						type : 'get',
						url : '/main/cartList/delete/'+id,
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'GET'
						},
						dateType : 'text',
						success : function(result) {
							if (result == "DELETE_OK") {
								alert("삭제되었습니다");
							}
							getLIstCriteria();//장바구니 호출
							$("#deleteAll").hide();
						},
						error : function(result) {
							alert("삭제실패");
						}
					});//ajax 삭제 끝!
				} 
			});//장바모두 삭제 끝!
			
			
			//▼▼▼▼수량변경하기 눌렀을떄▼▼▼▼ ▼▼▼▼
			$("#cartStart").on("click",".canCount",function(){
				console.log("수량변경하기 눌렀을떄");
				$(this).parent().children().children('input.down').show();//버튼보이기
				$(this).parent().children().children('input.up').show();//▼버튼보이기
				$(this).parent().children('input.changeCount').show();//변경완료버튼보이기
				$(this).hide();//수량변경하기버튼숨기
			});//-버튼눌렀을떄

			//변경에서 플러스 눌렀을때 ++++++++
			$("#cartStart").on("click",".up",function(){
				console.log(" 더하기기 눌렀을떄");
		        var $countItem = $(this).parent().parent().children('input.countItem');//수량 키+벨류
				var countItem_val = $countItem.val(); //수량 키+벨류
				console.log("원래수량"+$countItem.val());
				$countItem.val(parseInt(countItem_val)+1);
				console.log("바뀐수량"+$countItem.val);
			
			});//+버튼눌렀을떄
			
			//변경에서 마이너스 눌렀을때 --------
			$("#cartStart").on("click",".down",function(){
				console.log(" 빼기 눌렀을떄");
		        var $countItem = $(this).parent().parent().children('input.countItem');//수량 키+벨류
				var countItem_val = $countItem.val(); //수량 키+벨류
				console.log("원래수량"+$countItem.val());
				if(parseInt(countItem_val)>1){
					$countItem.val(parseInt(countItem_val)-1);
					console.log("바뀐수량"+$countItem.val);
				}
				
			});//수정하기버튼눌렀을때
			
			//수량 변경완료 눌렀을떄 
			$("#cartStart").on("click",".changeCount",function(){
				console.log("변경완료하기 눌렀을떄");
		        var $countItem = $(this).parent().children('input.countItem');//수량 키+벨류
				var countItem_val = parseInt($countItem.val()); //수량 키+벨류
				var cartListNum= $(this).attr("data-cln");//수정할번호소환
				console.log("최종변경수량"+countItem_val);
				console.log("변경할 카트번호 "+cartListNum);
				//업데이트ajax해주자
				$.ajax({
					type : 'get',
					url : '/main/cartList/update/'+cartListNum+'/'+countItem_val+'/'+id,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'GET'
					},
					dateType : 'text',
					success : function(result) {
						if (result == "UPDATE_OK") {
							console.log("업데이트완료");

							$(this).parent().children().children('input.down').hide();//버튼보이기
							$(this).parent().children().children('input.up').hide();//▼버튼보이기
							$(this).hide();//변경완료버튼숨기
							$(this).parent().children('input.canCount').show();//변경완료버튼보이기
							getLIstCriteria();
							//getLIstCriteria();//장바구니 호출
						}
					},
					error : function(result) {
						alert("업뎃실패");
					}
				})//
			});//변경완료
			

			
			
		});
	</script>
</body>
</html>