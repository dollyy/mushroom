<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>支付成功</title>
<link rel="stylesheet" href="../css/paysuccess.css">
</head>
<body>
	<!-- 头部导航 -->
	<%@include file="nav.jsp" %>
	<!-- 登陆 -->
	<div id="log" class="log_bg no"><%@include file="login.jsp" %></div>
	<!-- 注册 -->
	<div id="reg" class="reg_bg no"><%@include file="register.jsp" %></div>
	<!-- logo,搜索框 -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
	</div>
	<div class="s">
		<img src="../imgs/xiaolian.png">
		支付成功，正在为您打包中……
	</div>
</body>
</html>