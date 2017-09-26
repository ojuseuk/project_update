package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import car.dto.StationVO;
import car.util.DBUtil;

public class StationDao {
//	전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다.
//	public static String sql;

	// 충전소 정보 리스트에 담기
	public static ArrayList<StationVO> infoStation(String sido) {
		StationVO st = null;
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StationVO> sList = new ArrayList<>();
//		전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다.
//		sql = "select * from station where station_addr=?";
		System.out.println(sido);
		sido = sido +"%";
		String sql = "SELECT * FROM station WHERE station_addr LIKE ? || '%'";
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, sido);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int idNum = rs.getInt(1);
				String csNm = rs.getString(2);
				String addr = rs.getString(3);
				String dpNm = rs.getString(4);
				double lat = rs.getDouble(5);
				double longI = rs.getDouble(6);
				sList.add(new StationVO(idNum, csNm, addr, dpNm, lat, longI));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return sList;
	}

	// 입력한 충전소 리스트에 담기
	public static StationVO staDetail(String keyName) {
		StationVO st = null;
		Connection c = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		전역 변수로 계속 유지하고 있으면 메모리에 안좋기 때문에 지역 변수로 선언하는 것이 좋습니다.
//		sql = "select * from station where station_csnm=?";

		String sql = "select * from station where station_csnm=?";
		try {
			c = DBUtil.getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, keyName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				String csnm = rs.getString(2);
				String addr = rs.getString(3);
				String cpnm = rs.getString(4);
				double lat = rs.getDouble(5);
				double longi = rs.getDouble(6);
				st = new StationVO(id, csnm, addr, cpnm, lat, longi);
			}
			System.out.println(st.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(c, pstmt, rs);
		}
		return st;
	}

	/** 충전소 정보를 확인 or 지도에 표시 하기위해 전체 목록을 가져오는 함수 
	 * 
	 * Query : SELECT
	 * 
	 * 1. Connection 생성
     * 2. PreparedStatement 생성
     * 3. ResultSet 생성
     * 4. 쿼리 전송
     * 5. close()
     * 6. return type : List<StationVO> 
     * 
	 * @throws SQLException 
	 * */
	
	public static List<StationVO> allList() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StationVO> list = new ArrayList<>();
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from station");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){

				list.add(new StationVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getDouble(5), rs.getDouble(6)));
			}
			
		} finally {
			DBUtil.close(con, pstmt, rs);
		}
		
		return list;
	}

	
	/** 충전소 정보를 insert 하기위한 메소드 
	 * 
	 * Query : insert
	 * 
	 * 1. Connection 생성
     * 2. PreparedStatement 생성
     * 4. 쿼리 전송
     * 5. close()
     * 6. return type : int 
     * 
	 * @throws SQLException 
	 * */
	public static int add(StationVO stationVO) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into station values(station_seq.nextval, ?,?,?,?,?)");
			
			pstmt.setString(1, stationVO.getCsnm());
			pstmt.setString(2, stationVO.getAddr());
			pstmt.setString(3, stationVO.getCpnm());
			pstmt.setDouble(4, stationVO.getLat());
			pstmt.setDouble(5, stationVO.getLongi());
			
			num = pstmt.executeUpdate();
			
		}finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
	}

	/** 충전소 정보를 수정하기 전에 모든 정보를 가져오기 위한 메소드 
	 * 
	 * Query : SELECT
	 * 
	 * 1. Connection 생성
     * 2. PreparedStatement 생성
     * 3. ResultSet 생성
     * 4. 쿼리 전송
     * 5. close()
     * 6. return type : List<StationVO> 
     * 
	 * @throws SQLException 
	 * */
	public static Map<Integer, List<StationVO>> updateList(int startRow, int endRow) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		List<StationVO> list = new ArrayList<>();
		Map<Integer, List<StationVO>> map = new HashMap<>();
		String sql = "select count(*) from station";
		try{
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			
			if(pstmt != null){
				pstmt.close();
			}
			if(rs != null){
				rs.close();
			}
			
			sql = "SELECT * FROM "
					+ "( SELECT s.*, ROWNUM AS RNUM FROM "
					+ "( SELECT * FROM station ) s ) WHERE RNUM >= ? AND RNUM <= ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new StationVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getDouble(5), rs.getDouble(6)));
			}
			
			map.put(cnt, list);
		}finally {
			DBUtil.close(con, pstmt, rs);
		}
		
		return map;
	}

	/** 충전소 정보를 수정하기 위해 station_num값에 해당하는 충전소 정보를 가져오기 위한 메소드
	 * 
	 * Query : SELECT
	 * 
	 * 1. Connection 생성
     * 2. PreparedStatement 생성
     * 3. ResultSet 생성
     * 4. 쿼리 전송
     * 5. close()
     * 6. return type : StationVO
     * 
	 * @throws SQLException 
	 * */
	public static StationVO updateDetail(int station_num) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StationVO stationVO = null;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select *from station where station_num = ?");
			
			pstmt.setInt(1, station_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				stationVO = new StationVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6));
			}
			
		} finally {
			DBUtil.close(con, pstmt, rs);
		}
		
		return stationVO;
		
	}

	public static int update(StationVO stationVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("update station set station_csnm = ?, station_addr = ?, station_cpnm=?, station_lat=?, station_longi=? where station_num=?");
			
			pstmt.setString(1, stationVO.getCsnm());
			pstmt.setString(2, stationVO.getAddr());
			pstmt.setString(3, stationVO.getCpnm());
			pstmt.setDouble(4, stationVO.getLat());
			pstmt.setDouble(5, stationVO.getLongi());
			pstmt.setInt(6, stationVO.getId());
			
			num = pstmt.executeUpdate();
			
			
		}finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
	}

	public static int Delete(int station_num) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int num = 0;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from station where station_num = ?");
			
			pstmt.setInt(1, station_num);
			
			num = pstmt.executeUpdate();
			
		} finally {
			DBUtil.close(con, pstmt);
		}
		
		return num;
			
	}
}






