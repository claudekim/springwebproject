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
	  .login1{
	  margin-top : 100px;
	  padding: 30px;
	  border: Dashed 3px #ededed;
	  border-radius: 8px;
	  background-color: #ffffff;
	  width: 400px;
	   }
	
	body {
		background-color: #ededed;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="row col-xs-3"></div>
		<div class="row login1 col-xs-6">
			<form class="form-horizontal" action="/user/login" method="post">
				<div class="form-group">
					<h3 style="text-align: center;">로그아웃되셨어요</h3>
					<h2 style="text-align: center;">로그인</h2>
					<hr>
				</div>
				<div class="form-group">
					<label for="mid" class=" col-xs-4">ID </label>
					<div class="col-xs-8">
						<input class="form-control " id="mid" name="mid" required="required">
					</div>
				</div>
				<div class="form-group">
					<label for="mid" class=" col-xs-4"> pw </label>
					<div class="col-xs-8">
						<input class="form-control " id="mpw" name="mpw" type="password"
							required="required">
					</div>

				</div>
				<hr>
				<div class="form-group">
					<div class="checkbox col-xs-offset-4 col-xs-4" style="text-align: right;">
					<label>
					<input type="checkbox" name="useCookie" >자동로그인
					</label>
					</div>
					<div class=" col-xs-4">
						<button type="submit" class=" form-control btn btn-success ">로그인</button>
					</div>
				</div>
			</form>
			
			<!-- <form action="/user/login" method="post">
				<div class="form-group">
					<label for="mid">ID </label> 
					<input class="form-control" id="mid" name="mid" required="required">
				</div>
				<div class="form-group">
					<label for="mpw">비밀번호 </label> 
					<input  class="form-control"  id="mpw" name="mpw" type="password"  required="required">
				</div>
				
				<div class="form-group">
				<button type="submit" class=" form-control btn btn-primary">로그인</button>
				</div>
			</form>-->
		</div>
	</div>
</body>
</html>