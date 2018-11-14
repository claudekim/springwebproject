<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>리스트</title>
</head>
<body>
	<div class="container"
		style="background-color: #ffffff; margin: 50px; border-radius: 5px;">
		<div class="row">
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
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="text-align: center">${list.bno}</td>
								<td style="padding-left: 10px"><a
									href="/board/read?bno=${list.bno}">${list.title}</a></td>
								<td style="text-align: center">${list.regdate}</td>
								<td style="text-align: center">${list.writer}</td>
								<td style="text-align: center">${list.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<a href="/board/create"><button class="btn btn-primary">글쓰기</button></a><br>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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