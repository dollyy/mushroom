<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>×¢²á</title>
	<link rel="stylesheet" href="../css/register.css">
	<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
	<div class="reg_bg">
		<div class="close" onclick="c()"></div>
		<a class="log" onclick="goLog()">µÇÂ½>></a>
		<form name="regform"  method="post">
 			<div class="username">
                <div class="userpic"></div>
                <input type="text" id="reg_user" name="user" placeholder="ÇëÊäÈëÓÃ»§Ãû" onchange="uch()">
            </div>
            <span id="ru1" class="uwarn">ÇëÊäÈëÓÃ»§Ãû</span>
            <span id="ru2" class="uwarn">ÓÃ»§ÃûÒÑ´æÔÚ</span>
            <div class="password">
                <div class="pwdpic"></div>
                <input type="password" id="reg_pwd" name="pwd" placeholder="ÃÜÂë²»µÃÉÙÓÚ6Î»" onchange="pch()" onblur="plen()">
            </div>
            <span id="rp1" class="pwarn">ÇëÊäÈëÃÜÂë</span>
            <span id="rp2" class="pwarn">ÃÜÂë³¤¶ÈÉÙÓÚ6Î»</span>
            <select id="qs" class="q">
            	<option>--ÇëÑ¡ÔñÃÜ±£ÎÊÌâ--</option>
            	<option>ÄúµÄÉúÈÕÊÇ</option>
            	<option>ÄúµÄ³öÉúµØÊÇ</option>
            	<option>Äú³õÖÐ°àÖ÷ÈÎµÄÃû×ÖÊÇ</option>
            	<option>ÄúµÄÑ§ºÅ£¨»ò¹¤ºÅ£©ÊÇ</option>
            	<option>ÄúµÄÓÊÏäÊÇ</option>
            </select>
            <input type="text" id="ans" name="ans" placeholder="ÇëÊäÈë´ð°¸" onchange="ach()">
            <span id="a1" class="awarn">ÇëÊäÈë´ð°¸</span>
            <input type="button" id="regbtn" value="×¢  ²á" onclick="register()">
		</form>
	</div>
</body>
</html>