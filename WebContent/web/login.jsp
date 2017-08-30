<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>µÇÂ½</title>
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="../js/login.js"></script>
</head>
<body>
    <div class="log_bg">
    	<div class="close" onclick="c()"></div>
        <a class="reg" onclick="goReg()">×¢²á>></a>
        <form name="logform" method="post">
            <div class="username">
                <div class="userpic"></div>
                <input type="text" id="log_user" name="user" placeholder="ÇëÊäÈëÓÃ»§Ãû" onchange="uch()">
            </div>
            <span id="lu1" class="uwarn">ÇëÊäÈëÓÃ»§Ãû</span>
            <span id="lu2" class="uwarn">ÓÃ»§Ãû²»´æÔÚ</span>
            <div class="password">
                <div class="pwdpic"></div>
                <input type="password" id="log_pwd" name="pwd" placeholder="ÇëÊäÈëÃÜÂë" onchange="pch()">
            </div>
            <span id="lp1" class="pwarn">ÇëÊäÈëÃÜÂë</span>
            <span id="lp2" class="pwarn">ÃÜÂë´íÎó</span>
            <input type="text" id="code" name="code" placeholder="ÇëÊäÈëÑéÖ¤Âë" class="codeinput" onchange="cch()">
            <div class="code">
	            <div id="codepic" class="codepic"></div><%-- ${sessionScope.code } --%>
	            <input type="button" class="refresh" onclick="refresh()">
            </div>
            <div id="c1" class="cwarn">ÑéÖ¤Âë²»µÃÎª¿Õ</div>
            <div id="c2" class="cwarn">ÑéÖ¤Âë´íÎó</div>
            <div class="ope">
                <input id="rem" type="checkbox" name="rem">¼Ç×¡ÃÜÂë
                <div class="forget"><a href="forget.jsp">Íü¼ÇÃÜÂë</a></div>
            </div>
            <input type="button" id="logbtn" value="µÇ  Â½" onclick="login()">
        </form>
    </div>
</body>
</html>