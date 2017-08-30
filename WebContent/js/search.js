var xmlHttpRequest;
//创建ajax异步请求
function initXMLHttpRequest(){
	if(xmlHttpRequest){
		return;
	}
	if(window.ActiveXObject){
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		xmlHttpRequest = new XMLHttpRequest();
	}
}

//判断发送方式
function fSend(method, url, data, callback){
	if(method == "GET"){
		xmlHttpRequest.open(method, url+"?"+data, true);
		xmlHttpRequest.onreadystatechange = callback;
		xmlHttpRequest.send();
	}else if(method == "POST"){
		xmlHttpRequest.open(method, url, true);
		xmlHttpRequest.onreadystatechange = callback;
		xmlHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlHttpRequest.send(data);
	}
}


//回掉函数
function callback(){
	if(xmlHttpRequest.readyState==4){
		//alert(0);
		if(xmlHttpRequest.status==200){
			//alert(0);
			var str = xmlHttpRequest.responseText;
			str=eval(str);
			var s = document.getElementById('result_display');
			s.innerHTML = '';
			if(str.length > 0){
				document.getElementById('result_display').style.visibility = "visible";
			}
			for(var i = 0; i < str.length; i++){
				var suggest = '<div ';
				suggest += 'onmouseout="onmousetOut(this)" onmouseover="onmouseOver(this)"';
				suggest += 'onclick="setSuggestValue(this.innerHTML);"';
				suggest += 'class="onmouset_out">'+str[i]+'</div>';
				s.innerHTML += suggest;
			}	
		}
	}
}


//ajax调用的函数
function ajaxSearch(){
    var txtValue = document.getElementById("tags").value;
	if(txtValue.length<2){
        return ;
	  }
	if(Trim(txtValue) == ""){
		document.getElementById('result_display').style.visibility = "hidden";
		return;
	}
	
	initXMLHttpRequest();
	fSend("POST", "../search", "name="+txtValue, callback);
}


function Trim(str){ 
	str += "";
	while( (str.charAt(0)==' ')||(str.charAt(0)=='　')||(escape(str.charAt(0))=='%u3000') ) 
	str=str.substring(1,str.length);
	while( (str.charAt(str.length-1)==' ')||(str.charAt(str.length-1)=='　')||(escape(str.charAt(str.length-1))=='%u3000') ) 
	str=str.substring(0,str.length-1);
	return str;
	}

function onmouseOver(div) { 
	div.className = 'onmouset_over'; 
	} 
function onmousetOut(div) { 
	div.className = 'onmouset_out'; 
	} 
function setSuggestValue(value) { 
	document.getElementById('tags').value = value; 
	document.getElementById('result_display').innerHTML = ''; 
	document.getElementById('result_display').style.display="none";
	}