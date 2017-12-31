package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Classes;
import BEAN.ScheduleInfo_Student;
import BEAN.Student;

public class StudentDAO {
	public static List<Student> DisplayStudent(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Student> list = new ArrayList<Student>();

		String sql = "select * from student";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Student mp = new Student();

				mp.setStudentID(rs.getInt("studentID"));
				mp.setUsername(rs.getString("username"));
				mp.setPassword(rs.getString("password"));
				mp.setFullName(rs.getNString("fullName"));
				mp.setSex(rs.getInt("sex"));
				mp.setDoB(rs.getDate("doB"));
				mp.setPhoneNumber(rs.getString("phoneNumber"));
				mp.setEmail(rs.getString("email"));
				mp.setAddress(rs.getNString("address"));
				mp.setAuthorityID(rs.getInt("authorityID"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

	public static List<ScheduleInfo_Student> DisplayScheduleInfo(int studentID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<ScheduleInfo_Student> list = new ArrayList<ScheduleInfo_Student>();

		String sql = "select DISTINCT className,examination.examID,examTime,examDate,mark.studentID,mark from class,examination,mark\r\n"
				+ " where mark.classID=class.classID and class.examID=examination.examID and studentID='" + studentID
				+ "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				ScheduleInfo_Student mp = new ScheduleInfo_Student();
				java.util.Date date1 = new java.util.Date();

				mp.setExamID(rs.getInt("examID"));
				mp.setClassName(rs.getNString("className"));
				mp.setExamTime(rs.getTime("examTime"));

				date1.setDate(rs.getDate("examDate").getDate());
				date1.setMonth(rs.getDate("examDate").getMonth());
				date1.setYear(rs.getDate("examDate").getYear());
				date1.setHours(rs.getTime("examTime").getHours());
				date1.setMinutes(rs.getTime("examTime").getMinutes());
				date1.setSeconds(rs.getTime("examTime").getSeconds());
				mp.setExamDate(date1);

				mp.setMark(rs.getDouble("mark"));

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

	public static List<Classes> DisplayClasses(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Classes> list = new ArrayList<Classes>();

		String sql = "select DISTINCT classID,className,examTime,examDate from class,examination where class.examID=examination.examID";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Classes mp = new Classes();
				java.util.Date date1 = new java.util.Date();

				mp.setClassID(rs.getInt("classID"));
				mp.setClassName(rs.getNString("className"));
				mp.setExamTime(rs.getTime("examTime"));

				date1.setDate(rs.getDate("examDate").getDate());
				date1.setMonth(rs.getDate("examDate").getMonth());
				date1.setYear(rs.getDate("examDate").getYear());
				date1.setHours(rs.getTime("examTime").getHours());
				date1.setMinutes(rs.getTime("examTime").getMinutes());
				date1.setSeconds(rs.getTime("examTime").getSeconds());
				mp.setExamDate(date1);

				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

	public static Student Display_1Student(int studentID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Student mp = new Student();

		String sql = "select * from student where studentID='" + studentID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				mp.setStudentID(rs.getInt("studentID"));
				mp.setUsername(rs.getString("username"));
				mp.setPassword(rs.getString("password"));
				mp.setFullName(rs.getNString("fullName"));
				mp.setSex(rs.getInt("sex"));
				mp.setDoB(rs.getDate("doB"));
				mp.setPhoneNumber(rs.getString("phoneNumber"));
				mp.setEmail(rs.getString("email"));
				mp.setAddress(rs.getNString("address"));
				mp.setAuthorityID(rs.getInt("authorityID"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditStudent(int studentID, String username, String password, String fullName, int sex,
			Date doB, String phoneNumber, String email, String address, int authorityID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditStudent(?,?,?,?,?,?,?,?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, studentID);
			cstm.setString(2, username);
			cstm.setString(3, password);
			cstm.setNString(4, fullName);
			cstm.setInt(5, sex);
			cstm.setDate(6, doB);
			cstm.setString(7, phoneNumber);
			cstm.setString(8, email);
			cstm.setNString(9, address);
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

		return t;
	}

	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
	public static boolean DeleteStudent(int studentID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procDeleteStudent(?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, studentID);

			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			cstm.registerOutParameter(2, java.sql.Types.BOOLEAN);

			cstm.executeUpdate();

			t = cstm.getBoolean(2);

			cstm.close();
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}

		return t;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean AddStudent(String username, String password, String fullName, int sex, Date doB,
			String phoneNumber, String email, String address, int authorityID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procAddStudent(?,?,?,?,?,?,?,?,?,?)}";
		System.out.println("11111111111: " + doB.getTime());
		System.out.println(doB);

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
			cstm.setInt(9, authorityID);

			// Đăng ký nhận giá trị trả về tại dấu hỏi thứ 2
			cstm.registerOutParameter(10, java.sql.Types.BOOLEAN);

			cstm.executeUpdate();

			t = cstm.getBoolean(10);

			cstm.close(); // k đóng lại thì nếu gọi store khác nữa sẽ k đc
		}

		catch (SQLException ex) {
			// e.printStackTrace();
			System.out.println(ex.getMessage());
		}
		System.out.println(t);
		return t;
	}

	public static boolean AddMark(int studentID, int classID, double mark, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditMark(?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, studentID);
			cstm.setInt(2, classID);
			cstm.setDouble(3, mark);

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
