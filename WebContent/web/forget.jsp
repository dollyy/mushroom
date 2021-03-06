<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>忘记密码</title>
	<link rel="stylesheet" href="../css/forget.css">
	<script type="text/javascript" src="../js/forget.js"></script>
</head>
<body>
	<div class="top"></div>
	<ol id="ol1">
		<li id="step1" class="step1">填写信息</li>
		<li id="claw1" class="claw1 clawcolor"></li>
		<li id="step2" class="step2">修改密码</li>
		<li id="claw2" class="claw1"></li>
		<li id="step3" class="step3">修改成功</li>
	</ol>
	<ul id="ul1">
		<li class="s1">
			<form name="forform" method="post" class="form1">
				<input type="text" id="user" class="user" placeholder="请输入用户名" onchange="uch()">
				<span id="u1" class="uwarn">请输入用户名</span>
				<span id="u2" class="uwarn">用户名不存在</span>
				<select id="qs" class="q" onchange="qch()">
					<option>--请选择密保问题--</option>
		            <option>您的生日是</option>
		           	<option>您的出生地是</option>
		           	<option>您初中班主任的名字是</option>
		           	<option>您的学号（或工号）是</option>
		           	<option>您的邮箱是</option>
		        </select>
		        <span id="q1" class="qwarn">密保问题错误</span>
		        <input type="text" id="ans" class="ans" placeholder="请输入答案"  onchange="ach()">
		        <span id="a1" class="awarn">请输入答案</span>
		        <span id="a2" class="awarn">答案错误</span>
		        <input type="button" class="subbtn" value="提  交" onclick="forget()">
			</form>
		</li>
		<li class="s2">
			<form name="forform2" method="post" class="form2">
				<input type="password" id="pwd1" class="pwd1" placeholder="请输入密码" onchange="pch()">
				<span id="p1" class="pwarn">请输入新密码</span>
				<span id="p2" class="pwarn">密码不得少于6位</span>
				<span id="p3" class="pwarn">两次密码不一致</span>
				<input type="password" id="pwd2" class="pwd2" placeholder="请再次输入密码" onchange="p2ch()">
				<span id="p21" class="pwarn2">请再次输入密码</span>
				<span id="p22" class="pwarn2">密码不得少于6位</span>
		        <input type="button" class="subbtn btn2" value="提  交" onclick="forget2()">
			</form>
		</li>
		<li class="s3">
			<div class="form3">
				<div class="succ">恭喜你，修改密码成功<br><span id="secs">5</span>s后为您跳转到登陆页面</div>
			</div>
		</li>
	</ul>
</body>
</html>