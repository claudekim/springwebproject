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
<title>서치리스트크리테리아</title>
</head>
<body>
	<div class="container"
		style="background-color: #ffffff; margin: auto; margin-top: 80px ">

		<div class="row">
			<!-- 쓰기,보기버튼그룹-->
			<div class="col-mg-3">
				<div class="btn-group" role="group">
					<a href="/board/create${pageMaker.makeQuery(pageMaker.cri.page)}"
						class="btn btn-primary"> <span
						class="glyphicon glyphicon-pencil"></span> 글쓰기
					</a> <a
						href="/board/listcriteria${pageMaker.makeQuery(pageMaker.cri.page)}"
						class="btn btn-primary"> <span
						class="glyphicon glyphicon-align-justify"></span> 목록보기
					</a>
				</div>
			</div><br>
			<!--버튼 끝-->

			<!-- <div class="col-xs-3 col-sm-2">
						<a href="/board/create${pageMaker.makeQuery(pageMaker.cri.page)}">
							<button class="btn btn-primary">
								<span class="glyphicon glyphicon-pencil"></span> 글쓰기
							</button>
					</div>
					<div class="col-xs-3 col-sm-2">
					</a> <a
						href="/board/listcriteria${pageMaker.makeQuery(pageMaker.cri.page)}">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-align-justify"></span> 목록보기
						</button>
					</a></div>-->

			<!-- 검색하기 -->
			<div class="col-mg-3 input-group">
				<span class=" input-group-addon"> 
				<select id="searchType" 
					name="searchType" >
						<option disabled>검색기준</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select>
				</span> 
				<span><input class="form-control input-group" id="keyword"
					name="keyword" >
				</span> 
				<span class="input-group-btn">
				<button id="searchBtn" class="btn btn-success">검색</button>
				</span>
			</div>
			<!-- 검색끝 -->
		</div>

		<div class="row">

			<!-- 테이블 시작 -->
			<div class="col-lg-12">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th style="width: 60px; text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="width: 190px; text-align: center;">쓴날</th>
							<th style="width: 80px; text-align: center;">쓰니</th>
							<th style="width: 60px; text-align: center;">조회수</th>
						</tr>
					</thead>
					<!-- 테이블 내용 -->
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="text-align: center">${list.bno}</td>
								<td style="padding-left: 10px"><a
									href="read${pageMaker.makeSearchQuery(pageMaker.cri.page)}&bno=${list.bno}">${list.title}</a></td>
								<td style="text-align: center">${list.regdate}</td>
								<td style="text-align: center">${list.writer}</td>
								<td style="text-align: center">${list.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 테이블 내용 끝-->

				<!-- 페이징 처리 시작 -->
				<div class="row text-center">
					<ul class="pagination">

						<!-- 페이지 ◀ -->
						<c:if test="${pageMaker.cri.page == 1 }">
							<li><span>&laquo</span></li>
						</c:if>
						<c:if test="${pageMaker.cri.page > 1 }">
							<li><a
								href="listcriteria${pageMaker.makeSearchQuery(pageMaker.cri.page-1)}">◀</a></li>
						</c:if>

						<!-- 페이지 숫자부분 -->
						<c:forEach begin="${pageMaker.beginPageNum}"
							end="${pageMaker.stopPageNum}" var="idx">
							<li ${pageMaker.cri.page == idx?  "class='active'":"" }><a
								href="/sboard/listcriteria${pageMaker.makeSearchQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<!-- 페이지 ▶ -->
						<c:if test="${pageMaker.cri.page<pageMaker.totalPageNum }">
							<li><a
								href="listcriteria${pageMaker.makeSearchQuery(pageMaker.cri.page+1)}">▶</a></li>
						</c:if>
						<c:if test="${pageMaker.cri.page==pageMaker.totalPageNum}">
							<li class="disabled"><span> <span aria-hidden="true">▶</span></span></li>
						</c:if>
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->

			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#searchBtn")
									.click(
											function() {

												var searchType = $(
														"#searchType option:selected")
														.val();
												var keyword = $("#keyword")
														.val();
												var uri = "/sboard/listcriteria${pageMaker.makeQuery(1)}&searchType="
														+ searchType
														+ "&keyword=" + keyword;
												uri = encodeURI(uri);
												self.location = uri;

											});
						});

		var result = "${msg}";

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