<%@page import="msg.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>½ø¿ÚÊ³Æ·</title>
<link rel="stylesheet" href="../css/category.css">
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/category.js"></script>
</head>
<body>
	<!-- Í·²¿µ¼º½ -->
	<%@ include file="nav.jsp" %>
	<!-- µÇÂ½ -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- ×¢²á -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	<!-- logo,ËÑË÷¿ò -->
	<div class="logos">
		<a class="logo" href="main.jsp"></a>
		<div class="l_search"><%@include file="search.jsp" %></div>
	</div>
	<!-- ·ÖÀàµ¼º½ -->
	<div class="catenav">
		<ol>
		<%
		Object obj2=session.getAttribute("pro");
		if(obj2 == null){
			out.print("is null");
		}
		Map<String, ArrayList<Cart>> allpro2=(Map<String, ArrayList<Cart>>)obj2;
		Iterator it2=allpro2.keySet().iterator();
		while(it2.hasNext()){
			String key=it2.next().toString();
		%>
			<li class="libg"><a href="#<%=key %>"><%=key %></a></li>
		<%} %>
		</ol>
		<div id="cart" class="cart_w no">¹ºÎï³µ</div>
		<a href="cart.jsp" class="cart" onmouseover="discart()" onmouseout="hidcart()">
			<img id="cart_bg" src="../imgs/category/cart.png">
		</a>
		<div id="feedback" class="feed no">Òâ¼û·´À¡</div>
		<div class="feedback" onmouseover="disfeed()" onmouseout="hidfeed()">
			<img id="feed_bg" src="../imgs/category/feedback.png">
		</div>
		<span id="back" class="backtop no">·µ»Ø<br>¶¥²¿</span>
		<a class="back" href="#top" onmouseover="disback()" onmouseout="hidback()">
			<img src="../imgs/category/back.png">
		</a>
	</div>

	<!-- ·ÖÀàÒ» -->
	<div class="tipss">
		ÔÚ¹ºÎï³µµÈÄãÀ²!
	</div>
	<%
		Object obj=session.getAttribute("pro");
		if(obj == null){
			out.print("is null");
		}
		Map<String, ArrayList<Cart>> allpro=(Map<String, ArrayList<Cart>>)obj;
		Iterator it=allpro.keySet().iterator();
	%>
	<div class="cate">
		<%
			while(it.hasNext()){
				String key=it.next().toString();
				ArrayList<Cart> pro=(ArrayList<Cart>)allpro.get(key);
		%>
			<div id="p1" class="p">
				<div class="p_head"><a name='<%=key %>'><%=key %></a></div>
				<div class="pro">
		<%
				for(int i=0;i<pro.size();i++){
					Cart c=(Cart)pro.get(i);
		%>
					<div class="pros">
						<div class="pic"><img src='<%=c.getImgs() %>'></div>
						<div class="msgs">
							<a href="../getinfo?pinfo=<%=c.getProname() %>"><%=c.getProname() %></a>
							<span class="icon">£¤</span>
							<span class="price"><%=c.getPrice() %></span>
							<input class="num" type="number" min="1" value="1">
							<div class="addcart"></div>
						</div>
					</div>
		<%
				}
		%>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>