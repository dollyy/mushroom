<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>personal</title>
<link href="../css/gerenziliao.css" rel="stylesheet">
</head>
 <body>
    <!-- 头部导航 -->
	<%@include file="nav.jsp" %>
	<!-- 登陆 -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- 注册 -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	<!-- logo,搜索框 -->
	<div class="logos">
		<div class="logo"></div>
	</div>
        <div class="bodya">
            <div class="bodyb">
                <div class="bodyc">
                    <img src="../imgs/personal/p17.jpg">
                    <div class="zhgl"><span>账号管理</span></div>
                    <div class="grzl">
                        <div class="cc" id="c1"></div>
                        <a href="">个人资料</a>
                    </div>
                    <div class="shdz">
                        <div class="cc" id="c2"></div>
                        <a href="../address?search=y">收货地址</a>
                    </div>
                </div>
                <div class="bodyd">
                    <div class="title">个人中心</div><hr>
                    <div class="title2">
                            <a href="" class="ziliao">基本资料</a>
                            <a href="" class="touxiang">个人头像</a>
                    </div>
                    <div class="dqtouxiang">
                        <span>当前头像:</span>
                        <img src="../imgs/personal/p17.jpg">
                    </div>
                    <div class="nicheng">
                        <span>* 昵称：</span>
                        <input type="text">
                    </div>
                    <div class="xingbie">
                       <span>性别：</span>
                        <form action="">           
                           <div class="man">
                              <input type="radio" id="man" name="gender" checked="checked">
                              <span>男</span> 
                           </div>            
                           <div class="woman">
                              <input type="radio" id="woman" name="gender">                      
                              <span>女</span>
                           </div> 
                           <div class="nogender">
                              <input type="radio" id="nogender" name="gender">
                              <span>蘑菇说它要保密</span>
                           </div>     
                        </form>
                    </div>
                    <div class="shengri">
                       <span>生日：</span>
                        <input type="date">
                    </div>
                    <div class="jiaxiang">
                       <span>家乡：</span>
                        <input type="text">
                    </div>
                    <div class="juzhudizhi">
                       <span>居住地址：</span>
                        <input type="text">
                    </div>
                    <div class="xiugai">    
                        <input type="submit" value="修改">
                    </div>
                </div>
            </div>
        </div>
</body>
</html>