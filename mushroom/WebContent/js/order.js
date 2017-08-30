$(function(){
	
/*	$(".a_more").click(function(){
		var msg=$(this).html();
		if(msg == "显示更多"){
			$(this).html("隐藏");
		}else{
			$(this).html("显示更多");
		}
	})*/
	
	$("ul li").click(function(){
		$(this).addClass("a_select").siblings().removeClass("a_select");
		var par=new Array();
		par=$(this).children();
		var name=par[0].innerHTML;
		var phone=par[1].innerHTML;
		var add=par[2].innerHTML;
		document.getElementById("p_add").value=add;
		document.getElementById("p_name").value=name;
		document.getElementById("p_phone").value=phone;
	})
	
})
