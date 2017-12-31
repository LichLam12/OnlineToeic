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

import BEAN.Class;
import BEAN.Examination;
import BEAN.Student;
import BEAN.Student_Class;
import BEAN.User;
import DAODB.ClassDAO;
import DAODB.ExaminationDAO;
import DAODB.LoginDAO;
import DAODB.StudentDAO;
import DAODB.Student_ClassesDAO;
import DB.DBConnection;


@WebServlet("/act_StudentClass")
public class act_StudentClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public act_StudentClass() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter(); //để cho code gọn hơn
		
		
		//
		String username = request.getParameter("username");
		 //String password = request.getParameter("password");
		 if(username!=null) {
			 User nv=LoginDAO.DisplayInfoUser(username, conn);
			 request.setAttribute("perinfo", nv);
		 }
		 else {
			 request.setAttribute("perinfo", "Not User");
		 }
		 //
		 
		String str_action=request.getParameter("action");
		int action=0;
		if(str_action!=null)
		{
			action = Integer.parseInt(request.getParameter("action"));
			System.out.println(action);
		}
		System.out.println(str_action);
		
		if(action==3) //display one
		{
			int studentclass_ID = Integer.parseInt(request.getParameter("studentclass_ID"));
			Student_Class mp = Student_ClassesDAO.Display_1Student_Class(studentclass_ID, conn);
			
			if (mp!=null) {
	            response.setContentType("application/json");
	            //Import gson-2.2.2.jar
	            Gson gson = new Gson();
	            String objectToReturn = gson.toJson(mp); //Convert List -> Json
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
		else
		{
			boolean kt=false;
			if(action==1) { //add
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				int classID = Integer.parseInt(request.getParameter("classID"));
				System.out.println(studentID+":Success!:"+classID);
				kt = false;
				kt = Student_ClassesDAO.AddStudent_Class(studentID,classID, conn);
			}
			else if(action==2) { //edit
				int studentclass_ID = Integer.parseInt(request.getParameter("studentclass_ID"));
				int studentID = Integer.parseInt(request.getParameter("studentID"));
				int classID = Integer.parseInt(request.getParameter("classID"));
				
				kt = false;
				kt = Student_ClassesDAO.EditStudent_Class(studentclass_ID,studentID,classID, conn);
				
				System.out.println(kt);
			}
			else if(action==4) { //remove
				int studentclass_ID = Integer.parseInt(request.getParameter("studentclass_ID"));

				kt = false;
				kt = Student_ClassesDAO.DeleteStudent_Class(studentclass_ID, conn);
			}
			else if(action==5) {
				List<Student> listex = StudentDAO.DisplayStudent(conn);

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
				List<Class> listex = ClassDAO.DisplayClass(conn);

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
		
				
			if (kt || str_action==null) {
				System.out.println("Success!");
				List<Student_Class> list = Student_ClassesDAO.DisplayStudent_Class(conn);

				 if (!list.isEmpty()) {
			            response.setContentType("application/json");
			            //Import gson-2.2.2.jar
			            Gson gson = new Gson();
			            String objectToReturn = gson.toJson(list); //Convert List -> Json
			            out.write(objectToReturn); //Đưa Json trả về Ajax
			            out.flush();
						//response.getWriter().write(objectToReturn);
			        } else {
			            response.setContentType("application/json");
			            out.write("{\"check\":\"fail\"}");
			            out.flush();
			        }
			}
			else {
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
