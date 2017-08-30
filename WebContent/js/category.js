/*$(window).scroll(function(){
	var h1=$(window).height();		//获取浏览器显示区域的高度
	var h2=$(window).scrollTop();	//获取滚动条到顶部的垂直高度
	var h3=$(".p1").offset().top;	//元素位置和偏移量
	console.log(h3);
	if(parseInt(h3)<50){
		alert("haha");
	}
})*/

var xmlHttpRequest;

/*左侧导航*/
//显示返回顶部
function disback(){
	document.getElementById("back").setAttribute("class", "backtop");
}
//隐藏返回顶部
function hidback(){
	document.getElementById("back").setAttribute("class", "backtop no");
}

//显示购物车
function discart(){
	document.getElementById("cart_bg").setAttribute("src", "../imgs/category/cart2.png");
	document.getElementById("cart").setAttribute("class", "cart_w");
}
//隐藏购物车
function hidcart(){
	document.getElementById("cart_bg").setAttribute("src", "../imgs/category/cart.png");
	document.getElementById("cart").setAttribute("class", "cart_w no");
}

//显示意见反馈
function disfeed(){
	document.getElementById("feed_bg").setAttribute("src", "../imgs/category/feedback2.png");
	document.getElementById("feedback").setAttribute("class", "feed");
}
//隐藏意见反馈
function hidfeed(){
	document.getElementById("feed_bg").setAttribute("src", "../imgs/category/feedback.png");
	document.getElementById("feedback").setAttribute("class", "feed no");
}

/*加入购物车时获取商品信息*/
$(function(){
	$(".addcart").click(function(){
		if(flag){
			goLog();
		}else{
			var num=$(this).prev().val();
			var par=new Array();
			par=$(this).parent().children();
			var name=par[0].innerHTML;
			var price=par[2].innerHTML;
			var num=par[3].value;
//			alert(name+","+price+","+num)
			$(".tipss").css("display", "block");
			setTimeout(function(){
				$(".tipss").css("display", "none");
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