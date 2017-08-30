<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<link rel="stylesheet" href="../css/search.css">
<script src="../js/search.js"></script>
</head>
<body>
	<div class="ui-widget">
		<form action="../search" method="post">
			<input id="tags" onkeyup="ajaxSearch()" name="search" class="search1" placeholder="ÇëÊäÈëÄúÒªËÑË÷µÄÄÚÈİ">
			<input type="submit" value="ËÑË÷" class="submit1">
			<div id="result_display" style="width:500px;visibility: hidden"></div>
		</form>
	</div>
</body>
</html>