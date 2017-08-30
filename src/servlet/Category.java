package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;

public class Category extends DBServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		Map<String, ArrayList<Cart>> allpro=new HashMap<String, ArrayList<Cart>>();
		ArrayList<Cart> pro=new ArrayList<Cart>();
		String id1,id2 = null;
		try {
			ResultSet rs=st.executeQuery(String.format("SELECT s_name,g_name,g_price,g_img from pro_son,pro_gson WHERE pro_son.s_id=pro_gson.s_id and pro_son.f_id='%s'",id));
			while(rs.next()){
				Cart c=new Cart();
				c.setProname(rs.getString(2));
				c.setPrice(rs.getInt(3));
				c.setImgs(rs.getString(4));
				id1=rs.getString(1);
				if(id2 == null){
					id2=id1;
					pro.add(c);
					allpro.put(id2, pro);
				}else{
					if(id2.equals(id1)){
						pro.add(c);
					}else{
						allpro.put(id2, pro);
						id2=id1;
						pro=new ArrayList<Cart>();
						pro.add(c);
						allpro.put(id2, pro);
					}
				}
			}
			session.setAttribute("pro", allpro);
			response.sendRedirect("web/category.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}