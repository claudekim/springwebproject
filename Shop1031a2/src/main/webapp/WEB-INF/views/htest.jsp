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
<title>TITLE</title>
</head>
<body>
	<!-- 핸들바스를 선언하려면 스크립트태그가 필요한데 나중에합니다??
	마크업부터 먼저 해야 컨트+스페이스가 먹힘 ㅋㅋ
	
	핸들바스 기본태그는 중괄호 두개!!{{}}
	붕어빵틀->{{}} 여기에 밀가루넣어요
	{{!-- --}}<=-주석처리는 이캐이캐
	 -->

	<script type="text/x-handlebars-template" id="htest">
 	<div>{{name}}</div>
	</script>
	<!-- 이런게 변수명이된다 -->

	<script type="text/javascript">
		var source = $("#htest").html();//위에 htest를 html태그화 시켜라
		//동적으로 만들려면 이게필요함
		var template = Handlebars.compile(source);//위에만든소스를 컴파일시킴
		var data = {
			name : "길동이"
		};
		$("body").html(template(data));
	</script>
	<!-- ==============두번째================= -->
	<br>
	<hr>
	<div class="test">여기내용좀 나와주라</div>

	<script type="text/x-handlebars-template" id="urltest">
	<div>
		<a href="{{url}}">{{name}}</a>
		<p>{{url}}</p>
		<p>{{name}}</p>
	</div>
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			var source2 = $("#urltest").html();
			var template2 = Handlebars.compile(source2);
			var data2 = {

				url : "http://www.naver.com",
				name : "네이버로 가버렷"
			};
			$(".test").html(template2(data2));
			//append <->html 가능 ㅋㅋㅋ
		});
	</script>


</body>
</html>

