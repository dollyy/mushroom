package operation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import msg.Cart;
import msg.TProFather;
import msg.Tproducts;

public class SessionListener extends DB implements HttpSessionListener,HttpSessionAttributeListener{
	String user;
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		HttpSession session=arg0.getSession();
		Object obj=session.getAttribute("user");
		if(obj == null){
			System.out.println("user is null");
			return;
		}
		user=obj.toString();
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		HttpSession session=arg0.getSession();
		Object obj=session.getAttribute("cart");
		if(obj == null){
			System.out.println("cart is null,exit without db");
			return;
		}
		ArrayList<Cart> usercart=(ArrayList<Cart>)obj;
		if(!getCon()){
			System.out.println("数据库连接失败");
		}
		try {
			st.execute(String.format("delete from cart where c_username='%s'",user));
			for(int i=0;i<usercart.size();i++){
				Cart c=(Cart)usercart.get(i);
				st.execute(String.format("insert into cart values('%s','%s',%d,%d,'%s')",user,c.getProname(),c.getPrice(),c.getNum(),c.getImgs()));
			}
			for(int i=0;i<usercart.size();i++){
				usercart.remove(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
	}

	public void sessionCreated(HttpSessionEvent arg0) {
	/*	HttpSession session = arg0.getSession();
		TgetInfo info = new TgetInfo();
		
		//大类列表
		List<TProFather> fatherlist = info.searchProFather();
		session.setAttribute("fatherlist", fatherlist);
		
		//查找商品详细信息
		List<Tproducts> products = info.searchProducts();
		session.setAttribute("products", products);*/
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
	}

}
