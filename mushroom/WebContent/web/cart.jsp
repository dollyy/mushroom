<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>¹ºÎï³µ</title>
	<link rel="stylesheet" href="../css/cart.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../js/cart.js" charset="utf-8"></script>
</head>
<body>
	<!-- Í·²¿µ¼º½ -->
	<%@include file="nav.jsp" %>
	<!-- µÇÂ½ -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- ×¢²á -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	
	<!-- logo,ËÑË÷¿ò -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	
	<!-- ¹ºÎï³µ -->
	<div class="carthead">Ð¡Ä¢¹½µÄÁãÊ³Çåµ¥</div>
	
	<c:if test="${empty sessionScope.user }">
		<c:if test="${empty cookie.user.value }">
			<div class="nocart">
				<div class="notips">¡û_¡û&nbsp;&nbsp;µÇÂ½ÒÔºóÔÙ¿´¿´°É¡­¡­</div>
				<div class="nolog"></div>
			</div>
		</c:if>
		<c:if test="${!empty cookie.user.value }">
			<c:if test="${empty sessionScope.cart }">
				<div class="nocart">
					<div class="notips">ÄúµÄ¹ºÎï³µÊÇ¿ÕµÄ£¬ÔÙ¹ä¹ä°É¡­¡­</div>
					<div class="nopic"></div>
				</div>
			</c:if>
			<c:if test="${!empty sessionScope.cart }">
				<div class="cartmenu">
				<div class="selectall"><input type="checkbox" id="allsel">È«Ñ¡</div>
				<div class="promsg">ÉÌÆ·ÐÅÏ¢</div>
				<div class="proprice">µ¥¼Û</div>
				<div class="pronum">ÊýÁ¿</div>
				<div class="prosum">½ð¶î</div>
				<div class="prodel">É¾³ý</div>
				</div>
				<div class="f">
					<form name="order" method="post">
					<ul>
						<c:forEach var="p" items="${sessionScope.cart }">
							<li>
								<input type="checkbox" class="check" name="check" value='${p.proname }'>
								<div class="cartpic"></div>
								<div class="cartword">
									<div class="cartdes">${p.proname }</div>
									<span class="priceicon">£¤</span>
									<div class="cartprice">${p.price }</div>
									<input type="number" value='${p.num }' min="1" class="nums">
									<div class="cartsum">${p.price*p.num }</div>
									<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="showall">
						<div class="alldel"><input type="checkbox" id="alldel">È«Ñ¡&nbsp;&nbsp;&nbsp;&nbsp;É¾³ý</div>
						<div class="allsum">ºÏ¼Æ£º£¤<span class="sumprice">0</span>
						<input class="btn" type="submit" value="È¥½áÕË"></div>
					</div>
					</form>
				</div>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${!empty sessionScope.user }">
		<c:if test="${empty sessionScope.cart }">
			<div class="nocart">
				<div class="notips">ÄúµÄ¹ºÎï³µÊÇ¿ÕµÄ£¬ÔÙ¹ä¹ä°É¡­¡­</div>
				<div class="nopic"></div>
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.cart }">
			<div class="cartmenu">
			<div class="selectall"><input type="checkbox" id="allsel">È«Ñ¡</div>
			<div class="promsg">ÉÌÆ·ÐÅÏ¢</div>
			<div class="proprice">µ¥¼Û</div>
			<div class="pronum">ÊýÁ¿</div>
			<div class="prosum">½ð¶î</div>
			<div class="prodel">É¾³ý</div>
			</div>
			<div class="f">
				<form name="order" method="post">
				<ul id="total">
					<c:forEach var="p" items="${sessionScope.cart }">
						<li>
							<input type="checkbox" class="check" name="check" value='${p.proname }'>
							<div class="cartpic"><img style="width: 70px;height: 70px" src='${p.imgs }'></div>
							<div class="cartword">
								<div class="cartdes">${p.proname }</div>
								<span class="priceicon">£¤</span>
								<div class="cartprice">${p.price }</div>
								<input type="number" value='${p.num }' min="1" class="nums">
								<div class="cartsum">${p.price*p.num }</div>
								<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="showall">
					<div class="alldel"><input type="checkbox" id="alldel">È«Ñ¡&nbsp;&nbsp;&nbsp;&nbsp;É¾³ý</div>
					<div class="allsum">ºÏ¼Æ£º£¤<span class="sumprice">0</span>
					<input class="btn" type="submit" value="È¥½áÕË"></div>
				</div>
				</form>
			</div>
		</c:if>
	</c:if>
</body>
</html>