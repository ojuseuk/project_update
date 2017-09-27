package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.impl.protocol.BootstrapServerRequestDispatcher;

import car.dao.StationDao;
import car.dto.StationVO;

@WebServlet("/loc")
public class LocationInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(1 + "--- " + request.getServletPath());
		System.out.println(2 + "---- " + request.getScheme());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String command = request.getParameter("command");
		System.out.println(command);
		
		if(command.equals("sido")) {
			getCode(request,response);
		}else if(command.equals("csNm")) {
			getCsinfo(request,response);
		}else if(command.equals("all")){
			getAll(request, response);
		}else if(command.equals("add")){
			getAdd(request, response);
		}else if(command.equals("updateList")){
			getUpdateList(request, response);
		}else if(command.equals("updateDetail")){
			getUpdateDetail(request, response);
		}else if(command.equals("update")){
			getUpdate(request, response);
		}else if(command.equals("delete")){
			getDelete(request, response);
		}
	}
	
	public void getCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sido = request.getParameter("SI_DO");
		System.out.println(sido);
		
		//한국 주요도시 위도, 경도
		Map<String, String> map = new HashMap<String, String>();
		map.put("서울특별시", "37.540705/126.956764");
		map.put("인천광역시", "37.469221/126.573234");
		map.put("광주광역시", "35.126033/126.831302");
		map.put("대구광역시", "35.798838/128.583052");
		map.put("울산광역시", "35.519301/129.239078");
		map.put("대전광역시", "36.321655/127.378953");
		map.put("부산광역시", "35.198362/129.053922");
		map.put("경기", "37.567167/127.190292");
		map.put("강원도", "37.555837/128.209315");
		map.put("충청남도", "36.557229/126.779757");
		map.put("충청북도", "36.628503/127.929344");
		map.put("경상북도", "36.248647/128.664734");
		map.put("경상남도", "35.259787/128.664734");
		map.put("전라북도", "35.716705/127.144185");
		map.put("전라남도", "34.819400/126.893113");
		map.put("제주특별자치도", " 33.364805/126.542671");
		ArrayList<StationVO> staList = StationDao.infoStation(sido);
		request.setAttribute("map", map.get(sido));
		request.setAttribute("staList", staList);
		request.setAttribute("msg", "msg");
		request.getRequestDispatcher("location/search.jsp").forward(request, response);
		
	}
	
	public void getCsinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyName = request.getParameter("key_search").trim();
		System.out.println(keyName);
		StationVO st = StationDao.staDetail(keyName);
		System.out.println(st.getCsnm());
		
		request.setAttribute("st", st);
		request.getRequestDispatcher("detailView.jsp").forward(request, response);
	}
	
	/**
	 * 충전소의 모든 정보를 가져오는 메소드
	 * 
	 * @throws ServletException, IOException
	 * 
	 */
	
	public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "error.jsp";

		try {
			List<StationVO> list = StationDao.allList();
			
			System.out.println(list.size());
			if(list != null){
				
				url = "charging.jsp";
				request.setAttribute("msg2", "msg2");	   
				request.setAttribute("list", list);
			}
			System.out.println(url);
			
		} catch (SQLException e) {
			request.setAttribute("msg", "에러");
		}
		
		System.out.println(url);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	/** 충전소 정보를 추가하기 위한 메소드 */
	public void getAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StationVO stationVO = new StationVO(request.getParameter("station_csnm"), request.getParameter("station_addr"), 
				request.getParameter("station_cpnm"), Double.valueOf(request.getParameter("station_lat")), Double.valueOf(request.getParameter("station_longi")));
		
		String url = "error.jsp";
		try {
			int num = StationDao.add(stationVO);
			if(num == 1){
				url = "adminView.jsp";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	} // end of getAdd
	
	/** 충전소 정보를 수정하기 전에 모든 목록을 가져오는 메소드 */
	public void getUpdateList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "error.jsp";
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		request.getParameterValues("");
		int currentPage = Integer.valueOf(pageNumber);
		System.out.println(currentPage);
		// 한 페이지에 출력하는 목록 수
		int boardSize = 10;
		
		// 페이지에 출력되는 게시글의 시작 번호
		int startRow = (currentPage-1)*boardSize+1;
		// 페이지에 출력되는 게시글의 마지막 번호
		int endRow = currentPage*boardSize; 

		try {
			Map<Integer, List<StationVO>> map = StationDao.updateList(startRow, endRow);
			if(map != null){
				
				Set<Integer> key = map.keySet();
				int cnt=0;
				List<StationVO> list = null;
				for (Integer mapKey : key) {
					cnt = mapKey;
					list = map.get(mapKey);
				}
				
				System.out.println("cnt: " + cnt);
				System.out.println("boardSize: " + boardSize);
				System.out.println("list: " + list);

				request.setAttribute("list", list);
				request.setAttribute("cnt", cnt);
				request.setAttribute("boardSize", boardSize);
				request.setAttribute("currentPage", currentPage);
				
				url = "location/locationList.jsp";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	} // end of getUpdate
	
	/** 충전소 정보를 수정하기위해 선택한 정보의 상세내용을 보여주기 위한 메소드*/
	public void getUpdateDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int station_num = Integer.valueOf(request.getParameter("station_num"));
		String url = "error.jsp";
		System.out.println(station_num);
		
		try {
			StationVO stationVO = StationDao.updateDetail(station_num);
			
			if(stationVO !=null){
				request.setAttribute("stationVO", stationVO);
				url = "location/locationDetail.jsp";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}//end of getUpdateDetail
	
	/** 충전소 정보를 수정하기위한 메소드 */
	public void getUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StationVO stationVO = new StationVO(Integer.valueOf(request.getParameter("station_num")), request.getParameter("station_csnm"), request.getParameter("station_addr"), 
				request.getParameter("station_cpnm"), Double.valueOf(request.getParameter("station_lat")), Double.valueOf(request.getParameter("station_longi")));
		String url = "error.jsp";
		
		try {
			int num = StationDao.update(stationVO);
			
			if(num == 1){
				url = "adminView.jsp";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}// end of getUpdate
	
	/** 충전소 정보를 삭제하기위한 메소드 */
	public void getDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int station_num = Integer.valueOf(request.getParameter("station_num"));
		String url="error.jsp";
		
		try {
			int num = StationDao.Delete(station_num);
			
			if(num == 1){
				url = "adminView.jsp";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}
