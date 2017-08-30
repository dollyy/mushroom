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

import net.sf.json.JSONArray;


import msg.TProFather;
import msg.Tson;

public class TgetinfoServlet extends DBServlet
{
	ResultSet rs = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		
		//输出到界面上
		PrintWriter out = resp.getWriter();
		
		Tson tson;
		Tson tgson;
		List<Tson> son;
		List<Tson> gson;
		List<Tson> last = new ArrayList<Tson>();
		int gsonid;
		
		String id = req.getParameter("id");
		System.out.println(id);
		
		if (id != null){
			
			son = searchson(id);
			for(int i = 0; i < son.size(); i ++){
				tson = son.get(i);
				gsonid = tson.getS_id();
				//System.out.println(tson.getS_id()+":"+tson.getS_name());
				last.add(tson);
				
				gson = searchGrandSon(gsonid);
				for(int j = 0; j < gson.size(); j ++){
					tgson = gson.get(j);
					//加到集合中
					//last.add(tgson);
					//System.out.print(tgson.getS_id()+":"+tgson.getS_name());
					last.add(tgson);
				}
				
				//System.out.println();
			}
			
			/*JSONArray sonjson = JSONArray.fromObject(son);
			out.print(sonjson);*/
			
			JSONArray gsonjson = JSONArray.fromObject(last);
			out.print(gsonjson);
		}
		
		
	}
	
	//查询pro_father中的信息
	public List<TProFather> searchProFather(){
		String sql = "select f_id, f_name from pro_father";
		List<TProFather> list = new ArrayList<TProFather>();
		try
		{
			rs = st.executeQuery(sql);
			TProFather father ;
			while(rs.next()){
				father = new TProFather(rs.getInt(1), rs.getString(2));
				list.add(father);
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
	
	//son
	public List<Tson> searchson(String f_id){
		String sql = " select s_id, s_name, f_id, s_img from pro_son where f_id = (select f_id from pro_father where f_id = '"+f_id+"')";
		List<Tson> list = new ArrayList<Tson>();
		try
		{
			rs = st.executeQuery(sql);
			Tson son ;
			while(rs.next()){
				son = new Tson(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
				list.add(son);
			}
			if(list.size() == 0){
				return null;
			}else{
				return list;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}finally{
			try
			{
				rs.close();
			} catch (SQLException e)
			{
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		return list;
	}		
		

	//grandson
	public List<Tson> searchGrandSon(int s_id){
		String sql = "select g_id, g_name, s_id, g_img from pro_gson where s_id = (select s_id from pro_son where s_id = '"+s_id+"')";
		List<Tson> list = new ArrayList<Tson>();
		try
		{
			rs = st.executeQuery(sql);
			Tson son ;
			while(rs.next()){
				son = new Tson(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4));
				list.add(son);
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
