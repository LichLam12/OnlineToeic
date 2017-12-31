package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
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

import BEAN.Class;
import BEAN.ContentGroup;
import BEAN.Examination;
import BEAN.Options;
import BEAN.Question;
import BEAN.User;
import DAODB.ClassDAO;
import DAODB.ContentGrDAO;
import DAODB.ExaminationDAO;
import DAODB.LoginDAO;
import DAODB.OptionsDAO;
import DAODB.QuestionDAO;
import DAODB.StudentDAO;
import DB.DBConnection;

@WebServlet("/act_Examination")
public class act_Examination extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public act_Examination() {
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
			int examID = Integer.parseInt(request.getParameter("examID"));
			String contentGrName = request.getParameter("contentGrName");
			Examination mp = ExaminationDAO.Display_1Exam(examID,contentGrName, conn);
			
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
				int examID = Integer.parseInt(request.getParameter("examID"));
				String examName = request.getParameter("examName");
				String examTime = request.getParameter("examTime");
				String contentGrName = request.getParameter("contentGrName");
				int numQues = Integer.parseInt(request.getParameter("numQues"));
				
				
				System.out.println(examID);
				System.out.println(examName);
				System.out.println(examTime);
				System.out.println(contentGrName);
				System.out.println(numQues);

				String examDate = request.getParameter("examDate");
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(examDate);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;
					kt = ExaminationDAO.AddExam(examID,examName,examTime,sqlDate,contentGrName,numQues, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}	
			}
			else if(action==2) { //edit
				int examID = Integer.parseInt(request.getParameter("examID"));
				String examName = request.getParameter("examName");
				String examTime = request.getParameter("examTime");

//				if(examTime_Temp=="90000") {
//					
//				}else if(examTime_Temp=="93000") {
//					
//				}else if(examTime_Temp=="100000") {
//					
//				}else if(examTime_Temp=="133000") {
//					
//				}else if(examTime_Temp=="140000") {
//					
//				}else if(examTime_Temp=="143000") {
//					
//				}else if(examTime_Temp=="150000") {
//					
//				}else if(examTime_Temp=="153000") {
//					
//				}else if(examTime_Temp=="160000") {
//					
//				}
				
				String contentGrName = request.getParameter("contentGrName");
				int numQues = Integer.parseInt(request.getParameter("numQues"));

				String examDate = request.getParameter("examDate");
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date startDate = sdf.parse(examDate);
					java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());
					System.out.println(sqlDate);
					kt = false;
					kt = ExaminationDAO.EditExam(examID,examName,examTime,sqlDate,contentGrName,numQues, conn);

				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			else if(action==4) { //remove
				int examID = Integer.parseInt(request.getParameter("examID"));
				String contentGrName = request.getParameter("contentGrName");

				kt = false;
				kt = ExaminationDAO.DeleteExam(examID,contentGrName, conn);
			}
			else if(action==5) {
				List<ContentGroup> listex = ContentGrDAO.DisplayContentGroup(conn);

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
				String contentGrName = request.getParameter("contentGrName");
				
				List<Question> listex = QuestionDAO.DisplayQues_Content(contentGrName,conn);
				
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
			else if(action==7) {
				List<Examination> list = ExaminationDAO.DisplayExam2(conn);
				
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
				 return;
			}
				
			if (kt || str_action==null) {
				
				List<Examination> list = ExaminationDAO.DisplayExam(conn);
				System.out.println("Success!");
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
