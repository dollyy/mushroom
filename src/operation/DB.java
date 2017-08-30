package operation;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB {
	
	protected Statement st;
	boolean getCon(){
		Context c;
		try {
			c = new InitialContext();
			DataSource ds=(DataSource)c.lookup("java:/comp/env/jdbc/db");
			Connection con=ds.getConnection();
			st=con.createStatement();
			return true;
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
