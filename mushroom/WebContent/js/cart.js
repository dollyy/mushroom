$(function(){
	//修改商品数量时计算单个总价
	$(".nums").click(function(){
		var par=new Array();
		par=$(this).parent().children();
		var pri=par[2].innerHTML;
		var num=par[3].value;
		par[4].innerHTML=pri*num;
		calsum();
	})
	
	//修改复选框状态时
	$(".check").click(function(){
		calsum();
	})
	
	//计算总价
	function calsum(){
		var sump=0;
		$("#total li").each(function(){
			/*var eachnum=$(this).find('input[class*=nums]').val();*/
			var eachbox=$(this).find('input[class*=check]').is(':checked');
			if(eachbox){
				var eachprice=$(this).find('div[class*=cartsum]').html();
				sump+=parseInt(eachprice);
			}
		})
		$.ajax({type:"POST",url:"../modifycart",data:"sump="+sump,async:true});
		$(".sumprice").html(sump);
	}
	
	//修改商品数量时把session中的值更新
	$(".nums").change(function(){
		var par=new Array();
		par=$(this).parent().children();
		var name=par[0].innerHTML;
		var num=par[3].value;
		name=encodeURI(encodeURI(name));
		$.ajax({type:"POST",url:"../modifycart",data:"name="+name+"&num="+num,async:true});
	})
	
	//删除图片的切换
	$(".cartdel").mouseenter(function(){
		$(this).css("background","url(../imgs/cart/movetrash.jpg)");
	}).mouseleave(function(){
		$(this).css("background","url(../imgs/cart/trash.jpg)");
	})
	//每个商品都被选中则"全选"被选中
	$(".check").click(function(){
		var flag=true;
		var checks=document.getElementsByName("check");
		for (var i=0;i<checks.length;i++) {
			if(!checks[i].checked){
				flag = false;
				break;
			}
		}
		if(flag){
			document.getElementById("allsel").checked=true;
			document.getElementById("alldel").checked=true;
		} else {
			document.getElementById("allsel").checked=false;
			document.getElementById("alldel").checked=false;
		}
	})
	
	//全部选中
	$("#allsel").click(function(){
		var flag = document.getElementById("allsel").checked;
		var checks = document.getElementsByName("check");
		if(flag){
			document.getElementById("alldel").checked=true;
			for(var i=0;i<checks.length;i++){
				checks[i].checked = true;
			}
		}else{
			document.getElementById("alldel").checked=false;
			for(var i=0;i<checks.length;i++){
				checks[i].checked=false;
			}
		}
	})
	
	//全部选中 删除
	$("#alldel").click(function(){
		var flag = document.getElementById("alldel").checked;
		var checks = document.getElementsByName("check");
		if(flag){
			document.getElementById("allsel").checked=true;
			for(var i=0;i<checks.length;i++){
				checks[i].checked = true;
			}
		}else{
			document.getElementById("allsel").checked=false;
			for(var i=0;i<checks.length;i++){
				checks[i].checked=false;
			}
		}
	})
	
	//去结账
	$(".btn").click(function(){
		var checks=document.getElementsByName("check");
		var flag=false;
		for(var i=0;i<checks.length;i++){
			if(checks[i].checked == true){
				flag=true;
			}
		}
		if(!flag){
			alert("您还未选中任何商品");
		}else{
/*			var obj=document.getElementsByName("check");
			var a=new Array();
			for(k in obj){
				if(obj[k].checked){
					a.push(obj[k].value);
				}
			}
			alert(a);*/
			
			/*$.ajax({type:"POST",url:"../addorder",data:"names="+checks,async:true});*/
			document.order.action="../addorder";
			document.order.submit();
		}
	})
})