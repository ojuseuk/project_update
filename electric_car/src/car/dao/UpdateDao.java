package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import car.dto.MemberVO;
import car.util.DBUtil;

public class UpdateDao {

	private static String sql;

	/** 회원정보 수정을 위한 메소드*/
	public static int update(MemberVO mem) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		sql = "UPDATE member SET member_password = ?, member_email = ?, member_addr = ?, member_phone=? WHERE member_id = ?";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem.getPassword());
			pstmt.setString(2, mem.getEmail());
			pstmt.setString(3, mem.getAddr());
			pstmt.setString(4, mem.getPhone());
			pstmt.setString(5, mem.getId());

			num = pstmt.executeUpdate();

		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
	}

}
