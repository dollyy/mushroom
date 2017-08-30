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
	
	<!-- ͷ������ -->
	<%@include file="nav.jsp" %>
	
	<!-- ��½ -->
	<div id="log" class="log_bg no"><%@include file="login.jsp" %></div>
	
	<!-- ע�� -->
	<div id="reg" class="reg_bg no"><%@include file="register.jsp" %></div>
	
	<!-- logo,������ -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	<div class="tips">
		�ڹ��ﳵ������!
	</div>
	<%
		Tproducts p = (Tproducts)session.getAttribute("proinfo");
	%>
	<article>
		<div class="imgbg"><img class="img" src="<%=p.getG_img()%>"></div>
		<div class="intruction">��ʳ�������</div>
		<div class="name">���ƣ�</div>
		<div class="nm"><%=p.getG_name() %></div>
		<div class="price">�۸�: </div>
		<div class="money2">��</div>
		<div class="money"><%=p.getG_price() %></div>
		<div class="sale">������</div>
		<div class="sales"><%=p.getG_sales() %>��</div>
		<input type="number" min="1" value="1" class="num">
		<div class="addcart"></div>
		
		<div class="lists">
			<div class="m_like">����ϲ����</div>
			<c:forEach var="p" items="${sessionScope.prodlist }">
				<div class="m_box">
					<span>${p.g_name }</span><br> 
					<img src="${p.g_img }" class="m_pic"><br>
					<span>������${p.g_sales }</span>
					<span>�۸�${p.g_price }</span>				
				</div>
			</c:forEach>
		</div>
	</article>
</body>
</html>