<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


				<header class="text-right">
					<ul class="text-left">
					
					
						<!-- 로그인 안했을때 -->
						<c:if test="${empty login.id}">
						<li class="menubar"><a href="/user/login"> 로그인</a></li>
						<li class="menubar"><a href="/user/join"> 회원가입</a>
							<ul >
								<li style="border: dotted 1px #ececec; width: 60px;">
								▲Join <br>
								+1000P
								</li>
							</ul></li>
						</c:if>
						<c:if test="${!empty login.id}">
						<!-- 로그인 했을 때 -->
						<li class="menubar"><a href="/main/cartList?id=aaa"><span
								class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
						<li class="menubar"><a href="/user/myPage"><span
								class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
						<c:if test="${login.grade=='ADMIN' }">
						<li class="menubar"><a href="/product/create"><span
								class="glyphicon glyphicon-user"></span> 상품등록</a></li></c:if>
						
						<li class="menubar"><a href="/user/logout"> 로그아웃/아직x</a></li>
						</c:if>
					</ul>
				</header>

				<!-- 메인이미지-->
				<div class="jumbotron">
					<div class="container text-center">
						<a href="/main/index"> <img style="height: 50px;" alt="메인화면"
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/BlackStar.PNG/250px-BlackStar.PNG">
						</a>
					</div>
				</div>

				<!-- 카테고리 네비게이션-->
				<nav class="navbar  category">
					<div class="container-fluid" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="active"><a href="/main/bestList">베스트</a></li>
							<li><a href="/main/category1?category1=상의">상의</a>
								<ul>
									<li><a href="/main/category2?category1=상의&category2=티셔츠">티셔츠</a></li>
									<li><a href="/main/category2?category1=상의&category2=니트">니트</a></li>
									<li><a href="/main/category2?category1=상의&category2=아우터">아우터</a></li>
								</ul></li>
							<li><a href="/main/category1?category1=바지">바지</a>
								<ul>
									<li><a href="/main/category2?category1=상의&category2=청바지">청바지</a></li>
									<li><a href="/main/category2?category1=상의&category2=면바지">면바지</a></li>
									<li><a href="/main/category2?category1=상의&category2=반바지">반바지</a></li>
								</ul></li>
							<li><a href="/main/category1?category1=치마">치마</a>
								<ul>
									<li><a href="/main/category2?category1=치마&category2=원피스">원피스</a></li>
									<li><a href="/main/category2?category1=치마&category2=스커트">스커트</a></li>
								</ul></li>
							<li><a href="/main/category1?category1=잡화">잡화</a>
								<ul style="z-index: 1000;">
									<li><a href="/main/category2?category1=잡화&category2=악세사리">악세사리</a></li>
									<li><a href="/main/category2?category1=잡화&category2=신발">신발</a></li>
									<li><a href="/main/category2?category1=잡화&category2=가방">가방</a></li>
									<li><a href="/main/category2?category1=잡화&category2=시계">시계</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>


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