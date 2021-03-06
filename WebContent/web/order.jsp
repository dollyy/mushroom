<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>订单</title>
	<link rel="stylesheet" href="../css/order.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../js/order.js" charset="utf-8"></script>
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
	<!-- 下单 -->
	<!-- <div class="mushroom"></div> -->
	<!-- 选择收货地址 -->
	<div class="address">
		<div class="a_title">
			确认收货地址
			<!-- <span class="a_more">显示更多</span> -->
		</div>
		<ul class="a_adds">
		<c:forEach var="a" items="${sessionScope.add }">
			<li id="aa1" class="a_add a_select">
				<div class="a_uname">${a.recname  }</div>
				<div class="a_uphone">${a.rectel  }</div>
				<div class="a_uadd">${a.add  }</div>
			</li>
		</c:forEach>
		</ul>
	</div>
	<!-- 确认商品 -->
	<div class="sure">
		<div class="s_title">确认订单信息</div>
		<ol>
			<li class="s_s">商品信息</li>
			<li class="s_s">单价</li>
			<li class="s_s">数量</li>
			<li class="s_s">小计</li>
		</ol>
		<div class="s_pros">
			<c:forEach var="p" items="${sessionScope.order }">
				<div class="s_pro">
					<div class="s_pic"><img style="width: 70px;height: 70px" src='${p.imgs }'></div>
					<div class="s_msg">
						<div class="s_des">${p.proname }</div>
						<div class="s_priicon">￥</div>
						<div class="s_pri">${p.price }</div>
						<div class="s_num">${p.num }</div>
						<div class="s_sum">${p.price*p.num }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 付款 -->
		<form class="pay" method="post" action="../pay">
			<div class="p_sum">实付款：￥<span id="p_sumprice" style="font-size: 25px;">${sessionScope.sump }</span></div>
			<div class="p_add">寄送至：<input id="p_add" name="add" type="text" value="江苏省南京市淳化街道弘景大道3601号"></div>
			<div class="p_phone">收货人：<input id="p_name" name="name" type="text" value="mushroom"><input id="p_phone" name="phone" type="text" value="18360868799"></div>
			<input type="submit" class="sub" value="提交订单">
		</form>
	</div>
	<!-- 底部信息 -->
	<div class="foot">
		
	</div>
</body>
</html>