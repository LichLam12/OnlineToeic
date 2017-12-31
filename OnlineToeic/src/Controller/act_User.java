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

import BEAN.Authority;
import BEAN.Examination;
import BEAN.Student;
import BEAN.User;
import DAODB.AuthorityDAO;
import DAODB.ExaminationDAO;
import DAODB.LoginDAO;
import DAODB.StudentDAO;
import DAODB.UserDAO;
import DB.DBConnection;

@WebServlet("/act_User")
public class act_User extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public act_User() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			int userID = Integer.parseInt(request.getParameter("userID"));
			User mp = UserDAO.Display_1User(userID, conn);

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
				double salary = Double.parseDouble(request.getParameter("salary"));
				int authorityID = Integer.parseInt(request.getParameter("authorityID"));

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

					kt = UserDAO.AddUser(username2, password, fullName, sex, sqlDate, phoneNumber, email, address,
							salary,authorityID, conn);

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
				double salary = Double.parseDouble(request.getParameter("salary"));
				int authorityID = Integer.parseInt(request.getParameter("authorityID"));
				
				String doB = (String) request.getParameter("doB");
				System.out.println(doB);
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(doB);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;

					kt = UserDAO.EditUser(studentID, username2, password, fullName, sex, sqlDate, phoneNumber,
							email, address,salary,authorityID, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else if (action == 4) { // remove
				int userID = Integer.parseInt(request.getParameter("userID"));

				kt = false;
				kt = UserDAO.DeleteUser(userID, conn);
			}
			else if(action==5) {
				List<Authority> listex = AuthorityDAO.DisplayAuthority(conn);

				for(int i=0;i<listex.size();i++)
				{
					System.out.println(listex.get(i).getAuthorityID());
					
				}
				if (!listex.isEmpty()) {
		            response.setContentType("application/json");
		            //Import gson-2.2.2.jar
		            Gson gson = new Gson();
		            String objectToReturn = gson.toJson(listex); //Convert List -> Json
		            out.write(objectToReturn); //Đưa Json trả về Ajax
		            out.flush();
					//response.getWriter().write(objectToReturn);
		        } else {
		            response.setContentType("application/json");
		            out.write("{\"check\":\"fail\"}");
		            out.flush();
		        }
				return;
			}
			else if(action==6) {
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				String username2 = request.getParameter("username2");
				String password = request.getParameter("password");
				String fullName = request.getParameter("fullName");
				int sex = Integer.parseInt(request.getParameter("sex"));
				String phoneNumber = request.getParameter("phoneNumber");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				double salary = Double.parseDouble(request.getParameter("salary"));
				int authorityID = Integer.parseInt(request.getParameter("authorityID"));
				
				String doB = (String) request.getParameter("doB");
				System.out.println(doB);
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(doB);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;

					kt = UserDAO.EditUser(studentID, username2, password, fullName, sex, sqlDate, phoneNumber,
							email, address,salary,authorityID, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				
				
				
				
				User mp = UserDAO.Display_1User(studentID, conn);

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
			}

			if (kt || str_action == null) {
				System.out.println("Success!");
				List<User> list = UserDAO.DisplayUser(conn);

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
