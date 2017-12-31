package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Authority;
import BEAN.Student_Class;

public class Student_ClassesDAO {
	public static List<Student_Class> DisplayStudent_Class(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Student_Class> list = new ArrayList<Student_Class>();

		String sql = "select studentclass_ID,mark.studentID,mark.classID,mark from student_classes,mark where student_classes.studentID=mark.studentID and student_classes.classID=mark.classID";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				Student_Class mp = new Student_Class();
				
				mp.setStudentclass_ID(rs.getInt("studentclass_ID"));
				mp.setStudentID(rs.getInt("studentID"));
				mp.setClassID(rs.getInt("classID"));
				mp.setMark(rs.getDouble("mark"));
				
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static Student_Class Display_1Student_Class(int studentclass_ID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		Student_Class mp = new Student_Class();

		String sql = "select studentclass_ID,mark.studentID,mark.classID,mark from student_classes,mark where student_classes.studentID=mark.studentID and student_classes.classID=mark.classID\r\n" + 
				" and studentclass_ID='" + studentclass_ID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				mp.setStudentclass_ID(rs.getInt("studentclass_ID"));
				mp.setStudentID(rs.getInt("studentID"));
				mp.setClassID(rs.getInt("classID"));
				mp.setMark(rs.getDouble("mark"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mp;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditStudent_Class(int studentclass_ID, int studentID, int classID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditStudent_Class(?,?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, studentclass_ID);
			cstm.setInt(2, studentID);
			cstm.setInt(3, classID);

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
		public static boolean DeleteStudent_Class(int studentclass_ID, Connection conn) {

			boolean t = false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procDeleteStudent_Class(?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, studentclass_ID);

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
		public static boolean AddStudent_Class(int studentID, int classID, Connection conn) {

			boolean t=false;

			// Câu lệnh gọi thủ tục (***)
			String sql = "{call procAddStudent_Class(?,?,?)}";

			try {
				// Tạo một đối tượng CallableStatement.
				CallableStatement cstm = conn.prepareCall(sql);
				cstm.setInt(1, studentID);
				cstm.setInt(2, classID);
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
