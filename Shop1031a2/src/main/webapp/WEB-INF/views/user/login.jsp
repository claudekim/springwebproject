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

<link rel="stylesheet" href="/resources/style/main.css" />
<title>Welcome to TEAM</title>
</head>
<body>
	<div class="container">
		<div class="row containerBig">
			<div class="col-sm-offset-1 col-sm-10 col-xs-12">
			
				<!--기본틀 메뉴네비 -->
				<jsp:include page="../main/header.jsp"/>
				
				<!-- 로그인 시작 -->
				<div class="row">
				<div class="login1 col-xs-12 col-sm-offset-3 col-sm-6">
					<form class=" form-horizontal" action="/user/login" method="post">
						<div class="form-group">
							<h2 style="text-align: center;">로그인</h2>
						</div>
						<div class="form-group">
							<label for="id" class=" col-xs-4">ID </label>
							<div class="col-xs-8">
								<input class="form-control " id="id" name="id"
									required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="id" class=" col-xs-4"> pw </label>
							<div class="col-xs-8">
								<input class="form-control " id="pw" name="pw" type="password"
									required="required">
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="checkbox  col-xs-4" style="text-align: right;">
								<label> <input type="checkbox" name="useCookie">자동로그인
								</label>
							</div>
							<div class=" col-xs-8">
								<button type="submit" class=" form-control btn btn-success ">로그인</button>
							</div>
						</div>
					</form>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>