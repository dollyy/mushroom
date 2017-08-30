<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>注册</title>
	<link rel="stylesheet" href="../css/register.css">
	<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
	<div class="reg_bg">
		<div class="close" onclick="c()"></div>
		<a class="log" onclick="goLog()">登陆>></a>
		<form name="regform"  method="post">
 			<div class="username">
                <div class="userpic"></div>
                <input type="text" id="reg_user" name="user" placeholder="请输入用户名" onchange="uch()">
            </div>
            <span id="ru1" class="uwarn">请输入用户名</span>
            <span id="ru2" class="uwarn">用户名已存在</span>
            <div class="password">
                <div class="pwdpic"></div>
                <input type="password" id="reg_pwd" name="pwd" placeholder="密码不得少于6位" onchange="pch()" onblur="plen()">
            </div>
            <span id="rp1" class="pwarn">请输入密码</span>
            <span id="rp2" class="pwarn">密码长度少于6位</span>
            <select id="qs" class="q">
            	<option>--请选择密保问题--</option>
            	<option>您的生日是</option>
            	<option>您的出生地是</option>
            	<option>您初中班主任的名字是</option>
            	<option>您的学号（或工号）是</option>
            	<option>您的邮箱是</option>
            </select>
            <input type="text" id="ans" name="ans" placeholder="请输入答案" onchange="ach()">
            <span id="a1" class="awarn">请输入答案</span>
            <input type="button" id="regbtn" value="注  册" onclick="register()">
		</form>
	</div>
</body>
</html>