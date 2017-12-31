package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;

import BEAN.QuesList_Exam;
import BEAN.Ques_ALLOption;
import BEAN.Student;
import BEAN.User;
import DAODB.ExamPageDAO;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/act_ExamPage")
public class act_ExamPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public act_ExamPage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter(); // để cho code gọn hơn

		//
		String username = request.getParameter("studentID");
		// String password = request.getParameter("password");
		if (username != null) {
			Student nv = LoginDAO.DisplayInfoStudent(Integer.parseInt(username), conn);
			request.setAttribute("perinfo", nv);
		} else {
			request.setAttribute("perinfo", "Not User");
		}
		//

		String str_action = request.getParameter("action");
		int action = 0;
		if (str_action != null) {
			action = Integer.parseInt(request.getParameter("action"));
			System.out.println(action);
		}
		System.out.println(str_action);

		if (action == 1) { // add
			int examID = Integer.parseInt(request.getParameter("examID"));
			String className = request.getParameter("className");
			
			System.out.println("className: "+className);

			List<QuesList_Exam> list = ExamPageDAO.DisplayQuesList_Exam(examID,className, conn);
			
			System.out.println("Success!");
			for(int i=0;i<list.size();i++) {
				System.out.println("cau hoi "+list.get(i).getQuestionID());
				System.out.println(list.get(i).getContentques());
			}
			if (!list.isEmpty()) {
				response.setContentType("application/json");
				// Import gson-2.2.2.jar
				Gson gson = new Gson();
				String objectToReturn = gson.toJson(list); // Convert List -> Json
				out.write(objectToReturn); // Đưa Json trả về Ajax
				out.flush();
				// response.getWriter().write(objectToReturn);
			} else {
				response.setContentType("application/json");
				out.write("{\"check\":\"fail\"}");
				out.flush();
			}
		} else if (action == 2) { // edit
			int questionID = Integer.parseInt(request.getParameter("questionID"));
			System.out.println(questionID);

			List<Ques_ALLOption> list = ExamPageDAO.DisplayQues_ALLOption(questionID, conn);
			
			for(int i=0;i<list.size();i++) {
				System.out.println("option thu "+list.get(i).getOptionID());
				System.out.println(list.get(i).getContentOp());
			}
			
			System.out.println("Success!");
			if (!list.isEmpty()) {
				response.setContentType("application/json");
				// Import gson-2.2.2.jar
				Gson gson = new Gson();
				String objectToReturn = gson.toJson(list); // Convert List -> Json
				out.write(objectToReturn); // Đưa Json trả về Ajax
				out.flush();
				// response.getWriter().write(objectToReturn);
			} else {
				response.setContentType("application/json");
				out.write("{\"check\":\"fail\"}");
				out.flush();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
