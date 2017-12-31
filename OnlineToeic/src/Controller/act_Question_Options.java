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

import BEAN.Options;
import BEAN.Question;
import BEAN.Question_Options;
import BEAN.User;
import DAODB.LoginDAO;
import DAODB.OptionsDAO;
import DAODB.QuestionDAO;
import DAODB.Question_OptionsDAO;
import DB.DBConnection;

@WebServlet("/act_Question_Options")
public class act_Question_Options extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public act_Question_Options() {
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
		if(action==3)
		{
			int ques_op_ID = Integer.parseInt(request.getParameter("ques_op_ID"));
			Question_Options mp = Question_OptionsDAO.Display_1Question_Options(ques_op_ID, conn);
			
			System.out.println("isanswer: "+mp.isAnswer());
			
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
			if(action==1) {
				int questionID = Integer.parseInt(request.getParameter("questionID"));
				int optionID = Integer.parseInt(request.getParameter("optionID"));
				boolean isAnswer = Boolean.parseBoolean(request.getParameter("isAnswer"));

				kt = false;
				kt = Question_OptionsDAO.AddQuestion_Options(questionID,optionID,isAnswer, conn);
			}
			else if(action==2) {
				int ques_op_ID = Integer.parseInt(request.getParameter("ques_op_ID"));
				int questionID = Integer.parseInt(request.getParameter("questionID"));
				int optionID = Integer.parseInt(request.getParameter("optionID"));
				boolean isAnswer = Boolean.parseBoolean(request.getParameter("isAnswer"));

				kt = false;
				kt = Question_OptionsDAO.EditQuestion_Options(ques_op_ID,questionID,optionID,isAnswer, conn);
			}
			else if(action==4) {
				int ques_op_ID = Integer.parseInt(request.getParameter("ques_op_ID"));

				kt = false;
				kt = Question_OptionsDAO.DeleteQuestion_Options(ques_op_ID, conn);
			}
			else if(action==5) {
				List<Question> list = QuestionDAO.DisplayQuestion(conn);

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
			else if(action==6) {
				List<Options> list = OptionsDAO.DisplayOption(conn);

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
				System.out.println("Success!");
				List<Question_Options> list = Question_OptionsDAO.DisplayQuestion_Options(conn);

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
