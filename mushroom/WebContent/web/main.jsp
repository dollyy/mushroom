<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>mushroom</title>
	<link rel="stylesheet" href="../css/main.css">
	<script src="../js/jquery-1.7.2.min.js"></script>	
	<script type="text/javascript" src="../js/main.js" charset="UTF-8"></script>
	<script type="text/javascript" src="../js/index.js"></script>
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
	
	<!-- 身体部分 -->
	<article>
		<div class="at">
			<div class="a_box1">
				<ul class="list">
					<c:forEach var="f" items="${sessionScope.fatherlist }">
						<li id="${f.f_id }" ><a href="../category?id=${f.f_id }">${f.f_name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="a_box2">
				<div class="ppt_per">
					<div class="pic"><img src="../imgs/index/bg1.jpg" class="imgcolor"></div>
					<div class="pic"><img src="../imgs/index/bg2.jpg" class="imgcolor"></div>
					<div class="pic"><img src="../imgs/index/bg3.jpg" class="imgcolor"></div>
					<div class="pic"><img src="../imgs/index/bg4.jpg" class="imgcolor"></div>
				</div>
				<div class="left"></div>
			    <div class="right"></div> 
			    <div class="selects">
			          <div class="cc h"></div>
			          <div class="cc"></div>
			          <div class="cc"></div>
			          <div class="cc"></div>
	            </div> 
			</div>
			<div class="a_box3">
			</div>
			<div class="a_box45">
				<div class="a_box4" id="a">
				</div>
				<div class="a_box5" id="b">
				</div>
			</div>
			
		</div>
		
		<!-- 推荐部分 -->
		<div class="msg2">
			<span class="m_m">
				<span style="font-size: 16px">★</span>
				<span style="font-size: 18px">★</span>
				<span style="font-size: 19px">★</span>
				蘑菇榜单
				<span style="font-size: 19px">★</span>
				<span style="font-size: 18px">★</span>
				<span style="font-size: 16px">★</span>
			</span>
			<div class="intru">
				<c:forEach var="p" items="${sessionScope.products }">
					<div class="m_box">
						<span class="m_t">${p.g_name }</span><br> 
						<img src="${p.g_img }" class="m_pic"><br>
						<span>销量：${p.g_sales }</span>&nbsp;&nbsp;
						<span>价格：${p.g_price }</span>				
					</div>
				</c:forEach>
			</div>	
		</div>
	</article>

</body>
</html>