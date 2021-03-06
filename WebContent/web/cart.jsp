<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>购物车</title>
	<link rel="stylesheet" href="../css/cart.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../js/cart.js" charset="utf-8"></script>
</head>
<body>
	<!-- 头部导航 -->
	<%@include file="nav.jsp" %>
	<!-- 登陆 -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- 注册 -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	
	<!-- logo,搜索框 -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	
	<!-- 购物车 -->
	<div class="carthead">小蘑菇的零食清单</div>
	
	<c:if test="${empty sessionScope.user }">
		<c:if test="${empty cookie.user.value }">
			<div class="nocart">
				<div class="notips">←_←&nbsp;&nbsp;登陆以后再看看吧……</div>
				<div class="nolog"></div>
			</div>
		</c:if>
		<c:if test="${!empty cookie.user.value }">
			<c:if test="${empty sessionScope.cart }">
				<div class="nocart">
					<div class="notips">您的购物车是空的，再逛逛吧……</div>
					<div class="nopic"></div>
				</div>
			</c:if>
			<c:if test="${!empty sessionScope.cart }">
				<div class="cartmenu">
				<div class="selectall"><input type="checkbox" id="allsel">全选</div>
				<div class="promsg">商品信息</div>
				<div class="proprice">单价</div>
				<div class="pronum">数量</div>
				<div class="prosum">金额</div>
				<div class="prodel">删除</div>
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
									<span class="priceicon">￥</span>
									<div class="cartprice">${p.price }</div>
									<input type="number" value='${p.num }' min="1" class="nums">
									<div class="cartsum">${p.price*p.num }</div>
									<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="showall">
						<div class="alldel"><input type="checkbox" id="alldel">全选&nbsp;&nbsp;&nbsp;&nbsp;删除</div>
						<div class="allsum">合计：￥<span class="sumprice">0</span>
						<input class="btn" type="submit" value="去结账"></div>
					</div>
					</form>
				</div>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${!empty sessionScope.user }">
		<c:if test="${empty sessionScope.cart }">
			<div class="nocart">
				<div class="notips">您的购物车是空的，再逛逛吧……</div>
				<div class="nopic"></div>
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.cart }">
			<div class="cartmenu">
			<div class="selectall"><input type="checkbox" id="allsel">全选</div>
			<div class="promsg">商品信息</div>
			<div class="proprice">单价</div>
			<div class="pronum">数量</div>
			<div class="prosum">金额</div>
			<div class="prodel">删除</div>
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
								<span class="priceicon">￥</span>
								<div class="cartprice">${p.price }</div>
								<input type="number" value='${p.num }' min="1" class="nums">
								<div class="cartsum">${p.price*p.num }</div>
								<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="showall">
					<div class="alldel"><input type="checkbox" id="alldel">全选&nbsp;&nbsp;&nbsp;&nbsp;删除</div>
					<div class="allsum">合计：￥<span class="sumprice">0</span>
					<input class="btn" type="submit" value="去结账"></div>
				</div>
				</form>
			</div>
		</c:if>
	</c:if>
</body>
</html>