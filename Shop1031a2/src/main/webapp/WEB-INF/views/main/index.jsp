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
<link rel="stylesheet"  href="/resources/style/main.css" />
<title>Welcome to TEAM</title>
</head>
<body>
	<div class="container">

		<div class="row containerBig">
			<div class="col-sm-offset-1 col-sm-10 col-xs-12">
				<!--기본틀 메뉴네비 -->
				<jsp:include page="../main/header.jsp"/>

				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" style="height: 400px;">
						<c:forEach begin="0" end="0" items="${bestList6}" var="bestImg">
							<div class="item active">
								<!-- active -->
								<c:choose>
									<c:when test="${bestImg.productImgPath=='이미지없음'}">
										<img src="/resources/ImgEx.png" class="img-responsive"
											style="height: 400px; width: 1200px;"
											alt="${bestImg.productName}">
									</c:when>
									<c:otherwise>
										<img src="/displayFile?fileName=/${bestImg.productImgPath}" class="img-responsive"
											style="height: 400px; width: 1200px;" width=100%;"  alt="${bestImg.productName}">
									</c:otherwise>
								</c:choose>
								<div class="carousel-caption">
									<h3>${bestImg.productName}</h3>
									<br>
								</div>

							</div>
						</c:forEach>
						<c:forEach begin="1" end="2" items="${bestList6}" var="bestImg">
							<div class="item">
								<!-- active -->
								<c:choose>
									<c:when test="${empty bestImg.productImgPath}">
										<img src="/resources/ImgEx.png" class="img-responsive"
											style="height: 400px; width: 1200px;"
											alt="${bestImg.productName}">
									</c:when>
									<c:otherwise>
										<img src="/displayFile?fileName=${bestImg.productImgPath}" class="img-responsive"
											style="height: 400px; width: 1200px;"
											alt="${bestImg.productName}">
									</c:otherwise>
								</c:choose>
								<div class="carousel-caption">
									<h3>${bestImg.productName}</h3>
									<br>
								</div>

							</div>
						</c:forEach>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>


				<!-- 베스트 옷 6개까지  -->
				<div class="row bestList6">
					<h3>< Best 6 ></h3>
					<c:forEach begin="0" end="5" items="${bestList6}" var="bestList6">
						<div class="col-xs-6 col-sm-4">
							<div class="panel panel-default">
								<div class="panel-body text-center">
									<a href="/main/detail?productNo=${bestList6.productNo}"> 
									<c:choose>
									<c:when test="${bestList6.productImgPath=='이미지없음'}">
									<img
										src="/resources/ImgEx.png" class="img-responsive"
										style="height: 340px;" alt="Image">
									</c:when>
									<c:otherwise>
									 <img
										src="/displayFile?fileName=${bestList6.productImgPath}" class="img-responsive" style="height: 340px;" alt="Image">
									</c:otherwise>
									</c:choose>
									<br>
										${bestList6.productName} <br> 가격 :
										${bestList6.productPrice} 원<br> 재고 수량 : ${bestList6.rest}
										개<br> 판매 갯수 : ${bestList6.soldSum} 개<br> <!-- <div class="panel-footer text-center">  -->
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 신규 템 3개까지  -->
				<div class="row newList6">
					<h3>< New 3 ></h3>
					<c:forEach begin="0" end="2" items="${newList6}" var="newList6">
						<div class="col-xs-6 col-sm-4">
							<div class="panel panel-default">
								<div class="panel-heading">상품번호 ${newList6.productNo}</div>
								<div class="panel-body text-center">
									<a href="/main/detail?productNo=${newList6.productNo}"> 
									
									
									<c:choose>
									<c:when test="${newList6.productImgPath=='이미지없음'}">
									<img
										src="/resources/ImgEx.png" class="img-responsive"
										style="height: 340px;" alt="Image">
									</c:when>
									<c:otherwise>
									 <img
										src="/displayFile?fileName=${newList6.productImgPath}" class="img-responsive" style="height: 340px;" alt="Image">
									</c:otherwise>
									</c:choose>
									<br>
										${newList6.productName} <br> 가격 :
										${newList6.productPrice} 원<br> 재고 수량 : ${newList6.rest} 개<br>
										판매 갯수 : ${newList6.soldSum} 개<br>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<br>
				<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>
				<br> <br>
				<br>
				<br>
				<br>
				<br>

				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var result = "${msg}";
	if (result == "INSERT_SUCCESS") {
		alert("회원가입 성공 |n 로그인합시다");
		result ="";
	} else if (result == "UPDATE_SUCCESS") {
		alert("수정 성공");
		result ="";
	}
	</script>
</body>
</html>