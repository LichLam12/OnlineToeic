package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Options;

public class OptionsDAO {
	public static List<Options> DisplayOption(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Options> list = new ArrayList<Options>();

		String sql = "select * from options";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Options mp = new Options();

				mp.setOptionID(rs.getInt("optionID"));
				mp.setContent(rs.getNString("content"));
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Options Display_1Option(int optionID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Options q = new Options();

		String sql = "select * from options where optionID='" + optionID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				q.setOptionID(rs.getInt("optionID"));
				q.setContent(rs.getNString("content"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return q;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditOption(int optionID, String content, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditOption(?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, optionID);
			cstm.setNString(2, content);

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
		public static boolean DeleteOption(int optionID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteOption(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, optionID);

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
		public static boolean AddOption(String content, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddOption(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setNString(1, content);
				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			     cstm.registerOutParameter(2, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(2);
				
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
