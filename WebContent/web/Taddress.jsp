<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add address</title>
<link href="../css/gerenziliao.css" rel="stylesheet">
<link href="../css/Taddress.css" rel="stylesheet">
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
		<a class="logo" href="main.jsp"></a>
	</div>
        <div class="bodya">
            <div class="bodyb">
                <div class="bodyc">
                    <img src="../imgs/personal/p17.jpg">
                    <div class="zhgl"><span>�˺Ź���</span></div>
                    <div class="grzl">
                        <div class="cc" id="c1"></div>
                        <a href="personal.jsp">��������</a>
                    </div>
                    <div class="shdz">
                        <div class="cc" id="c2"></div>
                        <a href="">�ջ���ַ</a>
                    </div>
                </div>
                <div class="bodyd">
                    <div class="title">��������</div><hr>
                    
                    <!-- �Ƿ������ջ���ַ -->
                    <c:if test="${!empty sessionScope.addresses }">
                    <div class="add_box"> 
                    	<div class="hasadd">���е��ջ���ַ��</div>                 
	                    <c:forEach var="add" items="${sessionScope.addresses }">
	                    	<div>
	                    	<div class="adds">�ջ���: ${add.recname } ��ϵ�绰: ${add.rectel } �ջ���ַ��${add.add }</div>
	                    	<span class="remove"><a href="../address?remove=y&recname=${add.recname }&tel=${add.rectel }&adds=${add.add}">ɾ��</a></span>
	                    	</div>
	                    </c:forEach>
                    </div> 
                    </c:if>
                    <!-- ����ջ���ַ -->
                    <div class="add">����������ջ���ַ��</div>
                     <div class="login-textbox">
                         <div class="province"> ��ѡ�������ڵ�ʡ���У�</div>
                         <div class="select_province">
                            <form action="" method="get" name="myform">  
                                <select name="country" onChange="showCity();" class="select prov">  
                                    <option>--��ѡ��ʡ--</option>   
                                    <option value="����">����</option>   
                                    <option value="����">����</option>    
                                    <option value="����">����</option> 
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="�㶫">�㶫</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="�ӱ�">�ӱ�</option>
                                    <option value="������">������</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>
                                    <option value="����">����</option>  
                                    <option value="����">����</option> 
                                    <option value="���ɹ�">���ɹ�</option> 
                                    <option value="����">����</option> 
                                    <option value="�ຣ">�ຣ</option> 
                                    <option value="ɽ��">ɽ��</option> 
                                    <option value="�Ϻ�">�Ϻ�</option> 
                                    <option value="ɽ��">ɽ��</option> 
                                    <option value="����">����</option> 
                                    <option value="�Ĵ�">�Ĵ�</option> 
                                    <option value="���">���</option>
                                    <option value="�½�">�½�</option> 
                                    <option value="����">����</option>
                                    <option value="����">����</option> 
                                    <option value="�㽭">�㽭</option>  
                                </select>     
                            </div>   
                     </div>
                     <div class="login-textbox">
                        <div class="select_city">
                            <select name="cityList"  class="select cit" onchange="showadd()">
                                <option>--��ѡ�����ڳ��л����--</option>
                            </select>
                         </form> 
                        </div>
                     </div>
                     
                    <!-- ����ַ���� -->
                    <div class="detailadd">�����ַ���£���ȷ�ϣ�</div>
                    <div class="reformaddress">
                    	<!-- <form action="../address" method="post"> -->
                    	<!-- <form action="" method=""> -->
                    		<textarea rows="" cols="" class="area" id="area" name="area"></textarea>
                    		<div class="recvname">�ջ���������</div>
                    		<input type="text" placeholder="����������" class="inputname" name="recvname"><span class="w">*</span>
                    		<div class="recvtel" >��ϵ�绰��</div>
                    		<input type="text" placeholder="������绰����" class="inputtel" name="recvtel" ><span class="w1">*</span>
                    		<input type="submit" value="��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��" class="submit" onclick="reform()">
                    	<!-- </form> -->
                    </div>
                </div>
            </div>
        </div>
</body>
<script src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"> 
var province;
var city;
var address;
var result;

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
	if(xmlHttpRequest.readyState==4){
		if(xmlHttpRequest.status==200){
			result = xmlHttpRequest.responseText; 
			if(result == -1){
				alert("���и��ͻ���ַ�벻Ҫ�������");
			}else if(result == 0){
				alert("��ӳɹ�");
				location.reload();
			}
		}
	}
}


function reform(){
	var adds = $(".area").val();
	var recname = $(".inputname").val();
	var tel = $(".inputtel").val();
	//alert(recname+":"+tel+":"+adds);
	initXMLHttpRequest();
	fSend("POST", "../address", "recvname="+recname+"&recvtel="+tel+"&area="+adds, Callback);
} 





function showadd(){
	province = $(".prov").val();
	city = $(".cit").val();
	address = province+"-"+city;
	//alert(address);
	document.getElementById("area").value = address;
	
}
        function showCity() 
        {   
            var ctryName=document.myform.country.value;  
            var ctryType = new Array();   
            ctryType['����']=['�Ϸ�', '�ߺ�', '����', '����', '��ɽ', '����','ͭ��','����','��ɽ', '����', '����', '����', '����', '����', '����', '����'];  
            ctryType['����']=['����', '����', '����', '��̨', 'ʯ��ɽ', '����', '��ͷ��', '��ɽ', 'ͨ��', '˳��', '��ƽ', '����', '����', 'ƽ��', '����', '����']; 
            ctryType['����']=['����', '����', '����', '��ɿ�', '����', 'ɳƺ��', '������', '�ϰ�', '����', '��ʢ', '˫��', '�山', '����', 'ǭ��', '����', '�뽭', '����', 'ͭ��', '����', '�ٲ�', '�ɽ', '��ƽ', '�ǿ�', '�ᶼ', '�潭', '��¡', '����', '����', '����', '���', '��ɽ', '��Ϫ', 'ʯ��', '��ɽ', '����', '��ˮ', '����', '�ϴ�', '����', '�ϴ�'];    
            ctryType['����']=['����', '����', '����', '����', 'Ȫ��', '����', '��ƽ', '����','����']; 
            ctryType['����']=['����', '������', '���', '����', '��ˮ', '����', '��Ҵ', 'ƽ��', '��Ȫ', '����', '����', '¤��', '����', '����'];
            ctryType['�㶫']=['����', '�ع�', '����', '�麣', '��ͷ', '��ɽ', '����', 'տ��', 'ï��', '����', '����', '÷��', '��β', '��Դ', '����', '��Զ', '��ݸ', '��ɽ', '����', '����', '�Ƹ�'];
            ctryType['����']=['����', '����', '����', '����', '����', '���Ǹ�', '����', '���', '����', '��ɫ', '����', '�ӳ�', '����', '����'];
            ctryType['����']=['����', '����ˮ', '����', '��˳', 'ͭ��', 'ǭ����', '�Ͻ�', 'ǭ����', 'ǭ��'];
            ctryType['����']=['����', '����', '��ɳ', '��ָɽ', '��', '����', '�Ĳ�', '����', '�ٸ�', '��ɳ', '����', '�ֶ�', '��ˮ', '��ͤ', '����'];
            ctryType['�ӱ�']=['ʯ��ׯ', '��ɽ', '�ػʵ�', '����', '��̨', '����', '�żҿ�', '�е�', '����', '�ȷ�', '��ˮ'];
            ctryType['������']=['������', '�������', '����', '�׸�', '˫Ѽɽ', '����', '����', '��ľ˹', '��̨��', 'ĵ����', '�ں�', '�绯', '���˰���'];
            ctryType['����']=['֣��', '����', '����', 'ƽ��ɽ', '����', '�ױ�', '����', '����', '��Դ', '���', '���', '���', '����Ͽ', '����', '����', '����', '�ܿ�', 'פ���'];   
            ctryType['����']=['�人', '��ʯ', 'ʮ��', '�˲�', '����', '����', '����', 'Т��', '����', '�Ƹ�', '����', '����', '��ʩ', '����', 'Ǳ��', '����', '��ũ��'];   
            ctryType['����']=['��ɳ', '����', '��̶', '����', '����', '����', '����', '�żҽ�', '����', '����', '����', '����', '¦��', '����'];   
            ctryType['����']=['�Ͼ�', '����', '����', '����', '����', '��ͨ', '���Ƹ�', '����', '�γ�', '����', '��', '̩��', '��Ǩ']; 
            ctryType['����']=['�ϲ�', '������', 'Ƽ��', '�Ž�', '����', 'ӥ̶', '����', '����', '�˴�', '����', '����'];
            ctryType['����']=['����', '����', '��ƽ', '��Դ', 'ͨ��', '��ɽ', '��ԭ', '�׳�', '�ӱ߳�����'];
            ctryType['����']=['����', '����', '��ɽ', '��˳', '��Ϫ', '����', '����', 'Ӫ��', '����', '����', '�̽�', '����', '����', '��«��'];
            ctryType['���ɹ�']=['���ͺ���', '��ͷ', '�ں�', '���', 'ͨ��', '������˹', '���ױ���', '�����׶�', '�����첼', '�˰�', '���ֹ���', '������'];
            ctryType['����']=['����', 'ʯ��ɽ', '����', '��ԭ', '����'];
            ctryType['�ຣ']=['����', '����', '����', '����', '���ϲ���', '����', '����', '����'];
            ctryType['ɽ��']=['����', '�ൺ', '�Ͳ�', '��ׯ', '��Ӫ', '��̨', 'Ϋ��', '����', '̩��', '����', '����', '����', '����', '����', '�ĳ�', '����', '����'];
            ctryType['�Ϻ�']=['����', '���', '����', '����', '����', '���', '����', '����', '��ɽ', '�ζ�', '�ֶ�', '��ɽ', '�ɽ�', '����', '����', '����'];
            ctryType['ɽ��']=['̫ԭ', '��ͬ', '��Ȫ', '����', '����', '˷��', '����', '�˳�', '����', '�ٷ�', '����'];
            ctryType['����']=['����', 'ͭ��', '����', '����', 'μ��', '�Ӱ�', '����', '����', '����', '����'];
            ctryType['�Ĵ�']=['�ɶ�', '�Թ�', '��֦��', '����', '����', '����', '��Ԫ', '����', '�ڽ�', '��ɽ', '�ϳ�', 'üɽ', '�˱�', '�㰲', '����', '�Ű�', '����', '����', '����', '����', '��ɽ'];
            ctryType['���']=['��ƽ', '�Ӷ�', '����', '�Ͽ�', '�ӱ�', '����', '����', '����', '����', '����', '����', '����', '����', '����', '����', '����'];
            ctryType['�½�']=['��³ľ��', '��������', '��³��', '����', '����', '��������', '��������', '������', '�������տ¶�����', '��ʲ', '����', '����', '����', '����̩', 'ʯ����', '������', 'ͼľ���', '�����'];
            ctryType['����']=['����', '����', 'ɽ��', '�տ���', '����', '����', '��֥'];
            ctryType['����']=['����', '����', '��Ϫ', '��ɽ', '��ͨ', '����', '�ն�', '�ٲ�', '����', '���', '��ɽ', '��˫����', '����', '�º�', 'ŭ��', '����'];
            ctryType['�㽭']=['����', '����', '����', '����', '����', '����', '��', '����', '��ɽ', '̨��', '��ˮ'];

            document.myform.cityList.options.length=0; 
            for (var j=0;j<ctryType[ctryName].length;j++)
            {  
                document.myform.cityList.options.add(new Option(ctryType[ctryName][j], ctryType[ctryName][j])); 
            }    
            document.myform.cityList.selectedIndex=0;  
        }  
</script>
</html>