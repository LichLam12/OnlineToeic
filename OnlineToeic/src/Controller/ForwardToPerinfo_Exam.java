package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.User;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/ForwardToPerinfo_Exam")
public class ForwardToPerinfo_Exam extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForwardToPerinfo_Exam() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter(); //để cho code gọn hơn
		
		 String username = request.getParameter("username");
		 if(username!=null) {
			 User nv=LoginDAO.DisplayInfoUser(username, conn);
			 request.setAttribute("perinfo", nv);

			 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ExamManager_perinfo.jsp");
			rd.forward(request, response);
		 }
		 else {
			 request.setAttribute("perinfo", "Not User");
			 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/index.jsp");
			 rd.forward(request, response);
		 }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
