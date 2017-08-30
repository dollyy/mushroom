package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import msg.Cart;
import msg.Msg;
import msg.Tadds;

public class Login extends DBServlet{

	HttpSession session;
	String user;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session=request.getSession();
		PrintWriter out=response.getWriter();
		
		List<Msg> msg=new ArrayList<Msg>();
		boolean flag=true;
		String rem=request.getParameter("rem");
		user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		String code=request.getParameter("code");
		String codeRe=request.getParameter("codeRe");
		user=java.net.URLDecoder.decode(user,"utf-8");	//处理汉字乱码问题
		if(!code.equals(codeRe)){		//用户填写验证码 或 刷新验证码 时判断
			out.write("-3");
			return;
		}
		try {
			ResultSet rs=st.executeQuery("select u_user,u_pwd from user");
			while(rs.next()){
				Msg u=new Msg();
				u.setUser(rs.getString(1));
				u.setPwd(rs.getString(2));
				msg.add(u);
			}
			for(int i=0;i<msg.size();i++){
				Msg u=(Msg)msg.get(i);
				if(user.equals(u.getUser())){
					flag=false;
					if(pwd.equals(u.getPwd())){		//匹配成功
						getCart();					//获取该用户购物车里的商品
						getAdd();
						session.setAttribute("user", user);	//将登陆成功后的用户名存进session
						if("true".equals(rem)){		//需要记住密码
							Cookie uc=new Cookie("user", user);
							Cookie pc=new Cookie("pwd", pwd);
							uc.setMaxAge(120);
							pc.setMaxAge(120);
							response.addCookie(uc);
							response.addCookie(pc);
						}
						out.write("0");
					}else{							//密码错误
						out.write("-1");
					}
				}
			}
			if(flag){								//用户名不存在
				out.write("-2");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("exit");
		HttpSession session=request.getSession();
		System.out.println(1);
		String exit=request.getParameter("exit");
		System.out.println(2);
		if("byebye".equals(exit)){
			System.out.println(3);
			session.removeAttribute("user");
			session.invalidate();
			System.out.println(4);
			Cookie cookie[]=request.getCookies();
			System.out.println(5);
			for(int i=0;i<cookie.length;i++){
				System.out.println(6);
				System.out.println("name:"+cookie[i].getName()+",value:"+cookie[i].getValue());
				System.out.println(7);
				if("user".equals(cookie[i].getName())){
					System.out.println(8);
					cookie[i].setMaxAge(0);
					System.out.println(9);
					response.addCookie(cookie[i]);
					System.out.println(10);
					break;
				}
			}
		}
		response.sendRedirect("web/main.jsp");
	}
	
	void getCart(){
		List<Cart> usercart=new ArrayList<Cart>();
		try {
			ResultSet rs=st.executeQuery(String.format("select c_proname,c_price,c_num,c_img from cart where c_username='%s'",user));
			while(rs.next()){
				System.out.println(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3));
				Cart c=new Cart();
				c.setProname(rs.getString(1));
				c.setPrice(rs.getInt(2));
				c.setNum(rs.getInt(3));
				c.setImgs(rs.getString(4));
				usercart.add(c);
			}
			session.setAttribute("cart", usercart);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	void getAdd(){
		List<Tadds> useradd=new ArrayList<Tadds>();
		try {
			ResultSet rs=st.executeQuery(String.format("select recname,tel,adds from address where username='%s'",user));
			while(rs.next()){
				System.out.println(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3));
				Tadds t=new Tadds();
				System.out.println(rs.getString(1)+","+rs.getString(2)+","+rs.getString(3));
				t.setRecname(rs.getString(1));
				t.setRectel(rs.getString(2));
				t.setAdd(rs.getString(3));
				useradd.add(t);
			}
			session.setAttribute("add", useradd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}