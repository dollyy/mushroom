package servlet;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

public class DBServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected Statement st;
	protected Connection con;
	
	public void init() throws ServletException {
		super.init();
		try {
			Context c=new InitialContext();
			DataSource ds=(DataSource)c.lookup("java:/comp/env/jdbc/db");
			con=ds.getConnection();
			st=con.createStatement();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}