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

import BEAN.ContentGroup;
import BEAN.Question;
import BEAN.User;
import DAODB.ContentGrDAO;
import DAODB.LoginDAO;
import DAODB.QuestionDAO;
import DB.DBConnection;

@WebServlet("/act_Question")
public class act_Question extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public act_Question() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter(); // để cho code gọn hơn

		//
		String username = request.getParameter("username");
		// String password = request.getParameter("password");
		if (username != null) {
			User nv = LoginDAO.DisplayInfoUser(username, conn);
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

		if (action == 3) // display one
		{
			int questionID = Integer.parseInt(request.getParameter("questionID"));
			Question mp = QuestionDAO.Display_1Question(questionID, conn);

			System.out.println(mp.getContentGrName());

			if (mp != null) {
				response.setContentType("application/json");
				// Import gson-2.2.2.jar
				Gson gson = new Gson();
				String objectToReturn = gson.toJson(mp); // Convert List -> Json
				out.write(objectToReturn); // Đưa Json trả về Ajax
				out.flush();
				// response.getWriter().write(objectToReturn);
			} else {
				response.setContentType("application/json");
				out.write("{\"check\":\"fail\"}");
				out.flush();
			}
			return;
		} else {
			boolean kt = false;
			if (action == 1) { // add
				String content = request.getParameter("content");
				String contentGrName = request.getParameter("contentGrName");
				System.out.println(content);
				System.out.println(contentGrName);

				kt = false;
				kt = QuestionDAO.AddQuestion(content, contentGrName, conn);
				System.out.println(kt);

			} else if (action == 2) { // edit
				int questionID = Integer.parseInt(request.getParameter("questionID"));
				String content = request.getParameter("content");
				String contentGrName = request.getParameter("contentGrName");
				System.out.println(questionID);
				System.out.println(content);
				System.out.println(contentGrName);
				kt = false;
				kt = QuestionDAO.EditQuestion(questionID, content, contentGrName, conn);

				System.out.println(kt);
			} else if (action == 4) { // remove
				int questionID = Integer.parseInt(request.getParameter("questionID"));
				System.out.println(questionID);
				kt = false;
				kt = QuestionDAO.DeleteQuestion(questionID, conn);
			} else if (action == 5) {
				List<ContentGroup> listex = ContentGrDAO.DisplayContentGroup(conn);

				if (!listex.isEmpty()) {
					response.setContentType("application/json");
					// Import gson-2.2.2.jar
					Gson gson = new Gson();
					String objectToReturn = gson.toJson(listex); // Convert List -> Json
					out.write(objectToReturn); // Đưa Json trả về Ajax
					out.flush();
					// response.getWriter().write(objectToReturn);
				} else {
					response.setContentType("application/json");
					out.write("{\"check\":\"fail\"}");
					out.flush();
				}
				return;
			}

			if (kt || str_action == null) {
				System.out.println("Success!");
				List<Question> list = QuestionDAO.DisplayQuestion(conn);

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
