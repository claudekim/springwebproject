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
  <style type="text/css">
	  iframe {
		width: 0px;
		height: 0px;
		border:0px;
	}
  </style>
  <title>nojson1</title>
</head>
<body>
<form target="zeroFrame" id ="form1" action="nojson"  enctype="multipart/form-data" method="post">
 <input type="file" name="file">
 <br><input type="submit">
</form>

<iframe name="zeroFrame"></iframe>

<script type="text/javascript">
	function addFilePath(msg) {
		alert(msg);
		$("#form1").reset();
	}
</script>
</body>
</html>