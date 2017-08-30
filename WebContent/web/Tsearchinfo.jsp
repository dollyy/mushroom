<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找到的商品</title>
<link rel="stylesheet" href="../css/Tsearchinfo.css">
<link rel="stylesheet" href="../css/search.css">
</head>
<body>
<!-- logo,导航，搜索框 -->
	<div>
		<div class="logo"></div>
		<div class="nav">
			<ul>
				<li>首页</li>
				<li>首页</li>
				<li>首页</li>
				<li>首页</li>
			</ul>
		</div>
		<div class="ui-widget">
			<form action="../search" method="post">
				<input id="tags" onkeyup="ajaxSearch()" name="search" class="search1">
				<input type="submit" value="搜索" class="submit1">
				<div id="result_display" style="width:200px;visibility: hidden"></div>
			</form>
		</div>
	</div>
	
	<!-- 遍历查找出来的结果 -->
	
	<c:if test="${empty sessionScope.searchinfo }">
		<div class="nocart">
			<div class="notips">没有找到您搜索的商品，再逛逛吧……</div>
			<div class="nopic"></div>
		</div>
	</c:if>
	
	<c:if test="${!empty sessionScope.searchinfo }">
		<div class="pro">
		<div class="introduct">以下是为您搜索到的小蘑菇食品</div>
			<c:forEach var="p" items="${sessionScope.searchinfo }">
				<div class="pros">
					<div class="pic"><img src="${p.g_img }" class="picimg"></div>
					<div class="msgs">
						<a href="#">${p.g_name }</a>
						<span class="icon">￥</span>
						<span class="price">${p.g_price }</span>
						<input class="num" type="number" min="1" value="1">
					<div class="addcart"></div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</body>
<script src="../js/search.js"></script>
</html>