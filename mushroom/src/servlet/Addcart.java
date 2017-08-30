package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;

public class Addcart extends DBServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String num=request.getParameter("num");
		name=java.net.URLDecoder.decode(name, "utf-8");
		price=java.net.URLDecoder.decode(price, "utf-8");
		
		System.out.println(name+","+price);
		
		Object obj2=session.getAttribute("pro");
		if(obj2 == null){
			System.out.println("allpro is null");
		}
		String img = null;
		Map<String, ArrayList<Cart>> allpro=(HashMap<String, ArrayList<Cart>>)obj2;
		Iterator it=allpro.keySet().iterator();
		while(it.hasNext()){
			String key=it.next().toString();
			ArrayList<Cart> pro=(ArrayList<Cart>)allpro.get(key);
			for(int i=0;i<pro.size();i++){
				Cart c=(Cart)pro.get(i);
				if(name.equals(c.getProname())){
					img=c.getImgs();
				}
			}
		}
		
		Object obj=session.getAttribute("cart");
		if(obj == null){
			ArrayList<Cart> usercart=new ArrayList<Cart>();
			Cart pro=new Cart();
			pro.setProname(name);
			pro.setNum(Integer.parseInt(num));
			pro.setPrice(Integer.parseInt(price));
			pro.setImgs(img);
			usercart.add(pro);
			session.setAttribute("cart", usercart);
		}else{
			boolean flag=true;
			ArrayList<Cart> usercart=(ArrayList<Cart>)obj;
			for(int i=0;i<usercart.size();i++){
				Cart c=(Cart)usercart.get(i);
				if(name.equals(c.getProname())){
					int num1=c.getNum();
					int num2=Integer.valueOf(num);
					c.setNum(num1+num2);
					flag=false;
					break;
				}
			}
			if(flag){
				Cart pro=new Cart();
				pro.setProname(name);
				pro.setNum(Integer.parseInt(num));
				pro.setPrice(Integer.parseInt(price));
				pro.setImgs(img);
				usercart.add(pro);
			}
			session.setAttribute("cart", usercart);
		}
	}
}