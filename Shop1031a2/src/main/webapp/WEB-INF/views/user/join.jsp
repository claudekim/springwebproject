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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"  href="/resources/style/main.css" />
<title>Welcome to TEAM</title>
</head>
<body>
	<div class="container">

		<div class="row containerBig">
			<div class="col-sm-offset-1 col-sm-10 col-xs-12">
			
				<!--기본틀 메뉴네비 -->
				<jsp:include page="../main/header.jsp"/>

				<!-- ▼▼▼▼▼ 로그인 폼 시작 ▼▼▼▼▼ -->
				<div class="row">
					<div class="col-sm-offset-2 col-sm-8 col-xs-12">
					<h2>Join us</h2>
						<form id="formjoin" action="join" method="post">
							<table class="table" id="signtable" border="0">
								<tr>
									<th style="width: 200px;">아이디 *</th>
									<td><input type="text" name="id" id="id" size="10"> <span></span>
									<br> ※ 영어 숫자만 사용가능
									</td>
									<!-- <td id="msgid"></td> -->
								</tr>
								<tr>
									<th>비밀번호 *</th>
									<td><input type="password" name="pw"  id="pw" size="10"> <span></span>
									<br> ※ 영어 숫자만 사용가능
									</td>
									<!--  div : 영역잡지않으면 td안에서 아래로 내려가서 출력 -->
								</tr>
								<tr>
									<th>비밀번호확인 *</th>
									<td><input type="password" id="pwd2" size="10">  <span></span></td>
								</tr>
								<tr>
									<th>이름 *</th>
									<td><input type="text" name="name" id="name" size="10"></td>
								</tr>
								<tr>
									<th>전화번호 *</th>
									<td><input type="tel" name="phone" id="phone" size="20"> <br> ※ 기호없이 숫자만 입력해주세요
									</td>
								</tr>
								<tr>
									<th>주소 *</th>
									<td><input type="text" name="address" id="address"  size="20"></td>
								</tr>
								<tr>
									<td colspan="2"  style="text-align: center;"><br>
										<input type="submit" id="btnjoin" class="btn btn-success" 	 style="width: 130px;"	value="가입"> 
										<input type="reset" id="btncancel"  class="btn"  style="width: 130px;"
										value="취소">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">

    
    $(function(){
        //$("#birth").datepicker(); //datepicker 사용안해버렷
        
        var id_pattern = /(^[A-Za-z0-9_]{1,20}$)/; //정규식 영숫 1~20글자만 사용해주라!
        var pw_pattern = /(^[A-Za-z0-9_]{1,20}$)/; //영숫 1~20글자만 사용해주라!
        var phone_pattern = /(^[0-9_]{1,20}$)/;
        //▼▼▼▼▼▼▼▼아이디 체크하기▼▼▼▼▼▼▼▼
        $("#id").keyup(function(event){ 
        	// blur 키입력후 텍스트 끝냈을때, keyup은 키보드입력이 끝났을때
             
             console.log($("#id").val());
        
            if(!id_pattern.test($("#id").val())){
                //$("#msgid").text("wrong"); // td나 주고싶은곳의 이름을 줘서 직접 넣는것
                $("#id").next().removeClass('success').addClass('error').html('영문숫자,20글자이하 사용가능'); 
                //id다음 부분에 text의 내용을 넣는것
            }else{
            	
            	var id = $("#id").val();//체크받을 아이디값
				console.log("ajax에 보낼 아이디값> " + id);
				//▼▼▼ajax 시작
				
				$.ajax({
					type : 'post',
					url : '/user/idCheck/'+id,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					dateType : 'text',
					//data : JSON.stringify({id : id}),
					success : function(result) {
						console.log("성공");
						if (result == "ID_사용가능") {
			            	$("#id").next().removeClass('error').addClass('success').text("사용가능한 아이디입니다.");
						}else{
			            	$("#id").next().removeClass('error').addClass('success').text("존재하는 아이디입니다.")
						}
					},
					error : function(result) {
						console.log("idCheck 실패");
					}
				});//ajax 끝!
                //뒤에부터 실행, addClass 작동후 removeClass가 작동ㅇ
            }        
        });
        
      //▼▼▼▼▼▼▼▼비밀번호체크하기▼▼▼▼▼▼▼▼
        $("#pw").keyup(function(event){
            console.log("pw1 >"+  $("#pw").val());
            if(!pw_pattern.test($("#pw").val())){
                $("#pw").next().removeClass('success').addClass('error').text("영문숫자,20글자이하만 사용가능");
            }
            else{
                $("#pw").next().removeClass('error').addClass('success').text("사용가능");
            }
        });
        $("#pwd2").keyup(function(event){
        	console.log("pw1 > "+  $("#pw").val());
            console.log("pw2 >"+  $("#pwd2").val());
            if($("#pwd2").val()!=$("#pw").val()){//같지않을때
                $("#pwd2").next().removeClass('success').addClass('error').text("비밀번호가 일치하지 않습니다");
            }
            else{
                $("#pwd2").next().removeClass('error').addClass('success').text("일치 합니다");
            }
        });
        
        // 가입버튼 눌렀을때 
        $("#formjoin").submit(function() {
            
            if(!id_pattern.test($("#id").val())){//id 정규식 확인
                alert("아이디는 영어 및 숫자로만 입력해주세요");
                $("#id").focus();//커서를 위치한다
                return false;
            }
            if(!pw_pattern.test($("#pw").val())){//pw 정규식 확인
                alert("비밀번호는 영어 및 숫자로만 입력해주세요");
                $("#pw").focus();
                return false;
            }
            if($("#pwd2").val()!=$("#pw").val()){//pw 
                alert("비밀번호가 일치하지 않습니다");
                $("#pwd2").focus();
                return false;
            }
            if($("#name").val()==""){//이름공란일때
                alert("이름을 입력해주세요. ");
                $("#name").focus();
                return false;
            }
            if(!phone_pattern.test($("#phone").val())){//phone 정규식 확인
                alert("전화번호를 입력해주세요. ");
                $("#phone").focus();
                return false;
            }
            if($("#address").val()==""){//pw 정규식 확인
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