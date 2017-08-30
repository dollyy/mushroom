/*导航栏*/
var flag=true;
window.onload=function(){
	refresh();
	var sessionUser=document.getElementById("sessionUser").innerText;
	var cookieUser=document.getElementById("cookieUser").innerText;
//	alert("sessionUser:"+sessionUser+"\ncookieUser:"+cookieUser);
	if(sessionUser == ""){
//		alert("session is null");
		if(cookieUser == ""){
//			alert("cookie is null");
			document.getElementById("s").setAttribute("class", "switcher in");
			document.getElementById("s2").setAttribute("class", "switcher2");
		}else{
//			alert("cookie is not null");
			flag=false;
			document.getElementById("s").setAttribute("class", "switcher");
			document.getElementById("s2").setAttribute("class", "switcher2 in");
			document.getElementById("sessionUser").setAttribute("class", "no");
			document.getElementById("cookieUser").setAttribute("class", "no in");
		}
	}else{
//		alert("session is not null");
		flag=false;
		document.getElementById("s").setAttribute("class", "switcher");
		document.getElementById("s2").setAttribute("class", "switcher2 in");
		document.getElementById("sessionUser").setAttribute("class", "in");
		document.getElementById("cookieUser").setAttribute("class", "no");
	}
}
//显示登陆页面
function goLog(){
	document.getElementById("reg").setAttribute("class", "no");
	document.getElementById("log").setAttribute("class", "log_bg in");
	document.getElementById("bg").setAttribute("class", "bg in");
}

//显示注册页面
function goReg(){
	document.getElementById("log").setAttribute("class", "no");
	document.getElementById("reg").setAttribute("class", "reg_bg in");
	document.getElementById("bg").setAttribute("class", "bg in");
}

//关闭登陆、注册
function c(){
	document.getElementById("log").setAttribute("class", "no");
	document.getElementById("reg").setAttribute("class", "no");
	document.getElementById("bg").setAttribute("class", "no");
}

//显示二维码
function disfen(){
	document.getElementById("fencode").setAttribute("class", "fencode");
}

//隐藏二维码
function hidfen(){
	document.getElementById("fencode").setAttribute("class", "fencode no");
}

//点击购物车
function my(){
	if(flag){
		goLog();
	}else{
		location.href="../web/personal.jsp";
	}
}