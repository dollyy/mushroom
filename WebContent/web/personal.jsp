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
    <!-- ͷ������ -->
	<%@include file="nav.jsp" %>
	<!-- ��½ -->
	<div id="log" class="log_bg no"><%@ include file="login.jsp" %></div>
	<!-- ע�� -->
	<div id="reg" class="reg_bg no"><%@ include file="register.jsp" %></div>
	<!-- logo,������ -->
	<div class="logos">
		<div class="logo"></div>
	</div>
        <div class="bodya">
            <div class="bodyb">
                <div class="bodyc">
                    <img src="../imgs/personal/p17.jpg">
                    <div class="zhgl"><span>�˺Ź���</span></div>
                    <div class="grzl">
                        <div class="cc" id="c1"></div>
                        <a href="">��������</a>
                    </div>
                    <div class="shdz">
                        <div class="cc" id="c2"></div>
                        <a href="../address?search=y">�ջ���ַ</a>
                    </div>
                </div>
                <div class="bodyd">
                    <div class="title">��������</div><hr>
                    <div class="title2">
                            <a href="" class="ziliao">��������</a>
                            <a href="" class="touxiang">����ͷ��</a>
                    </div>
                    <div class="dqtouxiang">
                        <span>��ǰͷ��:</span>
                        <img src="../imgs/personal/p17.jpg">
                    </div>
                    <div class="nicheng">
                        <span>* �ǳƣ�</span>
                        <input type="text">
                    </div>
                    <div class="xingbie">
                       <span>�Ա�</span>
                        <form action="">           
                           <div class="man">
                              <input type="radio" id="man" name="gender" checked="checked">
                              <span>��</span> 
                           </div>            
                           <div class="woman">
                              <input type="radio" id="woman" name="gender">                      
                              <span>Ů</span>
                           </div> 
                           <div class="nogender">
                              <input type="radio" id="nogender" name="gender">
                              <span>Ģ��˵��Ҫ����</span>
                           </div>     
                        </form>
                    </div>
                    <div class="shengri">
                       <span>���գ�</span>
                        <input type="date">
                    </div>
                    <div class="jiaxiang">
                       <span>���磺</span>
                        <input type="text">
                    </div>
                    <div class="juzhudizhi">
                       <span>��ס��ַ��</span>
                        <input type="text">
                    </div>
                    <div class="xiugai">    
                        <input type="submit" value="�޸�">
                    </div>
                </div>
            </div>
        </div>
</body>
</html>