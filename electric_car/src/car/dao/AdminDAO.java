package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import car.util.DBUtil;

public class AdminDAO {

	public static int loginCheck(String id, String password) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0;
	
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select admin_password from admin where admin_id = ?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				String pwd = rs.getString(1);
				if(pwd.equals(password)){
//				아이디랑 비밀번호가 일치하면
					num = 1;
				}else{
//				아이디가 맞는데 비밀번호가 일치하지 않으면
					num = 2;
				}
			}
			
		}finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
	}

}
