package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import car.dao.StationDao;
import car.dto.StationVO;

@WebServlet("/loc")
public class LocationInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		request.getRequestDispatcher("searchView.jsp").forward(request, response);
		
	}
	
	public void getCsinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyName = request.getParameter("key_search").trim();
		System.out.println(keyName);
		StationVO st = StationDao.staDetail(keyName);
		System.out.println(st.getCsnm());
		
		request.setAttribute("st", st);
		request.getRequestDispatcher("detailView.jsp").forward(request, response);
	}
	
	public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "error.jsp";
		
		
		
		try {
			List<StationVO> list = StationDao.allList();
			
			System.out.println(list.size());
			if(list != null){
				url = "charging.jsp";
					   
				request.setAttribute("list", list);
			}
			System.out.println(url);
			
		} catch (SQLException e) {
			request.setAttribute("msg", "에러");
		}
		
		System.out.println(url);
		request.getRequestDispatcher(url).forward(request, response);
	}
}
