package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import car.dto.FAQVO;
import car.dto.MemberVO;
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
				list.add(new FAQVO(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)));
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(c, ps, rs);
		}
		
		return list;
		
	}//end of getList
	
	
	/**답변 update*/

	public static int update(FAQVO fv) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "UPDATE faq SET admin_name=?, admin_context=?,admin_id=? WHERE faq_num = ?";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fv.getAdminName());
			pstmt.setString(2, fv.getAdminContext());
			pstmt.setString(3, fv.getAdminId());
			pstmt.setInt(4, fv.getfAQNum());
			

			num = pstmt.executeUpdate();

		} catch (SQLException s) {
			s.printStackTrace();
			throw s;
		} finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
	}


	
	
	
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
			pstmt = con.prepareStatement("insert into faq(faq_num, faq_name, faq_context, member_id) values(faq_seq.nextval, ?, ?, ?)");
			
			pstmt.setString(1, title);
			pstmt.setString(2, message);
			pstmt.setString(3, id);
			
			num = pstmt.executeUpdate();
			
			
		} finally {
			DBUtil.close(con, pstmt);
		}

		return num;
		
	}//end of faqAdd

	public static FAQVO answer(int fAQNum) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FAQVO faq = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select *from faq where faq_num = ?");
			
			pstmt.setInt(1, fAQNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				faq = new FAQVO(rs.getString("admin_id"), rs.getString("admin_name"), rs.getString("admin_context"));
			}
		}finally {
			DBUtil.close(con, pstmt, rs);
		}
		
		return faq;
	}
	
}//end of FAQDao

