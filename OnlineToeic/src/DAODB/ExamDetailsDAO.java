package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.ExamDetails;
import BEAN.Examination;

public class ExamDetailsDAO {
	public static List<ExamDetails> DisplayExamDetails(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<ExamDetails> list = new ArrayList<ExamDetails>();

		String sql = "select * from examdetails order by examID";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				ExamDetails mp = new ExamDetails();
				
				mp.setDetail_ID(rs.getInt("detail_ID"));
				mp.setExamID(rs.getInt("examID"));
				mp.setContentGrName(rs.getNString("contentGrName"));
				mp.setQuestionID(rs.getInt("questionID"));
				//System.out.println(rs.getTime("examTime"));	
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static ExamDetails Display_1ExamDetails(int detail_ID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		ExamDetails mp = new ExamDetails();

		String sql = "select * from examdetails where detail_ID='" + detail_ID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				mp.setDetail_ID(rs.getInt("detail_ID"));
				mp.setExamID(rs.getInt("examID"));
				mp.setContentGrName(rs.getNString("contentGrName"));
				mp.setQuestionID(rs.getInt("questionID"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditExamDetails(int detail_ID, int questionID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditExamDetails(?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, detail_ID);
			cstm.setInt(2, questionID);
			
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

		return t;
	}
	
	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
		public static boolean DeleteExamDetails(int detail_ID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteExamDetails(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, detail_ID);
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
		public static boolean AddExamDetails(int examID, String contentGrName, int questionID, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddExamDetails(?,?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, examID);
				cstm.setNString(2, contentGrName);
				cstm.setInt(3, questionID);
				
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
