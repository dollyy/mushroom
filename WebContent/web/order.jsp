<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>¶©µ¥</title>
	<link rel="stylesheet" href="../css/order.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../js/order.js" charset="utf-8"></script>
</head>
<body>
	<!-- Í·²¿µ¼º½ -->
	<%@include file="nav.jsp" %>
	<!-- µÇÂ½ -->
	<div id="log" class="log_bg no"><%@include file="login.jsp" %></div>
	<!-- ×¢²á -->
	<div id="reg" class="reg_bg no"><%@include file="register.jsp" %></div>
	<!-- logo,ËÑË÷¿ò -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	<!-- ÏÂµ¥ -->
	<!-- <div class="mushroom"></div> -->
	<!-- Ñ¡ÔñÊÕ»õµØÖ· -->
	<div class="address">
		<div class="a_title">
			È·ÈÏÊÕ»õµØÖ·
			<!-- <span class="a_more">ÏÔÊ¾¸ü¶à</span> -->
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
	<!-- È·ÈÏÉÌÆ· -->
	<div class="sure">
		<div class="s_title">È·ÈÏ¶©µ¥ÐÅÏ¢</div>
		<ol>
			<li class="s_s">ÉÌÆ·ÐÅÏ¢</li>
			<li class="s_s">µ¥¼Û</li>
			<li class="s_s">ÊýÁ¿</li>
			<li class="s_s">Ð¡¼Æ</li>
		</ol>
		<div class="s_pros">
			<c:forEach var="p" items="${sessionScope.order }">
				<div class="s_pro">
					<div class="s_pic"><img style="width: 70px;height: 70px" src='${p.imgs }'></div>
					<div class="s_msg">
						<div class="s_des">${p.proname }</div>
						<div class="s_priicon">£¤</div>
						<div class="s_pri">${p.price }</div>
						<div class="s_num">${p.num }</div>
						<div class="s_sum">${p.price*p.num }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- ¸¶¿î -->
		<form class="pay" method="post" action="../pay">
			<div class="p_sum">Êµ¸¶¿î£º£¤<span id="p_sumprice" style="font-size: 25px;">${sessionScope.sump }</span></div>
			<div class="p_add">¼ÄËÍÖÁ£º<input id="p_add" name="add" type="text" value="½­ËÕÊ¡ÄÏ¾©ÊÐ´¾»¯½ÖµÀºë¾°´óµÀ3601ºÅ"></div>
			<div class="p_phone">ÊÕ»õÈË£º<input id="p_name" name="name" type="text" value="mushroom"><input id="p_phone" name="phone" type="text" value="18360868799"></div>
			<input type="submit" class="sub" value="Ìá½»¶©µ¥">
		</form>
	</div>
	<!-- µ×²¿ÐÅÏ¢ -->
	<div class="foot">
		
	</div>
</body>
</html>