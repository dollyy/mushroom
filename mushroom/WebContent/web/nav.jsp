<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../css/nav.css">
	<script type="text/javascript" src="../js/nav.js"></script>
	<title>����</title>
</head>
<body>
	<div id="bg" class="bg no"></div>
	<!-- ͷ������ -->
	<div class="head">
		<div id="s" class="switcher">
			<a onclick="goLog()">��½</a>&nbsp;&nbsp;&nbsp;
			<a onclick="goReg()">ע��</a>
		</div>
		<div id="s2" class="switcher2">
			��ӭ��½��<span id="sessionUser">${sessionScope.user }</span>
			<span id="cookieUser">${cookie.user.value }</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="exit"><a href="../login?exit=byebye">�˳�</a></span>
		</div>
		<div class="msg">
			<a onclick="my()">�ҵ�</a>&nbsp;&nbsp;&nbsp;
			<a href="cart.jsp">���ﳵ</a>&nbsp;&nbsp;&nbsp;
			<a >��Ϣ����</a>&nbsp;&nbsp;&nbsp;
			<span class="fen" onmouseover="disfen()" onmouseout="hidfen()">��ע����</span>
			<span id="fencode" class="fencode no"></span>
		</div>
	</div>
</body>
</html>