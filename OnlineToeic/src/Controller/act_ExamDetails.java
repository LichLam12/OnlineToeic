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

import BEAN.ContentGroup;
import BEAN.ExamDetails;
import BEAN.Examination;
import BEAN.Question;
import BEAN.User;
import DAODB.ContentGrDAO;
import DAODB.ExamDetailsDAO;
import DAODB.ExaminationDAO;
import DAODB.LoginDAO;
import DAODB.QuestionDAO;
import DB.DBConnection;

@WebServlet("/act_ExamDetails")
public class act_ExamDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public act_ExamDetails() {
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
			int detail_ID = Integer.parseInt(request.getParameter("detail_ID"));
			ExamDetails mp = ExamDetailsDAO.Display_1ExamDetails(detail_ID, conn);
			
			System.out.println(mp.getDetail_ID());
			System.out.println(mp.getContentGrName());
			System.out.println(mp.getQuestionID());

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
				String contentGrName = request.getParameter("contentGrName");
				int questionID = Integer.parseInt(request.getParameter("questionID"));

				kt = false;
				kt = ExamDetailsDAO.AddExamDetails(examID,contentGrName,questionID, conn);
			}
			else if(action==2) { //edit
				int detail_ID = Integer.parseInt(request.getParameter("detail_ID"));
				int questionID = Integer.parseInt(request.getParameter("questionID"));

				kt = false;
				kt = ExamDetailsDAO.EditExamDetails(detail_ID,questionID, conn);
			}
			else if(action==4) { //remove
				int detail_ID = Integer.parseInt(request.getParameter("detail_ID"));

				kt = false;
				kt = ExamDetailsDAO.DeleteExamDetails(detail_ID, conn);
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
		
				
			if (kt || str_action==null) {
				
				List<ExamDetails> list = ExamDetailsDAO.DisplayExamDetails(conn);
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
