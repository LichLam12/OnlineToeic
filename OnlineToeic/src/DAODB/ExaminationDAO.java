package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.*;
import BEAN.Examination;

public class ExaminationDAO {
	public static List<Examination> DisplayExam(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Examination> list = new ArrayList<Examination>();

		String sql = "select * from examination order by examName";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();
			
				
			while (rs.next()) {
				Examination mp = new Examination();
				java.util.Date date1 = new java.util.Date();

				mp.setExamID(rs.getInt("examID"));
				mp.setExamName(rs.getNString("examName"));
				mp.setExamTime(rs.getTime("examTime"));
				
				
				date1.setDate(rs.getDate("examDate").getDate());
				date1.setMonth(rs.getDate("examDate").getMonth());
				date1.setYear(rs.getDate("examDate").getYear());
				date1.setHours(rs.getTime("examTime").getHours());
				date1.setMinutes(rs.getTime("examTime").getMinutes());
				date1.setSeconds(rs.getTime("examTime").getSeconds());
				mp.setExamDate(date1);
				//java.sql.Date sqlDate = new java.sql.Date(date1.getDay());

				mp.setContentGrName(rs.getNString("contentGrName"));
				mp.setNumQues(rs.getInt("numQues"));
				
				
				System.out.println(date1.getDate());	
				System.out.println(date1.getMonth());	
				System.out.println(date1.getYear());	
				System.out.println(date1.getHours());	
				System.out.println(date1.getMinutes());	
				System.out.println(date1.getSeconds());	

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	
	public static List<Examination> DisplayExam2(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Examination> list = new ArrayList<Examination>();

		String sql = "select distinct examID,examName,examTime,examDate from examination order by examName";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();
			
				
			while (rs.next()) {
				Examination mp = new Examination();
				java.util.Date date1 = new java.util.Date();

				mp.setExamID(rs.getInt("examID"));
				mp.setExamName(rs.getNString("examName"));
				mp.setExamTime(rs.getTime("examTime"));
				
				
				date1.setDate(rs.getDate("examDate").getDate());
				date1.setMonth(rs.getDate("examDate").getMonth());
				date1.setYear(rs.getDate("examDate").getYear());
				date1.setHours(rs.getTime("examTime").getHours());
				date1.setMinutes(rs.getTime("examTime").getMinutes());
				date1.setSeconds(rs.getTime("examTime").getSeconds());
				mp.setExamDate(date1);
				//java.sql.Date sqlDate = new java.sql.Date(date1.getDay());
				
				
				System.out.println(date1.getDate());	
				System.out.println(date1.getMonth());	
				System.out.println(date1.getYear());	
				System.out.println(date1.getHours());	
				System.out.println(date1.getMinutes());	
				System.out.println(date1.getSeconds());	

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Examination Display_1Exam(int examID,String contentGrName, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Examination q = new Examination();

		String sql = "select * from examination where examID='" + examID + "' and contentGrName='"+contentGrName+"'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				q.setExamID(rs.getInt("examID"));
				q.setExamName(rs.getNString("examName"));
				q.setExamTime(rs.getTime("examTime"));
				q.setExamDate(rs.getDate("examDate"));
				q.setContentGrName(rs.getNString("contentGrName"));
				q.setNumQues(rs.getInt("numQues"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return q;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditExam(int examID, String examName, String examTime, Date examDate,
			 String contentGrName, int numQues,Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditExam(?,?,?,?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, examID);
			cstm.setNString(2, examName);
			cstm.setString(3, examTime);
			cstm.setDate(4, examDate);
			cstm.setNString(5, contentGrName);
			cstm.setInt(6, numQues);
			
			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
		    cstm.registerOutParameter(7, java.sql.Types.BOOLEAN);
		     
			cstm.executeUpdate();
			
			t = cstm.getBoolean(7);

			cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return t;
	}
	
	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
		public static boolean DeleteExam(int examID, String contentGrName, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteExam(?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, examID);
				cstm.setNString(2, contentGrName);
				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			    cstm.registerOutParameter(3, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(3);
				
				cstm.close();
			}

			catch (SQLException ex) {
				//e.printStackTrace();
				System.out.println(ex.getMessage());
			}
			
			return t;
		}
		
		// Hàm kiểm tra việc update quyeenf có win k (gọi store)
		public static boolean AddExam(int examID,String examName, String examTime, Date examDate,
				 String contentGrName, int numQues, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddExam(?,?,?,?,?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, examID);
				cstm.setNString(2, examName);
				cstm.setString(3, examTime);
				cstm.setDate(4, examDate);
				cstm.setNString(5, contentGrName);
				cstm.setInt(6, numQues);
				
				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			     cstm.registerOutParameter(7, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(7);
				
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
