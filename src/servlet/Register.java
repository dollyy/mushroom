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

public class Register extends DBServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String qs=request.getParameter("qs");
		String ans=request.getParameter("ans");
		user=java.net.URLDecoder.decode(user, "utf-8");	//处理中文乱码
		pwd=java.net.URLDecoder.decode(pwd, "utf-8");	//处理中文乱码
		qs=java.net.URLDecoder.decode(qs,"utf-8");		//处理中文乱码
		ans=java.net.URLDecoder.decode(ans, "utf-8");	//处理中文乱码
		List<String> users=new ArrayList<String>();
		try {
			ResultSet rs=st.executeQuery("select u_user from user");
			while(rs.next()){
				users.add(rs.getString(1));
			}
			for(int i=0;i<users.size();i++){
				if(users.get(i).equals(user)){			//用户名重复
					out.write("-1");
					return;
				}
			}
			st.execute(String.format("insert into user values('%s','%s','%s','%s')",user,pwd,qs,ans));
			out.write("0");								//注册成功
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}