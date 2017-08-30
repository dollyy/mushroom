<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>���ﳵ</title>
	<link rel="stylesheet" href="../css/cart.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../js/cart.js" charset="utf-8"></script>
</head>
<body>
	<!-- ͷ������ -->
	<%@include file="nav.jsp" %>
	<!-- ��½ -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- ע�� -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	
	<!-- logo,������ -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	
	<!-- ���ﳵ -->
	<div class="carthead">СĢ������ʳ�嵥</div>
	
	<c:if test="${empty sessionScope.user }">
		<c:if test="${empty cookie.user.value }">
			<div class="nocart">
				<div class="notips">��_��&nbsp;&nbsp;��½�Ժ��ٿ����ɡ���</div>
				<div class="nolog"></div>
			</div>
		</c:if>
		<c:if test="${!empty cookie.user.value }">
			<c:if test="${empty sessionScope.cart }">
				<div class="nocart">
					<div class="notips">���Ĺ��ﳵ�ǿյģ��ٹ��ɡ���</div>
					<div class="nopic"></div>
				</div>
			</c:if>
			<c:if test="${!empty sessionScope.cart }">
				<div class="cartmenu">
				<div class="selectall"><input type="checkbox" id="allsel">ȫѡ</div>
				<div class="promsg">��Ʒ��Ϣ</div>
				<div class="proprice">����</div>
				<div class="pronum">����</div>
				<div class="prosum">���</div>
				<div class="prodel">ɾ��</div>
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
									<span class="priceicon">��</span>
									<div class="cartprice">${p.price }</div>
									<input type="number" value='${p.num }' min="1" class="nums">
									<div class="cartsum">${p.price*p.num }</div>
									<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="showall">
						<div class="alldel"><input type="checkbox" id="alldel">ȫѡ&nbsp;&nbsp;&nbsp;&nbsp;ɾ��</div>
						<div class="allsum">�ϼƣ���<span class="sumprice">0</span>
						<input class="btn" type="submit" value="ȥ����"></div>
					</div>
					</form>
				</div>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${!empty sessionScope.user }">
		<c:if test="${empty sessionScope.cart }">
			<div class="nocart">
				<div class="notips">���Ĺ��ﳵ�ǿյģ��ٹ��ɡ���</div>
				<div class="nopic"></div>
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.cart }">
			<div class="cartmenu">
			<div class="selectall"><input type="checkbox" id="allsel">ȫѡ</div>
			<div class="promsg">��Ʒ��Ϣ</div>
			<div class="proprice">����</div>
			<div class="pronum">����</div>
			<div class="prosum">���</div>
			<div class="prodel">ɾ��</div>
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
								<span class="priceicon">��</span>
								<div class="cartprice">${p.price }</div>
								<input type="number" value='${p.num }' min="1" class="nums">
								<div class="cartsum">${p.price*p.num }</div>
								<a class="cartdel" href="../modifycart?name=${p.proname }"></a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="showall">
					<div class="alldel"><input type="checkbox" id="alldel">ȫѡ&nbsp;&nbsp;&nbsp;&nbsp;ɾ��</div>
					<div class="allsum">�ϼƣ���<span class="sumprice">0</span>
					<input class="btn" type="submit" value="ȥ����"></div>
				</div>
				</form>
			</div>
		</c:if>
	</c:if>
</body>
</html>