package operation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import operation.Dbutil;


import msg.TProFather;
import msg.Tproducts;
import msg.Tson;

public class TgetInfo
{
	Connection conn=Dbutil.getConnection();
	Statement st;
	static ResultSet rs;
	
	
	//查询pro_father中的信息
	public List<TProFather> searchProFather(){
		
		String sql = "select f_id, f_name from pro_father";
		List<TProFather> list = new ArrayList<TProFather>();
		try
		{
			st = conn.createStatement();
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
			if(rs!=null){
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
	
	
	//查询详细商品信息
	public List<Tproducts> searchProducts(){
		String sql = "select g_id, g_name, s_id, g_img, g_price, g_sales from pro_gson order by g_sales desc limit 0,4";
		List<Tproducts> list = new ArrayList<>();
		Tproducts products;
		try
		{
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				products = new Tproducts(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				list.add(products);
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

	
	//grandson
		public List<Tson> searchGrandSon(int s_id){
			String sql = "select g_id, g_name, s_id, g_img from pro_gson where s_id = '"+s_id+"' ";
			List<Tson> list = new ArrayList<Tson>();
			try
			{
				st = conn.createStatement();
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
	
	public Map<String,List<Tson>> searchMap(String f_id){
		Map<String, List<Tson>> map = new HashMap<>();
		List<Tson> list = new ArrayList<Tson>();
		String sql1 = "select s_name,s_id from pro_son where f_id = '"+f_id+"'";
		try
		{
			st = conn.createStatement();
			rs = st.executeQuery(sql1);
			while(rs.next()){
				list = searchGrandSon(rs.getInt(2));
				map.put(rs.getString(1), list);
			} 
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return map;
	}
	
}
