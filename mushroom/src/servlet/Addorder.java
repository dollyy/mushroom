package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;

public class Addorder extends DBServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1);
		HttpSession session=request.getSession();
		System.out.println(2);
		String names[]=request.getParameterValues("check");
		System.out.println(3);
		ArrayList<Cart> userorder=new ArrayList<Cart>();
		System.out.println(4);
		
		Object obj=session.getAttribute("cart");
		System.out.println(5);
		if(obj == null){
			System.out.println("cart is null");
		}
		System.out.println(6);
		ArrayList<Cart> usercart=(ArrayList<Cart>)obj;
		System.out.println(7);
		for(Cart c:usercart){
			for(String n:names){
				System.out.println(n+","+c.getProname());
				if(n.equals(c.getProname())){
					userorder.add(c);
					break;
				}
			}
		}
		System.out.println(8);
		session.setAttribute("order", userorder);
		System.out.println(9);
		response.sendRedirect("web/order.jsp");
	}
}
