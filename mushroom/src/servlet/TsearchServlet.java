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
import net.sf.json.JSONArray;

public class TsearchServlet extends DBServlet
{
	ResultSet rs = null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		//输出到界面上
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String a[] = null;
		List<Tproducts> list = null;
		
		String name = req.getParameter("name");
		name=new String(name.getBytes("gbk"),"utf-8");
		System.out.println(name+"===");
		if(name != null){
			a = Search(name);
			JSONArray jsonarray = JSONArray.fromObject(a);
			System.out.println(jsonarray);
			out.print(jsonarray);
		}
		
		String search = req.getParameter("search");
		if(search != null){
			System.out.println(search);
			list = searchGrandSon(search);
			session.setAttribute("searchinfo", list);
			
			resp.sendRedirect("web/Tsearchinfo.jsp");
		}
		
	}
	
	
	public String[] Search(String name){
		String sql = "select g_name from pro_gson where g_name like '%"+name+"%' ";
		System.out.println(sql);
		List<String> list = new ArrayList<String>();
		try
		{
			rs = st.executeQuery(sql);
			while(rs.next()){
				list.add(rs.getString(1));
			}
			if(list != null && list.size()>0){
				String arr[] = new String[list.size()];
				for(int i = 0; i < list.size(); i ++){
					arr[i] = list.get(i);
				}
				
				return arr;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//查找商品详细信息
	public List<Tproducts> searchGrandSon(String g_name){
		String sql = "select g_id, g_name, s_id, g_img, g_price, g_sales from pro_gson where g_name like '%"+g_name+"%' ";
		List<Tproducts> list = new ArrayList<Tproducts>();
		try
		{
			rs = st.executeQuery(sql);
			Tproducts pro ;
			while(rs.next()){
				pro = new Tproducts(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				list.add(pro);
			}
			if(list.size() == 0){
				return null;
			}else{
				return list;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}finally{
			try
			{
				rs.close();
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
	}	
}
