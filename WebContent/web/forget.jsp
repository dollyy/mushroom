<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>��������</title>
	<link rel="stylesheet" href="../css/forget.css">
	<script type="text/javascript" src="../js/forget.js"></script>
</head>
<body>
	<div class="top"></div>
	<ol id="ol1">
		<li id="step1" class="step1">��д��Ϣ</li>
		<li id="claw1" class="claw1 clawcolor"></li>
		<li id="step2" class="step2">�޸�����</li>
		<li id="claw2" class="claw1"></li>
		<li id="step3" class="step3">�޸ĳɹ�</li>
	</ol>
	<ul id="ul1">
		<li class="s1">
			<form name="forform" method="post" class="form1">
				<input type="text" id="user" class="user" placeholder="�������û���" onchange="uch()">
				<span id="u1" class="uwarn">�������û���</span>
				<span id="u2" class="uwarn">�û���������</span>
				<select id="qs" class="q" onchange="qch()">
					<option>--��ѡ���ܱ�����--</option>
		            <option>����������</option>
		           	<option>���ĳ�������</option>
		           	<option>�����а����ε�������</option>
		           	<option>����ѧ�ţ��򹤺ţ���</option>
		           	<option>����������</option>
		        </select>
		        <span id="q1" class="qwarn">�ܱ��������</span>
		        <input type="text" id="ans" class="ans" placeholder="�������"  onchange="ach()">
		        <span id="a1" class="awarn">�������</span>
		        <span id="a2" class="awarn">�𰸴���</span>
		        <input type="button" class="subbtn" value="��  ��" onclick="forget()">
			</form>
		</li>
		<li class="s2">
			<form name="forform2" method="post" class="form2">
				<input type="password" id="pwd1" class="pwd1" placeholder="����������" onchange="pch()">
				<span id="p1" class="pwarn">������������</span>
				<span id="p2" class="pwarn">���벻������6λ</span>
				<span id="p3" class="pwarn">�������벻һ��</span>
				<input type="password" id="pwd2" class="pwd2" placeholder="���ٴ���������" onchange="p2ch()">
				<span id="p21" class="pwarn2">���ٴ���������</span>
				<span id="p22" class="pwarn2">���벻������6λ</span>
		        <input type="button" class="subbtn btn2" value="��  ��" onclick="forget2()">
			</form>
		</li>
		<li class="s3">
			<div class="form3">
				<div class="succ">��ϲ�㣬�޸�����ɹ�<br><span id="secs">5</span>s��Ϊ����ת����½ҳ��</div>
			</div>
		</li>
	</ul>
</body>
</html>