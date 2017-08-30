var xmlHttpRequest;
var user;

/*页面一*/
//用户名文本框onchange事件
function uch(){
	document.getElementById("u1").setAttribute("class", "uwarn");
	document.getElementById("u2").setAttribute("class", "uwarn");
}

//问题框onchange事件
function qch(){
	document.getElementById("q1").setAttribute("class", "awarn");
}

//答案文本框onchange事件
function ach(){
	document.getElementById("a1").setAttribute("class", "awarn");
	document.getElementById("a2").setAttribute("class", "awarn");
}

//提交按钮的onclick事件
function forget(){
	user=document.getElementById("user").value;		//页面一的用户名
	var qs=document.getElementById("qs").value;			//页面一的密保问题
	var ans=document.getElementById("ans").value;		//页面一的问题答案
	if(user.length == 0){		//用户名为空
		document.getElementById("u1").setAttribute("class", "uwarn error");
	}
	if(ans.length == 0){		//答案为空
		document.getElementById("a1").setAttribute("class", "awarn error");
	}
	if(user.length >0 && ans.length >0){
		if(window.ActiveXOBject){	//IE浏览器
			xmlHttpRequest=new ActiveXObject(Microsoft.XMLHTTP);
		}else if(window.XMLHttpRequest){	//火狐浏览器
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST","../forget",true);
		xmlHttpRequest.onreadystatechange=Callback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		user=encodeURI(encodeURI(user));		//处理中文乱码问题
		qs=encodeURI(encodeURI(qs));			//处理中文乱码问题
		ans=encodeURI(encodeURI(ans));			//处理中文乱码问题
		xmlHttpRequest.send("user="+user+"&qs="+qs+"&ans="+ans);
	}
}

/*页面二*/
//密码框1onchange事件
function pch(){
	var pwd1=document.getElementById("pwd1").value;
	if(pwd1.length == 0){							//密码长度等于0
		document.getElementById("p1").setAttribute("class", "pwarn error2");
		document.getElementById("p2").setAttribute("class", "pwarn");
		document.getElementById("p3").setAttribute("class", "pwarn");
	}else if(pwd1.length > 0 && pwd1.length < 6){		//密码长度小于6位
		document.getElementById("p1").setAttribute("class", "pwarn");
		document.getElementById("p2").setAttribute("class", "pwarn error2");
		document.getElementById("p3").setAttribute("class", "pwarn");
	}else{											//密码长度大于6位
		document.getElementById("p2").setAttribute("class", "pwarn");
		document.getElementById("p3").setAttribute("class", "pwarn");
	}
}

//密码框2onchange事件
function p2ch(){
	var pwd2=document.getElementById("pwd2").value;
	if(pwd2.length == 0){							//密码长度等于0
		document.getElementById("p21").setAttribute("class", "pwarn2 error2");
		document.getElementById("p22").setAttribute("class", "pwarn2");
	}else if(pwd2.length > 0 && pwd2.length < 6){		//密码长度小于6位
		document.getElementById("p21").setAttribute("class", "pwarn2");
		document.getElementById("p22").setAttribute("class", "pwarn2 error2");
	}else{											//密码长度大于6位
		document.getElementById("p22").setAttribute("class", "pwarn2");
	}
}
function forget2(){
	var pwd1=document.getElementById("pwd1").value;		//页面二的密码1
	var pwd2=document.getElementById("pwd2").value;		//页面一的密码2
	if(pwd1.length == 0){					//密码1为空
		document.getElementById("p1").setAttribute("class", "pwarn error2");
	}
	if(pwd2.length == 0){				//密码2为空
		document.getElementById("p21").setAttribute("class", "pwarn2 error2");
	}
	if(pwd1.length > 5 && pwd2.length > 5){
		if(window.ActiveXObject){
			xmlHttpRequest=new ActiveXObject(Microsoft.XMLHttp);
		}else if(window.XMLHttpRequest){
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST", "../forget", true);
		xmlHttpRequest.onreadystatechange=Callback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		pwd1=encodeURI(encodeURI(pwd1));		//处理中文乱码问题
		pwd2=encodeURI(encodeURI(pwd2));		//处理中文乱码问题
		xmlHttpRequest.send("user="+user+"&pwd1="+pwd1+"&pwd2="+pwd2);
	}
}

function Callback(){
	if(xmlHttpRequest.readyState == 4){
		if(xmlHttpRequest.status == 200){
			var res=xmlHttpRequest.responseText;
			switch(res){
			case "0":ch1();	//匹配成功
			break;
			case "-1":document.getElementById("u2").setAttribute("class", "uwarn error");	//用户名不存在
			document.getElementById("user").value="";
			document.getElementById("qs").selectedIndex=0;
			document.getElementById("ans").value="";
			break;
			case "-2":document.getElementById("q1").setAttribute("class", "qwarn error");	//密保问题有误
			document.getElementById("qs").selectedIndex=0;
			document.getElementById("ans").value="";
			break;
			case "-3":document.getElementById("a2").setAttribute("class", "awarn error");	//密保答案有误
			document.getElementById("ans").value="";
			break;
			case "-4":ch2();																//修改成功
			countDown();
			break;
			case "-5":document.getElementById("p3").setAttribute("class", "pwarn error2");	//两次密码不相同
			document.getElementById("pwd1").value="";
			document.getElementById("pwd2").value="";
			break;
			}
		}
	}
}
function ch1(){
	var s=document.getElementById("ul1").getElementsByTagName("li");
	var s2=document.getElementById("ol1").getElementsByTagName("li");
	s[0].style.display="none";
	s[1].style.display="block";
	s2[0].style.backgroundImage="url(../imgs/forget/step1.png)";
	s2[1].className="claw1";
	s2[2].style.backgroundImage="url(../imgs/forget/step2_2.png)";
	s2[3].className="claw1 clawcolor";
}
function ch2(){
	var s=document.getElementById("ul1").getElementsByTagName("li");
	var s2=document.getElementById("ol1").getElementsByTagName("li");
	s[1].style.display="none";
	s[2].style.display="block";
	s2[2].style.backgroundImage="url(../imgs/forget/step2.png)";
	s2[3].className="claw1";
	s2[4].style.backgroundImage="url(../imgs/forget/step3_2.png)";
}
function countDown(){
	var secs=document.getElementById("secs").innerHTML;
	if(--secs >= 0){
		document.getElementById("secs").innerHTML=secs;
		setTimeout("countDown()", 1000);
	}else{
		location.href="main.jsp"; 
	}
}