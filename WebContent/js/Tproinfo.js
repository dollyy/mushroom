/*加入购物车时获取商品信息*/
$(function(){
	$(".addcart").click(function(){
		if(flag){
			goLog();
		}else{
			var num=$(this).prev().val();
			var par=new Array();
			par=$(this).prevAll();
			var name=par[6].innerHTML;
			var price=par[3].innerHTML;
			var num=par[0].value;
			$(".tips").css("display", "block");
			setTimeout(function(){
				$(".tips").css("display", "none");
			}, 1500);
			if(window.ActiveXObject){
				xmlHttpRequest=new XMLHttpRequest();
			}else if(window.XMLHttpRequest){
				xmlHttpRequest=new XMLHttpRequest();
			}
			xmlHttpRequest.open("POST", "../addcart", true);
			xmlHttpRequest.onreadtstatechange=Callback;
			xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			name=encodeURI(encodeURI(name));
			price=encodeURI(encodeURI(price));
			xmlHttpRequest.send("name="+name+"&price="+price+"&num="+num);
		}
	})
})
function Callback(){
	if(xmlHttpRequest.readyState == 4){
		if(xmlHttpRequest.Status == 200){
			
		}
	}
}