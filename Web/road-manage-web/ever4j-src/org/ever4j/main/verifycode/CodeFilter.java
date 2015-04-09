package org.ever4j.main.verifycode;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ever4j.utils.ApplicationUtils;

public class CodeFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		if("1".equals(ApplicationUtils.getAttribute("sysbaseConfig_verifycodeShow"))){
			
			HttpSession session = request.getSession();
			String targetCode = (String) session.getAttribute("verifyCode");
			String code = request.getParameter("j_code");
			String msg = "验证码输入有误!";
			if (targetCode != null && !"".equals(targetCode)) {
				if (code.equalsIgnoreCase(targetCode)) {
					filterChain.doFilter(request, response);
				} else {
					session.setAttribute("msg", msg);
					response.sendRedirect(request.getContextPath()+"/login.jsp?login_error=true");
				}
			} else {
				session.setAttribute("msg", msg);
				response.sendRedirect(request.getContextPath()+"/login.jsp?login_error=true");
			}
		}else{
			filterChain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
