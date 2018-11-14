<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>글쓰기</title>
</head>
<body>
	<div class="container"
		style="background-color: #ffffff; margin-top: 50px; border-radius: 5px;">
		<!-- 폼 시작 -->
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="well">
					<form class="form-horizontal" action="/sboard/update" method="post">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="perPage" value="${perPage}">				
						<input name="keyword" type="hidden"  value="${cri.keyword}" >
						<input name="searchType" type="hidden" value="${cri.searchType}" >
	
						<fieldset>
							<div class="form-group">
								<label class="col-lg-4 control-label"><h2>수정하기</h2></label>
							</div>
							<div class="form-group">
								<label for="bno" class="col-lg-2 control-label">글번호</label>
								<div class="col-lg-10">
									<input type="number" readonly="readonly" class="form-control" name="bno" value="${vo.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" name="title" value="${vo.title }">
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-lg-2 control-label">쓰니</label>
								<div class="col-lg-10">
									<input type="text" readonly="readonly" class="form-control" name="writer" value="${vo.writer}">
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="content" rows="10"
										id="textArea">${vo.content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-primary">저장</button>
								</div>
							</div>
						</fieldset>
					</form>

				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() {
				//당긴는게  
				//나가는게핸들러어.??
				$("form").submit();
			});
		});
		
	</script>
</body>
</html>