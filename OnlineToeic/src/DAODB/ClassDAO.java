package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Class;

public class ClassDAO {
	public static List<Class> DisplayClass(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Class> list = new ArrayList<Class>();

		String sql = "select * from class";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Class mp = new Class();

				mp.setClassID(rs.getInt("classID"));
				mp.setClassName(rs.getString("className"));
				mp.setExamID(rs.getInt("examID"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Class Display_1Class(int classID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Class q = new Class();

		String sql = "select * from class where classID='" + classID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				q.setClassID(rs.getInt("classID"));
				q.setClassName(rs.getString("className"));
				q.setExamID(rs.getInt("examID"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return q;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditClass(int classID, String className, int examID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditClass(?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, classID);
			cstm.setNString(2, className);
			cstm.setInt(3, examID);

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
		public static boolean DeleteClass(int classID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteClass(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, classID);

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
		public static boolean AddClass(String className, int examID, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddClass(?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setNString(1, className);
				cstm.setInt(2, examID);
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
