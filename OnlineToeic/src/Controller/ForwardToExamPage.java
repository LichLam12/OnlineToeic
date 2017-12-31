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

import BEAN.Student;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/ForwardToExamPage")
public class ForwardToExamPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForwardToExamPage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter(); // để cho code gọn hơn

		String examID = request.getParameter("examID");
		String className = request.getParameter("className");
		String studentID = request.getParameter("studentID");
		System.out.println(studentID);
		if (studentID != null) {
			Student nv = LoginDAO.DisplayInfoStudent(Integer.parseInt(studentID), conn);
			request.setAttribute("perinfo", nv);
			request.setAttribute("examID", examID);
			request.setAttribute("className", className);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/ExamPage2.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("perinfo", "Not User");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/index.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
