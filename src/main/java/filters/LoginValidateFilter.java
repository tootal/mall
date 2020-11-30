package filters;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginValidateFilter implements Filter {
	public static final Log log = LogFactory.getLog(LoginValidateFilter.class);
	public void destroy() {}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		resp.setContentType("text/html;");
		resp.setCharacterEncoding("UTF-8");
		// 得到用户请求的URI
		String request_uri = req.getRequestURI();
		// 得到web应用程序的上下文路径
		String ctxPath = req.getContextPath();
		log.info("ctx: " + request_uri);
		// 去除上下文路径，得到剩余部分的路径
		String uri = request_uri.substring(ctxPath.length());
		log.info("uri: " + request_uri);
		boolean adminflag = false;
		boolean beforeflag = false;
		// 默认主页或css文件、图片文件、JS
		if ("/".equals(uri) || uri.contains("css") || uri.contains("jsjs") || uri.contains("images") || uri.contains("uploadFile")) {
			chain.doFilter(request, response);
		}
		// JSP请求
		if (uri.contains(".jsp")) {
			// admin文件夹
			if (uri.contains("admin/")) {
				if (uri.contains("login.jsp") || null != session.getAttribute("admin")
						|| uri.contains("loginerror.jsp")) {
					chain.doFilter(request, response);
				} else {
					adminflag = true;
				}
			}
			// before文件夹
			else if (uri.contains("beforeUser/")) {
				if (null != session.getAttribute("user") || uri.contains("register.jsp") || // 注册页面
						uri.contains("userLogin.jsp") || // 登录
						uri.contains("searchResult.jsp")// 搜索结果页面
				) {
					chain.doFilter(request, response);
				} else {
					beforeflag = true;
				}
			}
			// 除admin和beforeUser以外的JSP
			else {
				chain.doFilter(request, response);
			}
		} // JSP请求结束
			// servlet请求
		else {
			// 后台管理的servlet请求
			if (uri.contains("admin_")) {
				if (uri.contains("_login") || null != session.getAttribute("admin")) {
					chain.doFilter(request, response);
				} else {
					adminflag = true;
				}
			}
			// 前台的servlet请求
			else if (uri.contains("before_")) {
				if (null != session.getAttribute("user") || uri.contains("_first") || // 首页
						uri.contains("_detail") || // 商品详情
						uri.contains("_userLogin") || // 登录
						uri.contains("_userLogout") || // 注销
						uri.contains("_search") || // 头部搜索
						uri.contains("_register") // 注册
				) {
					chain.doFilter(request, response);
				} else {
					beforeflag = true;
				}
			}
		} // servlet请求结束
		if (beforeflag) {// 前台没有登录
			RequestDispatcher rds = request.getRequestDispatcher("beforeUser/userNoLogin.jsp");
			rds.forward(request, response);
			return;
		}
		if (adminflag) {// 后台没有登录
			RequestDispatcher rds = request.getRequestDispatcher("admin/login.jsp");
			rds.forward(request, response);
			return;
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
