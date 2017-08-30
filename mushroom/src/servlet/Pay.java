package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;

public class Pay extends DBServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1324");
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("order");
		if(obj == null){
			return;
		}
		String add=request.getParameter("add");		//��ȡ��ַ
		String name=request.getParameter("name");	//��ȡ�ջ���
		String phone=request.getParameter("phone");	//��ȡ�绰
		int sumnum=0,sumprice=0;					//sumnumΪ�ܼ���,sumpriceΪ�ܼ�
		long time=session.getLastAccessedTime()/1000;
		String orderid=(session.getId()).substring(0,5)+String.valueOf(time).substring(5, 10);	//��ȡ�������
		
		try {
			con.setAutoCommit(false);
			ArrayList<Cart> userorder=(ArrayList<Cart>)obj;
			for(int i=0;i<userorder.size();i++){
				Cart c=(Cart)userorder.get(i);
				System.out.println(c.getProname()+","+c.getNum()+","+c.getPrice());
				st.execute(String.format("insert into detail values('%s','%s',%d,%d)",orderid,c.getProname(),c.getNum(),c.getPrice()*c.getNum()));
				sumnum+=c.getNum();
				sumprice+=c.getPrice()*c.getNum();
			}
			st.execute(String.format("insert into orders values('%s','%s','%s','%s',%d,%d)",orderid,name,add,phone,sumnum,sumprice));
			
			//���ѹ������Ʒ�ӹ��ﳵ�����
			Object obj2=session.getAttribute("cart");
			if(obj2 == null){
				System.out.println("���˵�ʱ���ﳵ�ǿյ�");
			}
			ArrayList<Cart> usercart=(ArrayList<Cart>)obj2;
			for(int i=0;i<userorder.size();i++){
				Cart order=(Cart)userorder.get(i);
				for(int j=0;j<usercart.size();j++){
					Cart cart=(Cart)usercart.get(j);
					if(order.getProname().equals(cart.getProname())){
						usercart.remove(cart);
						break;
					}
				}
			}
			session.setAttribute("cart", usercart);		//�����޸Ĺ���Ĺ��ﳵ
			
			//���û��������
			for(int i=0;i<userorder.size();i++){
				userorder.clear();
			}
			con.commit();
			response.sendRedirect("web/paysuccess.jsp");
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
}