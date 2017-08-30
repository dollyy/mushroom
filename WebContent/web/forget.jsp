<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Íü¼ÇÃÜÂë</title>
	<link rel="stylesheet" href="../css/forget.css">
	<script type="text/javascript" src="../js/forget.js"></script>
</head>
<body>
	<div class="top"></div>
	<ol id="ol1">
		<li id="step1" class="step1">ÌîÐ´ÐÅÏ¢</li>
		<li id="claw1" class="claw1 clawcolor"></li>
		<li id="step2" class="step2">ÐÞ¸ÄÃÜÂë</li>
		<li id="claw2" class="claw1"></li>
		<li id="step3" class="step3">ÐÞ¸Ä³É¹¦</li>
	</ol>
	<ul id="ul1">
		<li class="s1">
			<form name="forform" method="post" class="form1">
				<input type="text" id="user" class="user" placeholder="ÇëÊäÈëÓÃ»§Ãû" onchange="uch()">
				<span id="u1" class="uwarn">ÇëÊäÈëÓÃ»§Ãû</span>
				<span id="u2" class="uwarn">ÓÃ»§Ãû²»´æÔÚ</span>
				<select id="qs" class="q" onchange="qch()">
					<option>--ÇëÑ¡ÔñÃÜ±£ÎÊÌâ--</option>
		            <option>ÄúµÄÉúÈÕÊÇ</option>
		           	<option>ÄúµÄ³öÉúµØÊÇ</option>
		           	<option>Äú³õÖÐ°àÖ÷ÈÎµÄÃû×ÖÊÇ</option>
		           	<option>ÄúµÄÑ§ºÅ£¨»ò¹¤ºÅ£©ÊÇ</option>
		           	<option>ÄúµÄÓÊÏäÊÇ</option>
		        </select>
		        <span id="q1" class="qwarn">ÃÜ±£ÎÊÌâ´íÎó</span>
		        <input type="text" id="ans" class="ans" placeholder="ÇëÊäÈë´ð°¸"  onchange="ach()">
		        <span id="a1" class="awarn">ÇëÊäÈë´ð°¸</span>
		        <span id="a2" class="awarn">´ð°¸´íÎó</span>
		        <input type="button" class="subbtn" value="Ìá  ½»" onclick="forget()">
			</form>
		</li>
		<li class="s2">
			<form name="forform2" method="post" class="form2">
				<input type="password" id="pwd1" class="pwd1" placeholder="ÇëÊäÈëÃÜÂë" onchange="pch()">
				<span id="p1" class="pwarn">ÇëÊäÈëÐÂÃÜÂë</span>
				<span id="p2" class="pwarn">ÃÜÂë²»µÃÉÙÓÚ6Î»</span>
				<span id="p3" class="pwarn">Á½´ÎÃÜÂë²»Ò»ÖÂ</span>
				<input type="password" id="pwd2" class="pwd2" placeholder="ÇëÔÙ´ÎÊäÈëÃÜÂë" onchange="p2ch()">
				<span id="p21" class="pwarn2">ÇëÔÙ´ÎÊäÈëÃÜÂë</span>
				<span id="p22" class="pwarn2">ÃÜÂë²»µÃÉÙÓÚ6Î»</span>
		        <input type="button" class="subbtn btn2" value="Ìá  ½»" onclick="forget2()">
			</form>
		</li>
		<li class="s3">
			<div class="form3">
				<div class="succ">¹§Ï²Äã£¬ÐÞ¸ÄÃÜÂë³É¹¦<br><span id="secs">5</span>sºóÎªÄúÌø×ªµ½µÇÂ½Ò³Ãæ</div>
			</div>
		</li>
	</ul>
</body>
</html>