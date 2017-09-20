package controller;

import java.io.IOException;
import java.util.ArrayList;

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
		
		if(command.equals("sido")) {
			getCode(request,response);
		}else if(command.equals("csNm")) {
			getCsinfo(request,response);
		}
	}
	
	public void getCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sido = request.getParameter("SI_DO");
		System.out.println(sido);
		ArrayList<StationVO> staList = StationDao.infoStation(sido);
		
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
}
