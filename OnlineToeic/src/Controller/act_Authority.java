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

import BEAN.Authority;
import BEAN.User;
import DAODB.AuthorityDAO;
import DAODB.LoginDAO;
import DB.DBConnection;

@WebServlet("/act_Authority")
public class act_Authority extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public act_Authority() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = (Connection) DBConnection.CreateConnection();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter(); //để cho code gọn hơn
		
		String comeJSP = request.getParameter("comeJSP");
		//
		 String username = request.getParameter("username");
		 String password = request.getParameter("password");
		 if(username!=null) {
			 User nv=LoginDAO.DisplayInfoUser(username, conn);
			 request.setAttribute("perinfo", nv);
		 }
		 else {
			 request.setAttribute("perinfo", "Not User");
		 }
		 
			if(comeJSP!=null) {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Admin_Authoritym.jsp");
				rd.forward(request, response);
				return;
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
			int authorityID = Integer.parseInt(request.getParameter("authorityID"));
			Authority mp = AuthorityDAO.Display_1Authority(authorityID, conn);

			if (mp!=null) {
				request.setAttribute("infoauthority", mp);
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
				String authorityName = request.getParameter("authorityName");
				kt = false;
				kt = AuthorityDAO.AddAuthority(authorityName, conn);
			}
			else if(action==2) {
				int authorityID = Integer.parseInt(request.getParameter("authorityID"));
				String authorityName = request.getParameter("authorityName");

				kt = false;
				kt = AuthorityDAO.EditAuthority(authorityID,authorityName, conn);
			}
			else if(action==4) {
				int authorityID = Integer.parseInt(request.getParameter("authorityID"));

				kt = false;
				kt = AuthorityDAO.DeleteAuthority(authorityID, conn);
			}
				
				
			if (kt || str_action==null) {
				System.out.println("Success!");
				List<Authority> list = AuthorityDAO.DisplayAuthority(conn);
				request.setAttribute("authority", list);

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
