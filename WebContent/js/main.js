var xmlHttpRequest;
//����ajax�첽����
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

//�жϷ��ͷ�ʽ
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

//�ص�����
function Callback(){
	var i=1;
	var name = "<br><br>";
	if(xmlHttpRequest.readyState==4){
		if(xmlHttpRequest.status==200){
			var box5 = document.getElementById("b");
			var box4 = document.getElementById("a");
			var sontext = xmlHttpRequest.responseText;  
			var sonjson = eval("("+ sontext +")");
			
			for(i = 0; i < sonjson.length; i ++){
				name = name + "<a href='../getinfo?pinfo="+sonjson[i].s_name+"'>"+sonjson[i].s_name+"</a>" + "&nbsp; ";
				
				if((i)%9 == 0){
					name = name+": ";
				}
				if((i+1) % 9 == 0){
					name = name + "<br><br><br><br>";
				}
			}
			
			box4.innerHTML = name ;
			
			box5.innerHTML = 
				"<img src='../imgs/title.png'>" + "<br><br><br><br>" + "<span>" + sonjson[1].s_name + "</span>" + "<br>" +
				"<img src='"+sonjson[1].s_img+"' class='timg1'>" + "<br><br>" + "<span>" + sonjson[2].s_name + "</span>" + "<br>" +"<img src='"+sonjson[2].s_img+"' class='timg2'>";
			//box5.innerHTML = sonjson[1].s_img + "<br>" + sonjson[2].s_img;
			
			/* var oDiv = document.createElement("div");
			oDiv.innerHTML = "��ӵ�div";  */
			
		}
	}
}

function callback2(){
	if(xmlHttpRequest.readyState==4){
		//alert(0);
		if(xmlHttpRequest.status==200){
			//alert(0);
			alert(xmlHttpRequest.responseText);
		}
	}
}


$(function(){
	$(".timg1").mouseover(function(){
		$(".timg1").css("opacity","0.5");
	});
	$(".timg1").mouseleave(function(){
		$(".timg1").css("opacity","1");
	});
});



$(function(){
	var id;
	$(".list li").hover(function(){
		 id = $(this).attr("id");
//		 alert(id);
		 $(this).css("background","#f72b18");
		 $(this).css("font-size","18px");
		 $(".a_box4").css("display","block");
		 $(".a_box5").css("display","block");
		 $(".a_box45").css("display","block");
		 initXMLHttpRequest();
		 fSend("POST", "../index", "id="+id, Callback);
	});
	
	$(".list li").mouseleave(function(){
		 $(this).css("background","#ff5c4d");
		 $(this).css("font-size","17px");
		 $(".a_box4").css("display","none");
		 $(".a_box5").css("display","none");
	});
});


$(function(){
	$(".a_box45").mouseover(function(){
		$(this).css("display","block");
	});
	$(".a_box45").mouseleave(function(){
		$(this).css("display","none");
	});
});

$(function(){
	$("#a").mouseover(function(){
		$(this).css("display","block");
		$(".a_box5").css("display","block");
	});
	$("#a").mouseleave(function(){
		$(this).css("display","none");
		$(".a_box5").css("display","none");
	});
});

$(function(){
	$("#b").mouseover(function(){
		$(this).css("display","block");
		$(".a_box4").css("display","block");
	});
	$("#b").mouseleave(function(){
		$(this).css("display","none");
		$(".a_box4").css("display","none");
	});
});


/*ͼƬ�ֲ�����*/
$(function(){
	var i = 0; //pic��λ��
	var wide = $(".pic").width();
	function setTime(){           
	      time = setInterval(function(){
	        if(i < 3){
	            i++;
	        }
	        else{
	            i = 0;
	        }
	        $(".ppt_per").animate({"left": -i*wide + "px"});
	        $(".cc").eq(i).addClass("h").siblings(".cc").removeClass("h");
	     },3000);        
	    }
	
    setTime();
    
    $(".a_box2").mouseover(function(){
        clearInterval(time);
    });
    
    $(".a_box2").mouseleave(function(){
        setTime();
    });
    
    $(".left").click(function(){
        
        if(i > 0){
            i--;
        }
        else{
            i = 3;
        }
        $(".ppt_per").animate({"left": -i*wide + "px"});  
        $(".cc").eq(i).addClass("h").siblings(".cc").removeClass("h");
    });
    
    $(".right").click(function(){
    	if(i < 3){
            i++;
        }
        else{
            i = 0;
        }
       
        $(".ppt_per").animate({"left": -i*wide + "px"});
        $(".cc").eq(i).addClass("h").siblings(".cc").removeClass("h");
    });

    $(".cc").click(function(){
        var index_ = $(this).index();
        i = index_;
        $(".ppt_per").animate({"left": -i*wide + "px"});
        $(".cc").eq(i).addClass("h").siblings(".cc").removeClass("h");
        
    });
    
    $(".cc").mouseover(function(){
        var index_ = $(this).index();
        i = index_;
        $(".ppt_per").animate({"left": -i*wide + "px"});
        $(".cc").eq(i).addClass("h").siblings(".cc").removeClass("h");
        
    });
});