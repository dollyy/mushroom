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
	//1��ע������/����������
		static{
		
				try
				{
					c = new InitialContext();
					ds = (DataSource) c.lookup("java:/comp/env/jdbc/db");
					
				} catch (NamingException e)
				{
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
				
			 
		}
		
		//2����ȡ���ݿ�����
		public static  Connection getConnection(){
			Connection con = null;
			try
			{
				con = ds.getConnection();
			} catch (SQLException e)
			{
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
			return con;	
		}
		
		//3���ر�
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
