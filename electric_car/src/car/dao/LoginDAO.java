package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import car.dto.MemberVO;
import car.util.DBUtil;

public class LoginDAO {

	private static LoginDAO instance;

	private LoginDAO() {
	}

	public static LoginDAO getInstance() {
		if (instance == null) {
			instance = new LoginDAO();
		}
		return instance;
	}

//	전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다.
//	private static String sql;

	public int loginCheck(String id, String pwd) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = "";
		int x = -1;
		String p="1111";
		
//		db의 password명을 password로 변경
		String sql = "select member_password from member where member_id=?";
//		전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다.
//		id값을 비교 하려면 where절에서 해야하는데 where절을 사용하지 않았습니다.
//		password 는 db에있는 값을 빼와야 하기 때문에 db의 password명인 pwd를 사용 해야합니다.
//		sql = "select password from member id=?";

		//여기서 값이 1일때  admin으로 넘어가게 해 준다. 
		//패스워드가 같으면 1 아니면 0을 넘겨준다. 나머지는 -1 
		//컨트롤러에서 값을 받아 비교해 준다.
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbPW = rs.getString("member_password");
				
				if (p.equals(pwd)) {
					x = 1;
				} else if(dbPW.equals(pwd)){
					x = 0;
				} else{
					x=-1;
				}
			} 
//			기본 값이 -1 이기 때문에 필요가 없습니다.
			/*else {
				x = -1;
			}*/

		} catch (Exception e) {

		} finally {
			DBUtil.close(con, pstmt, rs);
		}
		return x;

	}

	public MemberVO getUserInfo(String id) {

		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
//		전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다. 
//		sql = "select * from member where id=?";
		
		String sql = "select * from member where id=?";
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberVO();
//				rs.get~~ 는 db의 필드명과 같아야 합니다.
				member.setId(rs.getString("member_id"));
				member.setPassword(rs.getString("member_password"));
				member.setName(rs.getString("member_name"));
				member.setEmail(rs.getString("member_email"));
				member.setAddr(rs.getString("member_addr"));
				member.setPhone(rs.getString("member_phone"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return member;

	}
}