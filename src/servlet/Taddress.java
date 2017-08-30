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

import msg.Tadds;

import operation.DB;

public class Taddress extends DBServlet
{
	ResultSet rs = null;
	List<Tadds> list;
	Tadds address;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setHeader("Content-Type", "text-html;charset=UTF-8");
		
		//�����������
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String searchadd = req.getParameter("search");
		System.out.println(searchadd);
		if(searchadd != null){
			list = searchAdds("1");
			session.setAttribute("addresses", list);
			resp.sendRedirect("web/Taddress.jsp");
		}
		
		//ɾ���ջ���ַ
		String remove = req.getParameter("remove");
		String username = "1";
		String recname = req.getParameter("recname");
		String tel = req.getParameter("tel");
		String adds = req.getParameter("adds");
		if(adds != null){
			adds = new String(adds.getBytes("iso-8859-1"),"UTF-8");
		}
		if(remove != null){
			//System.out.println(recname+"-"+tel+"-"+adds);
			removeAdd(username, recname, tel, adds);
			list = searchAdds("1");
			session.setAttribute("addresses", list);
			resp.sendRedirect("web/Taddress.jsp");
		}
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setHeader("Content-Type", "text-html;charset=UTF-8");
		
		//�����������
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String username = "1";
		String recname = req.getParameter("recvname");
		String tel = req.getParameter("recvtel");
		String adds = req.getParameter("area");
		System.out.println(recname+":"+tel+":"+adds);
		if(username != null && recname != null){
			
			list = searchAdds(username);
			for(int i = 0; i < list.size(); i ++){
				address = list.get(i);
				if(address.getAdd().equals(adds) && address.getRecname().equals(recname) && address.getRectel().equals(tel)){
					System.out.println("���и��û�");
					out.print(-1);
					break;
				}else{
					int a = insertAddress(username, recname, tel, adds);
					if (a == 0){
						System.out.println("��ӳɹ�");
						list = searchAdds("1");
						session.setAttribute("addresses", list);
						/*resp.sendRedirect("web/Taddress.jsp");*/
						out.print(0);
					}
				}
			}
		}
	}
	
	/*ɾ���ջ���ַ*/
	public void removeAdd(String username, String recname, String tel, String adds){
		String sql = "delete from address where username = '"+username+"' and recname = '"+recname+"' and tel = '"+tel+"' and adds = '"+adds+"'";
		try
		{
			int rs = st.executeUpdate(sql);
			if(rs > 0){
				System.out.println("ɾ���ɹ�");
			}else{
				System.out.println("ɾ��ʧ��");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	/*���ҵ�ǰ�û��������ջ���ַ*/
	public List<Tadds> searchAdds(String username){
		List<Tadds> list = new ArrayList<Tadds>();
		Tadds address = new Tadds(); 
		String sql = "select username, recname, tel, adds from address where username = '1'";
		try
		{
			rs = st.executeQuery(sql);
			while(rs.next()){
				address = new Tadds(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list.add(address);
			}
			if(list.size() != 0){
				return list;
			}else{
				return null;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/*�����µ�ַ*/
	public int insertAddress(String username, String recname, String tel, String add){
		int flag = -2;
		String sql = "insert into address (username,recname,tel,adds) values ('"+username+"','"+recname+"','"+tel+"','"+add+"')";
		System.out.println(sql);
		try
		{
			int rs = st.executeUpdate(sql);
			if (rs > 0){
				flag = 0;
			}else{
				flag = -1;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
}
