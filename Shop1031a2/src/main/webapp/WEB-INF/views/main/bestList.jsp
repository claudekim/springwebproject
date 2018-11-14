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
<link rel="stylesheet"  href="/resources/css/main.css" />
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
				<jsp:include page="../main/header.jsp"/>


				<!-- 베스트  -->
				<div class="row bestList">
					<h4>< 인기템 ></h4>
					<c:forEach items="${list}" var="bestImg">
						<div class="col-xs-6 col-sm-4" >
							<div class="panel panel-default">
								<div class="panel-body text-center">
								<a href="/main/detail?productNo=${bestImg.productNo}"> 
									<c:choose>
									<c:when test="${bestImg.productImgPath=='이미지없음'}">
									<img
										src="/resources/ImgEx.png" class="img-responsive"
										style="height: 340px;" alt="Image">
									</c:when>
									<c:otherwise>
									 <img
										src="/displayFile?fileName=${bestImg.productImgPath}" class="img-responsive"
										style="height: 340px;" alt="Image">
									</c:otherwise>
									</c:choose>
									<br>
									${bestImg.productName} <br> 가격 : ${bestImg.productPrice}
									원<br> 재고 수량 : ${bestList.rest} 개<br> 판매 갯수 :
									${bestImg.soldSum} 개<br>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 페이징 처리 시작 -->
				<div class="row text-center">
					<ul class="pagination">
						<c:if test="${BestPm.cri.page > 1}">
							<li><a href="/main/bestList${BestPm.makeBestListQuery(BestPm.cri.page - 1)}">&lt;</a></li>
						</c:if>
						<c:forEach begin="${BestPm.beginPageNum}" end="${BestPm.stopPageNum}" var="bestList" >
							<li ${bestList == BestPm.cri.page ? "class='active'" : ""}>
								<a href="/main/bestList${BestPm.makeBestListQuery(bestList)}">${bestList}</a>
							</li>
						</c:forEach>
						
						<li ${BestPm.cri.page >= BestPm.totalPage ? "class = 'disable'" : ""}>
							<a href="/main/bestList${BestPm.makeBestListQuery(BestPm.cri.page - 1)}">&gt;</a>
						</li>
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->

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