<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.container {
		margin-top: 100px;
		margin-bottom: 100px;
		margin-left: 50px;
		margin-right: 50px;
		padding-top: 50px;
		padding: 50px;
		border: Dashed 3px #ededed;
		border-radius: 8px;
	}
	
	body {
		background-color: #ededed;
	}
</style>
	<title>리스트크리테리아</title>
</head>
<body>
	<div class="container"
		style="background-color: #ffffff; margin: auto; margin-top: 80px ">

		<!-- 글쓰기버튼 -->
		<div class="row">
		
		
		
		<c:if test="${not empty login.mid }">
			<div class="col-sm-7 col-lg-7 ">
			
			<h3>${login.mid } 님 하이요 ㅋㅋ</h3>
			</div>
			</c:if>
			
			
			
			<div class="col-sm-offset-7 col-sm-5  pull-right">
			<c:choose>
					<c:when test="${not empty login}">
						 <a href="/user/logout">
							<button class="btn btn-success  pull-right"> 로그아웃
							</button>
						</a>
					<a href="/board/create${pm.makeQuery(pm.cri.page)}">
							<button class="btn btn-primary  pull-right">
								<span class="glyphicon glyphicon-pencil"></span> 글쓰기
							</button>
						</a>
					</c:when>
					<c:otherwise>
					<a href="/user/login">
						<button class="btn btn-success  pull-right "  >로그인</button></a>
						</c:otherwise>
				</c:choose>
			
			
				
			</div>		
		</div>
		
		<!-- 테이블시작 -->
		<div class="row">
			<div class="col-sm-12 col-lg-12 ">
			
				<table class="table table-striped table-hover">
					<thead>
						<tr style="">
							<th style="width: 60px; text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="width: 190px; text-align: center;">쓴날</th>
							<th style="width: 80px; text-align: center;">쓰니</th>
							<th style="width: 60px; text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="text-align: center">${list.bno}</td>
								<td style="padding-left: 10px">
								<a href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${list.bno}"  class ="goRead">
								${list.title}</a>
								</td>
								<td style="text-align: center">${list.regdate}</td>
								<td style="text-align: center">${list.writer}</td>
								<td style="text-align: center">${list.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 검색하기 -->
		<div class="row">
			<div class="col-sm-offset-7 col-sm-5 input-group">
				<span class=" input-group-addon"> <select id="searchType"
					name="searchType">
						<option disabled>검색기준</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select>
				</span> <span><input class="form-control input-group" id="keyword"
					name="keyword"> </span> <span class="input-group-btn">
					<button id="searchBtn" class="btn btn-success">검색</button>
				</span>
			</div>
			<!-- 검색끝 -->
		</div>

		<!-- 페이징 처리 시작 -->
		<div class="row text-center">
			<ul class="pagination pagination-sm">
				<c:if test="${pm.cri.page == 1 }">
					<li><span>◀</span></li>
				</c:if>
				<c:if test="${pm.cri.page > 1 }">
					<li><a href="listcriteria${pm.makeQuery(pm.cri.page-1)}">◀</a></li>
				</c:if>
				<c:forEach begin="${pm.beginPageNum}" end="${pm.stopPageNum}"
					var="idx">
					<c:if test="${pm.cri.page == idx}">
						<li class="active"><span> <span aria-hidden="true">${idx}</span></span></li>
					</c:if>
					<c:if test="${pm.cri.page != idx}">
						<li><a href="listcriteria${pm.makeQuery(idx)}">${idx}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPageNum }">
					<li><a href= )}">▶</a></li>
				</c:if>
				<c:if test="${pm.cri.page==pm.totalPageNum}">
					<li class="disabled"><span> <span aria-hidden="true">▶</span></span></li>
				</c:if>
			</ul>
		</div>
		<!-- 페이징 처리 끝 -->
		
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchBtn").click(function() {
				var searchType = $("#searchType option:selected").val();
				var keyword = $("#keyword").val();
				var uri = "/sboard/listcriteria${pm.makeQuery(1)}&searchType="+ searchType+ "&keyword=" + keyword;
				uri = encodeURI(uri);
				self.location = uri;
			});
		});

		var result = "${msg}";

		  $(".goRead").click(function() {
			  if('${login.mid}'==null || '${login.mid}'==''){
				  alert("goRead");
					if (confirm("로그인이 필요합니다 로그인하시겠습니까?")) {
						alert("로그인하러가자");
					} else {
						alert("이동안 되게 하고싶어....ㅠ");
					}
			}else{
				 alert("유저 아이디 = "+'${login.mid}');
			}
		});

		if (result == "INSERT_SUCCESS") {
			alert("입력 성공");
		} else if (result == "UPDATE_SUCCESS") {
			alert("수정 성공");
		} else if (result == "DELETE_SUCCESS") {
			alert("삭제 성공");
		}
	</script>
</body>
</html>