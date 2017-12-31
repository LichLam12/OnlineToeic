package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Question_Options;

public class Question_OptionsDAO {
	public static List<Question_Options> DisplayQuestion_Options(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Question_Options> list = new ArrayList<Question_Options>();

		String sql = "select * from question_options";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Question_Options mp = new Question_Options();

				mp.setQues_op_ID(rs.getInt("ques_op_ID"));
				mp.setQuestionID(rs.getInt("questionID"));
				mp.setOptionID(rs.getInt("optionID"));
				mp.setAnswer(rs.getBoolean("isAnswer"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Question_Options Display_1Question_Options(int ques_op_ID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Question_Options mp = new Question_Options();

		String sql = "select * from question_options where ques_op_ID='" + ques_op_ID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				mp.setQues_op_ID(rs.getInt("ques_op_ID"));
				mp.setQuestionID(rs.getInt("questionID"));
				mp.setOptionID(rs.getInt("optionID"));
				mp.setAnswer(rs.getBoolean("isAnswer"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditQuestion_Options(int ques_op_ID, int questionID, int optionID,
			boolean isAnswer, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditQuestion_Options(?,?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, ques_op_ID);
			cstm.setInt(2, questionID);
			cstm.setInt(3, optionID);
			cstm.setBoolean(4, isAnswer);
			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
		    cstm.registerOutParameter(5, java.sql.Types.BOOLEAN);
		     
			cstm.executeUpdate();
			
			t = cstm.getBoolean(5);

			cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return t;
	}
	
	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
		public static boolean DeleteQuestion_Options(int ques_op_ID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteQuestion_Options(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, ques_op_ID);

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
		public static boolean AddQuestion_Options(int questionID, int optionID,
				boolean isAnswer, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddQuestion_Options(?,?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, questionID);
				cstm.setInt(2, optionID);
				cstm.setBoolean(3, isAnswer);

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
			System.out.println(t);
			return t;
		}
}
