package operation;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MFilter extends DB implements Filter{
	
	HttpSession session;
	
	public void destroy() {
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		session=request.getSession();
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		
		arg2.doFilter(request, response);
	}
	
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}