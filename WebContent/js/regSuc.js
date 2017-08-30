function countDown(){
	var secs=document.getElementById("secs").innerHTML;
	if(--secs >= 0){
		document.getElementById("secs").innerHTML=secs;
		setTimeout("countDown()", 1000);
	}else{
		location.href="main.jsp"; 
	}
}