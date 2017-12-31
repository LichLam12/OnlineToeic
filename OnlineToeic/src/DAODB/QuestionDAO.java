package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Question;

public class QuestionDAO {
	public static List<Question> DisplayQuestion(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from question";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Question mp = new Question();

				mp.setQuestionID(rs.getInt("questionID"));
				mp.setContent(rs.getNString("content"));
				mp.setContentGrName(rs.getNString("contentGrName"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Question Display_1Question(int questionID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Question mp = new Question();

		String sql = "select * from question where questionID='" + questionID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				mp.setQuestionID(rs.getInt("questionID"));
				mp.setContent(rs.getNString("content"));
				mp.setContentGrName(rs.getNString("contentGrName"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}
	
	
	public static List<Question> DisplayQues_Content(String contentGrName,Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from question where contentGrName='"+contentGrName+"'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Question mp = new Question();

				mp.setQuestionID(rs.getInt("questionID"));
				mp.setContent(rs.getNString("content"));
				mp.setContentGrName(rs.getNString("contentGrName"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditQuestion(int questionID, String content, String contentGrName, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditQuestion(?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, questionID);
			cstm.setNString(2, content);
			cstm.setNString(3, contentGrName);

			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
		    cstm.registerOutParameter(4, java.sql.Types.BOOLEAN);
		     
			cstm.executeUpdate();
			
			t = cstm.getBoolean(4);

			cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return t;
	}
	
	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
		public static boolean DeleteQuestion(int questionID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteQuestion(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, questionID);

				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			    cstm.registerOutParameter(2, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(2);
				
				cstm.close();
			}

			catch (SQLException ex) {
				//e.printStackTrace();
				System.out.println(ex.getMessage());
			}
			
			return t;
		}
		
		// Hàm kiểm tra việc update quyeenf có win k (gọi store)
		public static boolean AddQuestion(String content, String contentGrName, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddQuestion(?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setNString(1, content);
				cstm.setNString(2, contentGrName);
				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			     cstm.registerOutParameter(3, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(3);
				
				cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
			}

			catch (SQLException ex) {
				// e.printStackTrace();
				System.out.println(ex.getMessage());
			}
			System.out.println(t);
			return t;
		}
}
