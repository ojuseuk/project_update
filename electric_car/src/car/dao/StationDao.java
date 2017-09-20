package car.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				String lat = rs.getString(5);
				String longI = rs.getString(6);
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
				String lat = rs.getString(5);
				String longi = rs.getString(6);
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
}
