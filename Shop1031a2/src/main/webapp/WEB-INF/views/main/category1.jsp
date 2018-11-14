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
				<!-- 소분류 선택 네비  -->
				<div class="row">
					<div class="col-xs-12 col-sm-offset-2 col-sm-8 text-center" >
						<ul class="category2">
							<c:forEach items="${category2Of1}" var="category2Of1">
								<li  class="active" style="width: 80px">
								<a href="/main/category2?category1=${category2Of1.category1}&category2=${category2Of1.category2}">
										${category2Of1.category2}
										</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 상품 진열 시작  -->
				<c:choose>
				
				<c:when test="${empty clickCategory1}">
					<div class="row bestCategory1List3">
					<br><br><br><br><br><br>
					<p style="text-align: center;">상품이 존재하지 않습니다.</p>
					<br><br><br>
					<br><br><br><br><br>
					<br><br><br><br><br>
					<br><br><br><br><br>
					<br><br><br><br><br>
					</div>
				</c:when>
				
				
				<c:otherwise>
				<!-- 대분류 베스트 3  -->
				<div class="row bestList">
					<h4>< 인기템 ></h4>
						<c:forEach begin="0" end="2"  items="${bestCategory1List}" var="bestCategory1List">
						<div class="col-xs-6 col-sm-4">
							<div class="panel panel-default">
								<div class="panel-body text-center">
								<a href="/main/detail?productNo=${bestCategory1List.productNo}">
									<c:choose>
									<c:when test="${bestCategory1List.productImgPath=='이미지없음'}">
									<img src="/resources/ImgEx.png" class="img-responsive"
										style="height: 340px;"alt="${bestCategory1List.productName} ">
									</c:when>
									<c:otherwise>
									 <img
										src="/displayFile?fileName=${bestCategory1List.productImgPath}" 
										class="img-responsive" style="height: 340px;" alt=${bestCategory1List.productName} >
									</c:otherwise>
									</c:choose>
									
									<br>
									${bestCategory1List.productName} <br> 가격 :
									${bestCategory1List.productPrice} 원<br> 재고 수량 : ${bestCategory1List.rest}
									개<br> 판매 갯수 : ${bestCategory1List.soldSum} 개<br>
									<!-- <div class="panel-footer text-center">  -->
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<!-- 대분류 신규순  -->
				<div class="row newList">
					<c:forEach items="${clickCategory1}" var="clickCategory1">
						<div class="col-xs-4 col-sm-3">
							<div class="panel panel-default" >
								<div class="panel-body text-center">
								<a href="/main/detail?productNo=${clickCategory1.productNo}">
									<c:choose>
									<c:when test="${clickCategory1.productImgPath=='이미지없음'}">
									<img
										src="/resources/ImgEx.png" class="img-responsive"
										style="height: 240px;" alt="${clickCategory1.productName}">
									</c:when>
									<c:otherwise>
									 <img
										src="/displayFile?fileName=${clickCategory1.productImgPath}" 
										class="img-responsive" 	style="height: 240px;" alt="${clickCategory1.productName}">
									</c:otherwise>
									</c:choose>
										<br>
									${clickCategory1.productName} <br>
									가격 : ${clickCategory1.productPrice} 원<br> 
									재고 수량 : ${clickCategory1.rest} 개<br> 
									판매 갯수 : ${clickCategory1.soldSum} 개<br></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</c:otherwise>
				</c:choose>
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
	</script>
</body>
</html>