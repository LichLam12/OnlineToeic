package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;

import BEAN.Class;
import BEAN.Examination;
import BEAN.User;
import DAODB.ClassDAO;
import DAODB.ExaminationDAO;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/act_Class")
public class act_Class extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public act_Class() {
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
			int classID = Integer.parseInt(request.getParameter("classID"));
			Class mp = ClassDAO.Display_1Class(classID, conn);
			
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
				String className = request.getParameter("className");
				int examID = Integer.parseInt(request.getParameter("examID"));
				kt = false;
				kt = ClassDAO.AddClass(className,examID, conn);
			}
			else if(action==2) { //edit
				int classID = Integer.parseInt(request.getParameter("classID"));
				String className = request.getParameter("className");
				int examID = Integer.parseInt(request.getParameter("examID"));
				
				kt = false;
				kt = ClassDAO.EditClass(classID,className,examID, conn);
				
				System.out.println(kt);
			}
			else if(action==4) { //remove
				int classID = Integer.parseInt(request.getParameter("classID"));

				kt = false;
				kt = ClassDAO.DeleteClass(classID, conn);
			}
			else if(action==5) {
				List<Examination> listex = ExaminationDAO.DisplayExam2(conn);
				//request.setAttribute("examlist", listex);
				
				for(int i=0;i<listex.size();i++)
				{
					System.out.println(listex.get(i).getExamName());
					
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
		
				
			if (kt || str_action==null) {
				System.out.println("Success!");
				List<Class> list = ClassDAO.DisplayClass(conn);

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
