<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���ҵ�����Ʒ</title>
<link rel="stylesheet" href="../css/Tsearchinfo.css">
<link rel="stylesheet" href="../css/search.css">
</head>
<body>
<!-- logo,������������ -->
	<div>
		<div class="logo"></div>
		<div class="nav">
			<ul>
				<li>��ҳ</li>
				<li>��ҳ</li>
				<li>��ҳ</li>
				<li>��ҳ</li>
			</ul>
		</div>
		<div class="ui-widget">
			<form action="../search" method="post">
				<input id="tags" onkeyup="ajaxSearch()" name="search" class="search1">
				<input type="submit" value="����" class="submit1">
				<div id="result_display" style="width:200px;visibility: hidden"></div>
			</form>
		</div>
	</div>
	
	<!-- �������ҳ����Ľ�� -->
	
	<c:if test="${empty sessionScope.searchinfo }">
		<div class="nocart">
			<div class="notips">û���ҵ�����������Ʒ���ٹ��ɡ���</div>
			<div class="nopic"></div>
		</div>
	</c:if>
	
	<c:if test="${!empty sessionScope.searchinfo }">
		<div class="pro">
		<div class="introduct">������Ϊ����������СĢ��ʳƷ</div>
			<c:forEach var="p" items="${sessionScope.searchinfo }">
				<div class="pros">
					<div class="pic"><img src="${p.g_img }" class="picimg"></div>
					<div class="msgs">
						<a href="#">${p.g_name }</a>
						<span class="icon">��</span>
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