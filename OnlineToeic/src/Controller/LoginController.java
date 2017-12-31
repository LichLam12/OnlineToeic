package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Student;
import BEAN.User;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter(); // Ä‘á»ƒ cho code gá»�n hÆ¡n

		
		String login_active=request.getParameter("active");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println(username);
		System.out.println(password);
		int kt = 0;
		kt = LoginDAO.LoginUser(username, password, conn);
		System.out.println(kt);

		if(kt==4){
				Student student = LoginDAO.DisplayInfoStudent2(username, conn);
				request.setAttribute("perinfo", student);
		}else if(kt==1 || kt==2 || kt==3) {
				User user = LoginDAO.DisplayInfoUser(username, conn);
				request.setAttribute("perinfo", user);
		}
		
		if(login_active!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/index_logined.jsp");
			rd.forward(request, response);
		}
		
		if (kt == 4) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Student_perinfo.jsp");
			rd.forward(request, response);

		} else if (kt == 1) {
			
//			response.sendRedirect("Forward_ToLogin"); 
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Admin_perinfo.jsp");
			rd.forward(request, response);

		} else if (kt == 2) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/QuesManager_perinfo.jsp");
			rd.forward(request, response);
		} else if (kt == 3) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ExamManager_perinfo.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("message", "Login Failed");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/index.jsp");
			rd.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
