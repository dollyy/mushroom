<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../css/nav.css">
	<script type="text/javascript" src="../js/nav.js"></script>
	<title>导航</title>
</head>
<body>
	<div id="bg" class="bg no"></div>
	<!-- 头部导航 -->
	<div class="head">
		<div id="s" class="switcher">
			<a onclick="goLog()">登陆</a>&nbsp;&nbsp;&nbsp;
			<a onclick="goReg()">注册</a>
		</div>
		<div id="s2" class="switcher2">
			欢迎登陆，<span id="sessionUser">${sessionScope.user }</span>
			<span id="cookieUser">${cookie.user.value }</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="exit"><a href="../login?exit=byebye">退出</a></span>
		</div>
		<div class="msg">
			<a onclick="my()">我的</a>&nbsp;&nbsp;&nbsp;
			<a href="cart.jsp">购物车</a>&nbsp;&nbsp;&nbsp;
			<a >信息反馈</a>&nbsp;&nbsp;&nbsp;
			<span class="fen" onmouseover="disfen()" onmouseout="hidfen()">关注我们</span>
			<span id="fencode" class="fencode no"></span>
		</div>
	</div>
</body>
</html>