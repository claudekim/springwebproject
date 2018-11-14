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
					<div class="col-sm-offset-1 col-sm-10 col-xs-12">
						<div style="text-align: center;">
							 ${login.name} 고객님 / ${login.grade} 등급 / 적립금 : ${login.point}원<br><br> 
							 <input type="button" class="btn order" value="주문기록토글"> 
							 <input type="button" class="btn userShow" value="회원정보확인수정"> <br>
							<br>
						</div>
						<div class="pwokform" style="display: none; text-align: center;">
							<br>
							<br> 비밀번호 확인<br> <input type="password" name="pwok"
								id="pwok" size="20"><br><span id="oldpwok" ></span><span></span> <br>
								힌트 : ${login.pw}
							<br> <input type="button" class="btn pwokbtn" value="확인"
								size="10"> <br>
							<br>
						</div>



						<form id="formjoin" action="update" method="post">
							<table class="table userTable" id="signtable"
								style="display: none; border: 0px;">
								<tr>
									<th style="width: 200px;">아이디</th>
									<td><input type="text" name="id" id="id" size="10"
										readonly="readonly" value="${login.id}">
								</tr>
								<tr>
									<th>새 비밀번호 <br> ※ 미변경시 공란
									</th>
									<td><input type="password" name="pw" id="pw" size="10">
										<span></span> <br> ※ 영어 숫자만 사용가능</td>
									<!--  div : 영역잡지않으면 td안에서 아래로 내려가서 출력 -->
								</tr>
								<tr>
									<th>새 비밀번호확인 </th>
									<td><input type="password" id="pwd2" size="10"> <span></span></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="name" id="name" size="10"
										readonly="readonly" value="${login.name}"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="tel" name="phone" id="phone" size="20" value="${login.phone}">
										<br> ※ 기호없이 숫자만 입력해주세요</td>
								</tr>
								<tr>
									<th>주소 </th>
									<td><input type="text" name="address" id="address" value="${login.address}"
										size="20"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><br> <input
										type="submit" id="btnjoin" class="btn btn-success"
										style="width: 130px;" value="수정완료"> <input
										type="button" id="btncancel" class="btn" style="width: 130px;"
										value="탈퇴하기"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<br>
				<br> <br>
				<br> <br>
				<br> <br>
				<br> <br>
				<br> <br>
				<br> <br>
				<br> <br>
				<br>
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
	<script type="text/javascript">
		$(function() {
			
			$(".userShow").click(function() {
				$("#pwok").val('');
				$(".pwokform").toggle();
				$("#signtable").hide();
			})
			
			$(".pwokbtn").click(function() {
				if($("#pwok").val()!="${login.pw}"){
					$("#oldpwok").next().addClass(
					'error').text("비밀번호가 일치하지 않습니다");
					$("#pwok").focus();
				}else{
					$("#signtable").show();
					$(".pwokform").hide();
				}
			})
			
			$(".order").click(function() {
				$(".pwokform").hide();
				$("#signtable").hide();
				$("#ordertable").toggle();
			})
			var pw_pattern = /(^[A-Za-z0-9_]{1,20}$)/; //영숫 1~20글자만 사용해주라!
			var phone_pattern = /(^[0-9_]{1,20}$)/;

			//▼▼▼▼▼▼▼▼비밀번호체크하기▼▼▼▼▼▼▼▼
			$("#pw").keyup(
					function(event) {
						console.log("pw1 >" + $("#pw").val());
						if (!pw_pattern.test($("#pw").val())) {
							$("#pw").next().removeClass('success').addClass(
									'error').text("영문숫자,20글자이하만 사용가능");
						}else {
							$("#pw").next().next().removeClass('error').addClass(
									'success').text("사용가능");
						}
					});
			$("#pwd2").keyup(
					function(event) {
						console.log("pw1 > " + $("#pw").val());
						console.log("pw2 >" + $("#pwd2").val());
						if ($("#pwd2").val() != $("#pw").val()) {//같지않을때
							$("#pwd2").next().removeClass('success').addClass(
									'error').text("비밀번호가 일치하지 않습니다");
						} else {
							$("#pwd2").next().removeClass('error').addClass(
									'success').text("일치 합니다");
						}
					});
			// 가입버튼 눌렀을때 
			$("#formjoin").submit(function() {
				if ($("#pw").val() != "") {
					if (!pw_pattern.test($("#pw").val())) {//pw 정규식 확인
						alert("비밀번호는 영어 및 숫자로만 입력해주세요");
						$("#pw").focus();
						return false;
					}
					if ($("#pwd2").val() != $("#pw").val()) {//pw 
						alert("비밀번호가 일치하지 않습니다");
						$("#pwd2").focus();
						return false;
					}
				} else {
					$("#pw").val() = $("login.pw");
				}

				if ($("#name").val() == "") {//이름공란일때
					alert("이름을 입력해주세요. ");
					$("#name").focus();
					return false;
				}
				if (!phone_pattern.test($("#phone").val())) {//phone 정규식 확인
					alert("전화번호를 입력해주세요. ");
					$("#phone").focus();
					return false;
				}
				if ($("#address").val() == "") {//pw 정규식 확인
					alert("주소를 입력해주세요. ");
					$("#address").focus();
					return false;
				}
				//모든 조건이 문제 없을시
				return true;
			});
		});
	</script>
</body>
</html>