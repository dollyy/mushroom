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

import msg.Msg;

public class Forget extends DBServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user=request.getParameter("user");
		String qs=request.getParameter("qs");
		String ans=request.getParameter("ans");
		String pwd1=request.getParameter("pwd1");
		String pwd2=request.getParameter("pwd2");
		PrintWriter out=response.getWriter();
		
		if(ans != null){				//��ҳ��һ�ύ����
			user=java.net.URLDecoder.decode(user, "utf-8");
			qs=java.net.URLDecoder.decode(qs, "utf-8");
			ans=java.net.URLDecoder.decode(ans, "utf-8");
			System.out.println(user+","+qs+","+ans);
			boolean flag=true;
			List<Msg> msg=new ArrayList<Msg>();
			try {
				ResultSet rs=st.executeQuery("select u_user,u_pwd,u_q,u_ans from user");
				while(rs.next()){
					Msg m=new Msg();
					m.setUser(rs.getString(1));
					m.setPwd(rs.getString(2));
					m.setQ(rs.getString(3));
					m.setAns(rs.getString(4));
					msg.add(m);
				}
				for(int i=0;i<msg.size();i++){
					Msg m=(Msg)msg.get(i);
					if(user.equals(m.getUser())){
						flag=false;
						if(qs.equals(m.getQ())){
							if(m.getAns().equals(ans)){
								out.write("0");//�û��ҵ�,�����,�𰸶�,�����޸�����
								return;
							}else{
								out.write("-3");//�û��ҵ�,�����,�𰸲���,�������޸�����
							}
						}else{
							out.write("-2");	//�û��ҵ�,���ⲻ��,�������޸�����
							return;
						}
					}
				}
				if(flag){	//�û�û�ҵ�
					out.write("-1");
					return;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(pwd1 != null){
			pwd1=java.net.URLDecoder.decode(pwd1, "utf-8");
			pwd2=java.net.URLDecoder.decode(pwd2, "utf-8");
			user=java.net.URLDecoder.decode(user, "utf-8");
			if(pwd1.equals(pwd2)){
				try {
					st.execute(String.format("update user set u_pwd='%s' where u_user='%s'",pwd1,user));
				} catch (SQLException e) {
					e.printStackTrace();
				}
				out.write("-4");	//������ͬ,�޸�����
			}else{
				out.write("-5");	//�������벻��ͬ
			}
		}	
	}
}
