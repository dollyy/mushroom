<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ע��</title>
	<link rel="stylesheet" href="../css/register.css">
	<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
	<div class="reg_bg">
		<div class="close" onclick="c()"></div>
		<a class="log" onclick="goLog()">��½>></a>
		<form name="regform"  method="post">
 			<div class="username">
                <div class="userpic"></div>
                <input type="text" id="reg_user" name="user" placeholder="�������û���" onchange="uch()">
            </div>
            <span id="ru1" class="uwarn">�������û���</span>
            <span id="ru2" class="uwarn">�û����Ѵ���</span>
            <div class="password">
                <div class="pwdpic"></div>
                <input type="password" id="reg_pwd" name="pwd" placeholder="���벻������6λ" onchange="pch()" onblur="plen()">
            </div>
            <span id="rp1" class="pwarn">����������</span>
            <span id="rp2" class="pwarn">���볤������6λ</span>
            <select id="qs" class="q">
            	<option>--��ѡ���ܱ�����--</option>
            	<option>����������</option>
            	<option>���ĳ�������</option>
            	<option>�����а����ε�������</option>
            	<option>����ѧ�ţ��򹤺ţ���</option>
            	<option>����������</option>
            </select>
            <input type="text" id="ans" name="ans" placeholder="�������" onchange="ach()">
            <span id="a1" class="awarn">�������</span>
            <input type="button" id="regbtn" value="ע  ��" onclick="register()">
		</form>
	</div>
</body>
</html>