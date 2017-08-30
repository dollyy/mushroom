package operation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Dbutil
{
	static DataSource ds;
	static Context c;
	//1、注册驱动/加载驱动类
		static{
		
				try
				{
					c = new InitialContext();
					ds = (DataSource) c.lookup("java:/comp/env/jdbc/db");
					
				} catch (NamingException e)
				{
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				
			 
		}
		
		//2、获取数据库连接
		public static  Connection getConnection(){
			Connection con = null;
			try
			{
				con = ds.getConnection();
			} catch (SQLException e)
			{
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			return con;	
		}
		
		//3、关闭
		public static void close(Connection con, Statement  stmt, ResultSet rs) throws SQLException{
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(con != null){
				con.close();
			}
		}
}
