package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import car.dto.FAQVO;
import car.util.DBUtil;

/** FAQ Table과 연동하기 위한 클래스 */
public class FAQDao {

	/* 변수 */
	private static FAQDao instance = null;
	
	/* 생성자 */
	private FAQDao() {}
	
	/* 접근자 */
	public static FAQDao getInstance() {
		
		if(instance == null)
			instance = new FAQDao();
		
		return instance;
		
	}//end of getInstance
	
	/* 함수 */
	/** FAQ 목록을 가져다 주는 클래스 */
	public List<FAQVO> getList(){
		
		List<FAQVO> list = new ArrayList<>();
		Connection c = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			c = DBUtil.getConnection();
			ps = c.prepareStatement("select * from FAQ");
			rs = ps.executeQuery();
			
			while(rs.next())
				list.add(new FAQVO(rs.getInt("faq_num"),rs.getString("faq_name"),rs.getString("faq_content"),rs.getString("member_id")));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(c, ps, rs);
		}
		
		return list;
		
	}//end of getList
	
	/** FAQ 번호와 일치하는 FAQ 객체 가져오기 */
	public FAQVO getFAQ(int num) {
		
		FAQVO f = null;
		Connection c = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			c = DBUtil.getConnection();
			ps = c.prepareStatement("select * from faq where faq_num = ?");
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) 
				f = new FAQVO(rs.getInt("faq_num"),rs.getString("faq_name"),rs.getString("faq_content"),rs.getString("member_id"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(c, ps, rs);
		}
		
		return f;
		
	}//end of GetFAQ
	
	/** 사용자가 FAQ에 정보를 입력했을때 FAQ에 정보가 추가되는 메소드 */
	public static int faqAdd(String title, String message, String id) throws SQLException{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into faq values(faq_seq.nextval, ?, ?, ?)");
			
			pstmt.setString(1, title);
			pstmt.setString(2, message);
			pstmt.setString(3, id);
			
			num = pstmt.executeUpdate();
			
			
		} finally {
			DBUtil.close(con, pstmt);
		}

		return num;
		
	}//end of faqAdd
	
}//end of FAQDao

