var xmlHttpRequest;
var codeRe;
var url;

//用户名文本框onchange事件
function luch(){
	document.getElementById("lu1").setAttribute("class","uwarn");	//请输入用户名提示
	document.getElementById("lu2").setAttribute("class","uwarn");	//用户名不存在提示
}

//密码文本框onchange事件
function lpch(){
	document.getElementById("lp1").setAttribute("class","pwarn");	//请输入密码提示
	document.getElementById("lp2").setAttribute("class","pwarn");	//密码错误提示
}

//验证码文本框onchange事件
function cch(){
	document.getElementById("c1").setAttribute("class","cwarn");	//请输入验证码提示
	document.getElementById("c2").setAttribute("class","cwarn");	//验证码错误提示
}
//登录按钮的onclick事件
function login(){
	url=window.location.pathname;
	var user=document.getElementById("log_user").value;
	var pwd=document.getElementById("log_pwd").value;
	var code=document.getElementById("code").value;
	var rem=document.getElementById("rem").checked;
	if(user.length == 0){		//用户名为空
		document.getElementById("lu1").setAttribute("class","uwarn error");
	}
	if(pwd.length == 0){		//密码为空
		document.getElementById("lp1").setAttribute("class","pwarn error");
	}
	if(code.length == 0){		//验证码为空
		document.getElementById("c1").setAttribute("class","cwarn error");
	}
	if(user.length != 0 && pwd.length != 0 && code.length != 0){
		if(window.ActiveXObject){		//IE浏览器
			xmlHttpRequest=new ActiveXObject("Microsoft XMLHTTP");
		}else if(window.XMLHttpRequest){	//FireFox浏览器
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST","../login",true);
		xmlHttpRequest.onreadystatechange=LCallback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		user=encodeURI(encodeURI(user));		//处理汉字乱码问题
		xmlHttpRequest.send("user="+user+"&pwd="+pwd+"&code="+code+"&codeRe="+codeRe+"&rem="+rem);
	}
}

//回掉函数
function LCallback(){
	if(xmlHttpRequest.readyState == 4){
		if(xmlHttpRequest.status == 200){
			var res=xmlHttpRequest.responseText;
			switch(res){
			case "0":var index=url.lastIndexOf("/");
			var path=url.substring(index+1);
			document.logform.action=path;		//匹配成功
			document.logform.submit();							//跳转到首页
			break;
			case "-1":document.getElementById("lp2").setAttribute("class","pwarn error");//密码错误
			document.getElementById("log_pwd").value="";
			document.getElementById("code").value="";
			refresh();
			break;
			case "-2":document.getElementById("lu2").setAttribute("class","uwarn error");//用户名不存在
			document.getElementById("log_user").value="";
			document.getElementById("log_pwd").value="";
			document.getElementById("code").value="";
			refresh();
			break;
			case "-3":document.getElementById("c2").setAttribute("class","cwarn error");//验证码错误
			document.getElementById("code").value="";
			refresh();
			break;
			}
		}
	}
}

function refresh(){
	codeRe=new Date().getTime().toString();
	codeRe=codeRe.substring(7);
	document.getElementById("codepic").innerHTML=codeRe;
}