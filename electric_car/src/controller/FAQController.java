package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import car.dao.FAQDao;
import car.dto.FAQVO;

/** FAQ를 활용하기 위한 servlet */
@WebServlet("/FAQController")
public class FAQController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		System.out.println(command);
		
		if(command.equals("getList")){
			getList(request,response);
		}else if(command.equals("detail")){
			detail(request,response);
		}else if(command.equals("FAQAdd")){
			getAdd(request, response);
		}
		
	}//end of doGet

	/** FAQ 상세 정보를 가져오는 함수 */
	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		FAQDao fd = FAQDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		
		FAQVO f = fd.getFAQ(num);
		request.setAttribute("f", f);
		
		RequestDispatcher rd = request.getRequestDispatcher("faqDetail.jsp");
		rd.forward(request, response);
		
	}//end of detail
	
	/** FAQ 목록을 가져오는 함수 */
	protected void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		FAQDao fd = FAQDao.getInstance();
		List<FAQVO> list = fd.getList();
		
		request.setAttribute("flist",list);
		
		RequestDispatcher rd = request.getRequestDispatcher("info.jsp");
		rd.forward(request, response);
		
	}//end of getList
	
	protected void getAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HttpSession session = request.getSession(false);
		String url = "error.jsp";
		System.out.println(1);
		
		try {
			int num = FAQDao.faqAdd(request.getParameter("title"), request.getParameter("message"), String.valueOf(session.getAttribute("id")));
			
			if(num == 1){
				url = "index.jsp";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}

