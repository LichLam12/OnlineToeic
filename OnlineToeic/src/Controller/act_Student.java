package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;

import BEAN.Classes;
import BEAN.ScheduleInfo_Student;
import BEAN.Student;
import DAODB.LoginDAO;
import DAODB.StudentDAO;
import DB.DBConnection;

@WebServlet("/act_Student")
public class act_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public act_Student() {
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
		// int studentID_temp = Integer.parseInt(request.getParameter("studentID"));

		int studentID_temp = 1;
		// String password = request.getParameter("password");
		if (username == null) {
			Student nv = LoginDAO.DisplayInfoStudent(studentID_temp, conn);
			request.setAttribute("perinfo", nv);
			System.out.println(nv.getFullName());
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
			int studentID = Integer.parseInt(request.getParameter("studentID"));
			Student mp = StudentDAO.Display_1Student(studentID, conn);

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
				String username2 = request.getParameter("username2");
				String password = request.getParameter("password");
				String fullName = request.getParameter("fullName");
				int sex = Integer.parseInt(request.getParameter("sex"));
				String phoneNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				System.out.println(username2);
				System.out.println(password);
				System.out.println(fullName);
				System.out.println(sex);
				System.out.println(phoneNumber);
				System.out.println(email);
				System.out.println(address);

				String doB = request.getParameter("doB");
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(doB);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;

					kt = StudentDAO.AddStudent(username2, password, fullName, sex, sqlDate, phoneNumber, email, address,
							4, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}

			} else if (action == 2) { // edit
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				String username2 = request.getParameter("username2");
				String password = request.getParameter("password");
				String fullName = request.getParameter("fullName");
				int sex = Integer.parseInt(request.getParameter("sex"));
				String phoneNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("email");
				String address = request.getParameter("address");

				String doB = (String) request.getParameter("doB");
				System.out.println(doB);
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(doB);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;

					kt = StudentDAO.EditStudent(studentID, username2, password, fullName, sex, sqlDate, phoneNumber,
							email, address, 4, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else if (action == 4) { // remove
				int studentID = Integer.parseInt(request.getParameter("studentID"));

				kt = false;
				kt = StudentDAO.DeleteStudent(studentID, conn);
			} else if (action == 6) {
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				String username2 = request.getParameter("username2");
				String password = request.getParameter("password");
				String fullName = request.getParameter("fullName");
				int sex = Integer.parseInt(request.getParameter("sex"));
				String phoneNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("email");
				String address = request.getParameter("address");

				String doB = (String) request.getParameter("doB");
				System.out.println(doB);
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(doB);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;

					kt = StudentDAO.EditStudent(studentID, username2, password, fullName, sex, sqlDate, phoneNumber,
							email, address, 4, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}

				Student mp = StudentDAO.Display_1Student(studentID, conn);

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
			} else if (action == 7) { // schedule info page
				Student nv = LoginDAO.DisplayInfoStudent2(username, conn);
				request.setAttribute("perinfo", nv);
				System.out.println("a::" + username);
				List<ScheduleInfo_Student> listex = StudentDAO.DisplayScheduleInfo(Integer.parseInt(username), conn);

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

				// RequestDispatcher rd=
				// request.getRequestDispatcher("/WEB-INF/Student_Classes.jsp");
				// rd.forward(request, response);
			} else if (action == 8) { // add
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				int classID = Integer.parseInt(request.getParameter("classID"));
				double mark = Double.parseDouble(request.getParameter("mark"));

				kt = false;
				kt = StudentDAO.AddMark(studentID, classID, mark, conn);

				System.out.println(studentID + ":" + classID + ":" + mark + ":" + kt);
				return;
			} else if (action == 9) { // add
				List<Classes> list = StudentDAO.DisplayClasses(conn);
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
				return;
			}

			if (kt || str_action == null) {
				System.out.println("Success!");
				List<Student> list = StudentDAO.DisplayStudent(conn);

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
