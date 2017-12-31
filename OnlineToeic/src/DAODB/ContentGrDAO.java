package DAODB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.ContentGroup;

public class ContentGrDAO {
	public static List<ContentGroup> DisplayContentGroup(Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<ContentGroup> list = new ArrayList<ContentGroup>();

		String sql = "select * from contentgroup";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				ContentGroup mp = new ContentGroup();

				mp.setContentGrID(rs.getInt("contentGrID"));
				mp.setContentGrName(rs.getString("contentGrName"));
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static ContentGroup Display_1ContentGroup(int contentGrID, Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		ContentGroup q = new ContentGroup();

		String sql = "select * from contentgroup where contentGrID='" + contentGrID + "'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {

				q.setContentGrID(rs.getInt("contentGrID"));
				q.setContentGrName(rs.getString("contentGrName"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return q;
	}

	// Hàm kiểm tra việc update quyeenf có win k (gọi store)
	public static boolean EditContentGroup(int contentGrID, String contentGrName, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procEditContentGroup(?,?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, contentGrID);
			cstm.setNString(2, contentGrName);

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
	public static boolean DeleteContentGroup(int contentGrID, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procDeleteContentGroup(?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setInt(1, contentGrID);

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
	public static boolean AddContentGroup(String contentGrName, Connection conn) {

		boolean t = false;

		// Câu lệnh gọi thủ tục (***)
		String sql = "{call procAddContentGroup(?,?)}";

		try {
			// Tạo một đối tượng CallableStatement.
			CallableStatement cstm = conn.prepareCall(sql);
			cstm.setNString(1, contentGrName);
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

		return t;
	}

	// Hàm trả về tổng số hàng trong một table

	public static int CountRow(Connection conn) {

		int count = 0;

		String sql = "select count(*) from contentgroup";

		PreparedStatement ptmt;
		try {

			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			rs.next();

			count = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;

	}
}
