<%@page import="msg.Tproducts"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productInformation</title>
<link rel="stylesheet" href="../css/Tproinfo.css">
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/Tproinfo.js"></script>
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
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	<div class="tips">
		在购物车等你啦!
	</div>
	<%
		Tproducts p = (Tproducts)session.getAttribute("proinfo");
	%>
	<article>
		<div class="imgbg"><img class="img" src="<%=p.getG_img()%>"></div>
		<div class="intruction">零食详情介绍</div>
		<div class="name">名称：</div>
		<div class="nm"><%=p.getG_name() %></div>
		<div class="price">价格: </div>
		<div class="money2">￥</div>
		<div class="money"><%=p.getG_price() %></div>
		<div class="sale">销量：</div>
		<div class="sales"><%=p.getG_sales() %>件</div>
		<input type="number" min="1" value="1" class="num">
		<div class="addcart"></div>
		
		<div class="lists">
			<div class="m_like">猜您喜欢：</div>
			<c:forEach var="p" items="${sessionScope.prodlist }">
				<div class="m_box">
					<span>${p.g_name }</span><br> 
					<img src="${p.g_img }" class="m_pic"><br>
					<span>销量：${p.g_sales }</span>
					<span>价格：${p.g_price }</span>				
				</div>
			</c:forEach>
		</div>
	</article>
</body>
</html>