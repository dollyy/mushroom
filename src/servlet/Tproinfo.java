package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Tproducts;

//点击具体商品进去详细页面的推荐兄弟功能。
public class Tproinfo extends DBServlet
{
	ResultSet rs = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		
		String proname = req.getParameter("pinfo");
		if(proname != null){
			proname = new String(proname.getBytes("iso-8859-1"),"gbk");
		}
		System.out.println(proname);
		
		String id = null;
		
		if(proname != null){
			Tproducts pro ;
			pro = searchTproducts(proname);
			int proid = pro.getG_id();
			
			//System.out.println(proid);
			String id2 = String.valueOf(proid);
			//System.out.println(id2);
			
			id = id2.substring(0, 4) + "00";
			System.out.println(id);
			
			List<Tproducts> infolist = searchProducts(id,proname);
			session.setAttribute("prodlist", infolist);
			session.setAttribute("proinfo", pro);
			resp.sendRedirect("web/Tproinfo.jsp");
		}
	}

	
	//查看商品的对象所有信息
	public Tproducts searchTproducts(String g_name){
		Tproducts p = new Tproducts();
		String sql = "select g_id, g_name, s_id, g_img, g_price, g_sales from pro_gson where g_name = '"+g_name+"'";
		try
		{
			rs = st.executeQuery(sql);
			while(rs.next()){
				p = new Tproducts(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
			}
			return p;
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return p;
	}
	
	//查询商品信息的兄弟
	public List<Tproducts> searchProducts(String s_id,String g_name){
		String sql = "select g_id, g_name, s_id, g_img, g_price, g_sales from pro_gson where s_id = '"+s_id+"' order by g_sales desc";
		List<Tproducts> list = new ArrayList<>();
		Tproducts products;
		try
		{
			rs = st.executeQuery(sql);
			/*while(rs.next()){
				products = new Tproducts(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				System.out.println(products.getG_name());
				list.add(products);
			}
			*/
			int i = 0;
			while(rs.next()){
				if(g_name.equals(rs.getString(2))){
					continue;
				}
				products = new Tproducts(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				list.add(products);
				i++;
				if(i == 4){
					break;
				}
			}
			if(list.size() == 0){
				return null;
			}else{
				return list;
			}

		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
