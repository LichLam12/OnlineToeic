package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.User;

public class UserDAO {
	public static List<User> DisplayUser(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<User> list = new ArrayList<User>();

		String sql = "select * from user";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				User mp = new User();

				mp.setUserID(rs.getInt("userID"));
				mp.setUsername(rs.getString("username"));
				mp.setPassword(rs.getString("password"));
				mp.setFullName(rs.getNString("fullName"));
				mp.setSex(rs.getInt("sex"));
				mp.setDoB(rs.getDate("doB"));
				mp.setPhoneNumber(rs.getString("phoneNumber"));	
				mp.setEmail(rs.getString("email"));				
				mp.setAddress(rs.getNString("address"));	
				mp.setSalary(rs.getDouble("salary"));	
				mp.setAuthorityID(rs.getInt("authorityID"));				
				
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
	
	public static User Display_1User(int userID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		User mp = new User();

		String sql = "select * from user where userID='" + userID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				mp.setUserID(rs.getInt("userID"));
				mp.setUsername(rs.getString("username"));
				mp.setPassword(rs.getString("password"));
				mp.setFullName(rs.getNString("fullName"));
				mp.setSex(rs.getInt("sex"));
				mp.setDoB(rs.getDate("doB"));
				mp.setPhoneNumber(rs.getString("phoneNumber"));	
				mp.setEmail(rs.getString("email"));				
				mp.setAddress(rs.getNString("address"));
				mp.setSalary(rs.getDouble("salary"));	
				mp.setAuthorityID(rs.getInt("authorityID"));	
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditUser(int userID, String username, String password, String fullName,
			int sex, Date doB, String phoneNumber, String email, String address, double salary,
			int authorityID,Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditUser(?,?,?,?,?,?,?,?,?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, userID);
			cstm.setString(2, username);
			cstm.setString(3, password);
			cstm.setNString(4, fullName);
			cstm.setInt(5, sex);
			cstm.setDate(6, doB);
			cstm.setString(7, phoneNumber);
			cstm.setString(8, email);
			cstm.setNString(9, address);
			cstm.setDouble(10, salary);
			cstm.setInt(11, authorityID);
			
			
			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
		    cstm.registerOutParameter(12, java.sql.Types.BOOLEAN);
		     
			cstm.executeUpdate();
			
			t = cstm.getBoolean(12);

			cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return t;
	}
	
	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
		public static boolean DeleteUser(int userID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteUser(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, userID);

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
		public static boolean AddUser(String username, String password, String fullName,
				int sex, Date doB, String phoneNumber, String email, String address, double salary,
				int authorityID, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddUser(?,?,?,?,?,?,?,?,?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setString(1, username);
				cstm.setString(2, password);
				cstm.setNString(3, fullName);
				cstm.setInt(4, sex);
				cstm.setDate(5, doB);
				cstm.setString(6, phoneNumber);
				cstm.setString(7, email);
				cstm.setNString(8, address);
				cstm.setDouble(9, salary);
				cstm.setInt(10, authorityID);
				
				// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			     cstm.registerOutParameter(11, java.sql.Types.BOOLEAN);
			     
				cstm.executeUpdate();
				
				t = cstm.getBoolean(11);
				
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
