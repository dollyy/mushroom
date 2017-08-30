var xmlHttpRequest;

//用户名文本框onchange事件
function ruch(){
	document.getElementById("ru1").setAttribute("class", "uwarn");
	document.getElementById("ru2").setAttribute("class", "uwarn");
}

//密码文本框onchange事件
function rpch(){
	document.getElementById("rp1").setAttribute("class", "pwarn");
	document.getElementById("rp2").setAttribute("class", "pwarn");
}

//密码文本框onblur事件
function plen(){
	var pwd=document.getElementById("pwd").value;
	if(pwd.length == 0){							//密码长度等于0
		document.getElementById("rp1").setAttribute("class", "pwarn error");
		document.getElementById("rp2").setAttribute("class", "pwarn");
	}else if(pwd.length > 0 && pwd.length < 6){		//密码长度小于6位
		document.getElementById("rp1").setAttribute("class", "pwarn");
		document.getElementById("rp2").setAttribute("class", "pwarn error");
	}else{											//密码长度大于6位
		document.getElementById("rp1").setAttribute("class", "pwarn");
	}
}

//答案文本框onchange事件
function ach(){
	document.getElementById("a1").setAttribute("class", "awarn");
}

//注册按钮的onclick事件
function register(){
	var user=document.getElementById("reg_user").value;
	var pwd=document.getElementById("reg_pwd").value;
	var qs=document.getElementById("qs").value;
	var ans=document.getElementById("ans").value;
	if(user.length == 0){		//用户名为空
		document.getElementById("ru1").setAttribute("class", "uwarn error");
	}
	if(pwd.length == 0){		//密码为空
		document.getElementById("rp1").setAttribute("class", "pwarn error");
	}
	if(ans.length == 0){		//答案为空
		document.getElementById("a1").setAttribute("class", "awarn error");
	}
	if(user.length >0 && pwd.length >5 && ans.length >0){
		if(window.ActiveXObject){	//IE浏览器
			xmlHttpRequest=new ActiveXObject(Microsoft.XMLHTTP);
		}else if(window.XMLHttpRequest){	//火狐浏览器
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST","../register",true);
		xmlHttpRequest.onreadystatechange=RCallback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		user=encodeURI(encodeURI(user));		//处理中文乱码问题
		pwd=encodeURI(encodeURI(pwd));			//处理中文乱码问题
		qs=encodeURI(encodeURI(qs));			//处理中文乱码问题
		ans=encodeURI(encodeURI(ans));			//处理中文乱码问题
		xmlHttpRequest.send("user="+user+"&pwd="+pwd+"&qs="+qs+"&ans="+ans);
	}
}

//回调函数
function RCallback(){
	if(xmlHttpRequest.readyState == 4){
		if(xmlHttpRequest.status == 200){
			var res=xmlHttpRequest.responseText;
			switch(res){
			case "0":document.regform.action="regSuc.jsp";		//注册成功
			document.regform.submit();							//跳转到首页
			break;
			case "-1":document.getElementById("u2").setAttribute("class", "uwarn error");	//用户名重复
			document.getElementById("reg_user").value="";
			document.getElementById("reg_pwd").value="";
			document.getElementById("ans").value="";
			break;
			}
		}
	}
}