package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;

public class Modifycart extends DBServlet{

	//�޸���Ʒ����
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String sump=request.getParameter("sump");
		if("0".equals(sump)){
			return;
		}else{
			session.setAttribute("sump", sump);
		}
		
		String name=request.getParameter("name");
		if(name == null){
			return;
		}
		name=java.net.URLDecoder.decode(name, "utf-8");
		String num=request.getParameter("num");
		Object obj=session.getAttribute("cart");
		if(obj == null){
			System.out.println("���ﳵ�ǿյ�");
		}
		ArrayList<Cart> usercart=(ArrayList<Cart>)obj;
		for(int i=0;i<usercart.size();i++){
			Cart c=(Cart)usercart.get(i);
			if(name.equals(c.getProname())){
				c.setNum(Integer.parseInt(num));
			}
		}
	}
	
	//ɾ����Ʒ
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String name=request.getParameter("name");
		name=new String(name.getBytes("iso-8859-1"),"gbk");
		System.out.println("name:"+name);
		Object obj=session.getAttribute("cart");
		if(obj == null){
			System.out.println("���ﳵΪ��");
		}
		ArrayList<Cart> usercart=(ArrayList<Cart>)obj;
		for(int i=0;i<usercart.size();i++){
			Cart c=(Cart)usercart.get(i);
			if(name.equals(c.getProname())){
				usercart.remove(c);
				break;
			}
		}
		session.setAttribute("cart", usercart);
		response.sendRedirect("web/cart.jsp");
	}
}
