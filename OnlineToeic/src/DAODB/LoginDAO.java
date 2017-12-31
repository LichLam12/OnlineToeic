package DAODB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BEAN.Student;
import BEAN.User;
import sun.security.util.Password;

public class LoginDAO {
	public static int LoginUser(String username, String password, Connection conn) {

		int t = 0; // t xác định mã quyền của nv hay khách hàng, =0 kug có nghĩa k tồn tại account
		boolean tontai_account = false;

		PreparedStatement psmt = null;

		String sql = "select username, password, authorityID from user";

		try {

			psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				String Username = rs.getString("username");
				String Password = rs.getString("password");
				int maQuyen = rs.getInt("authorityID");

				if ((Username.equals(username)) && (Password.equals(password)) && maQuyen == 1) {
					t = 1;
					tontai_account = true;
					break;
				} else if ((Username.equals(username)) && (Password.equals(password)) && maQuyen == 2) {
					t = 2;
					tontai_account = true;
					break;
				} else if ((Username.equals(username)) && (Password.equals(password)) && maQuyen == 3) {
					t = 3;
					tontai_account = true;
					break;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (tontai_account == false) {
			PreparedStatement psmt2 = null;

			String sql2 = "select username, password from student"; // khachhang cố định maQuyen=4, k cần lấy

			try {

				psmt2 = conn.prepareStatement(sql2);

				ResultSet rs2 = psmt2.executeQuery();

				while (rs2.next()) {

					String Username2 = rs2.getString("username");
					String Password2 = rs2.getString("password");

					if ((Username2.equals(username)) && (Password2.equals(password))) {
						t = 4;
						tontai_account = true;
						break;
					}
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return t;

	}

	public static User DisplayInfoUser(String username, Connection conn) {

		User nv = new User();

		String sql = "select * from user where username='" + username + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {

				nv.setUserID(rs.getInt("userID"));
				nv.setUsername(rs.getString("username"));
				nv.setPassword(rs.getString("password"));
				nv.setFullName(rs.getNString("fullName"));
				nv.setSex(rs.getInt("sex"));
				nv.setDoB(rs.getDate("doB"));
				nv.setPhoneNumber(rs.getString("phoneNumber"));
				nv.setEmail(rs.getString("email"));
				nv.setAddress(rs.getNString("address"));
				nv.setSalary(rs.getDouble("salary"));
				nv.setAuthorityID(rs.getInt("authorityID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}
		return nv;
	}

	public static Student DisplayInfoStudent(int studentID, Connection conn) {

		Student nv = new Student();

		String sql = "select * from student where studentID='" + studentID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {

				nv.setStudentID(rs.getInt("studentID"));
				nv.setUsername(rs.getString("username"));
				nv.setPassword(rs.getString("password"));
				nv.setFullName(rs.getNString("fullName"));
				nv.setSex(rs.getInt("sex"));
				nv.setDoB(rs.getDate("doB"));
				nv.setPhoneNumber(rs.getString("phoneNumber"));
				nv.setEmail(rs.getString("email"));
				nv.setAddress(rs.getNString("address"));
				nv.setAuthorityID(rs.getInt("authorityID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}
		return nv;
	}

	public static Student DisplayInfoStudent2(String username, Connection conn) {

		Student nv = new Student();

		String sql = "select * from student where username='" + username + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {

				nv.setStudentID(rs.getInt("studentID"));
				nv.setUsername(rs.getString("username"));
				nv.setPassword(rs.getString("password"));
				nv.setFullName(rs.getNString("fullName"));
				nv.setSex(rs.getInt("sex"));
				nv.setDoB(rs.getDate("doB"));
				nv.setPhoneNumber(rs.getString("phoneNumber"));
				nv.setEmail(rs.getString("email"));
				nv.setAddress(rs.getNString("address"));
				nv.setAuthorityID(rs.getInt("authorityID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}
		return nv;
	}

	public static int Check_Authority(Connection conn) {

		int t = 4; // quyền student, mặc định

		PreparedStatement psmt = null;

		String sql = "select authorityID from user";

		try {

			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				int roleid = rs.getInt("authorityID");

				if (roleid == 1) {
					t = 1; // quyền admin
					break;
				} else if (roleid == 2) {
					t = 2; // quyền câu hỏi
					break;
				} else if (roleid == 3) {
					t = 3; // quyền đề thi
					break;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;
	}

}
