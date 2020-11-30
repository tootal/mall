package servlet.before;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDTO;
import service.BeforeUserService;

@WebServlet("/before_register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bemail = request.getParameter("bemail");
		String bpwd = request.getParameter("bpwd");
		String code1 = request.getParameter("code");
		String flag = request.getParameter("flag");
		HttpSession session = request.getSession(true);
		//获取验证码
		String code2 = (String)session.getAttribute("rand");
		//实体
		UserDTO ud = new UserDTO();
		ud.setBemail(bemail);
		ud.setBpwd(bpwd);
		//业务
		BeforeUserService bs = new BeforeUserService();
		RequestDispatcher rds = null;
		if("register".equals(flag)) {
			if (bs.register(ud)) {
				rds = request.getRequestDispatcher("beforeUser/userLogin.jsp");
			} else {
				rds = request.getRequestDispatcher("beforeUser/register.jsp");
			}
			rds.forward(request, response);
		} else if ("check_email".equals(flag)) {
			List<Map<String, Object>> list = bs.isExit(ud);
			PrintWriter out = response.getWriter();
			if(list.size() > 0) {
				out.print("email_registered");
			} else {
				out.print("email_not_registered");
			}
		}
	}
}
