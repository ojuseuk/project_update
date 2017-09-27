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

import car.dao.FAQDao;
import car.dao.UpdateDao;
import car.dto.FAQVO;
import car.dto.MemberVO;

/** FAQ를 활용하기 위한 servlet */
@WebServlet("/FAQController")
public class FAQController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getParameter("command");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(command);
		System.out.println("FAQController" +command);
		
		if(command.equals("detail")){
			detail(request,response);
		}else if(command.equals("FAQAdd")){
			getAdd(request, response);
		}else if(command.equals("anw")){
			getAnw(request, response);
		}else if(command.equals("getList")){
			getList(request, response);
		}
		else if(command.equals("update")){
			update(request, response);
		}
		
	}//end of doGet

	/**admin answer update*/
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// session에 저장중인 id를 가져와서 id에 넣어주는 소스입니다.
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("admin");

		System.out.println(id);
		
		String a= request.getParameter("fAQNum");
		String b= request.getParameter("title");
		String c= request.getParameter("content");
		System.out.println("a:"+a);
		System.out.println("b:"+b);
		System.out.println("c:"+c);
		
		FAQVO fv = new FAQVO(id,request.getParameter("title").trim(), request.getParameter("content").trim(),Integer.parseInt(request.getParameter("fAQNum")));
		
		String url = "error.jsp";
		try {
			int num = FAQDao.update(fv);
			request.setAttribute("fv", fv);
			
			if(num == 1){
				url = "adminView.jsp";
			}
			
		} catch (SQLException e) {
			request.setAttribute("error", "에러");
	}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	
	
	
	
	
	/** FAQ 목록을 가져오는 함수 */
	protected void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		FAQDao fd = FAQDao.getInstance();
		List<FAQVO> list = fd.getList();
		
		System.out.println(list.toString());
		
		request.setAttribute("flist",list);
		
		RequestDispatcher rd = request.getRequestDispatcher("faq.jsp");
		rd.forward(request, response);
		System.out.println("Q&A리스트");
		
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
	
	/** FAQ 상세 정보를 가져오는 함수 */
	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		FAQDao fd = FAQDao.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		
		FAQVO f = fd.getFAQ(num);
		request.setAttribute("f", f);
		
		RequestDispatcher rd = request.getRequestDispatcher("faqDetail.jsp");
		rd.forward(request, response);
		
	}//end of detail

	protected void getAnw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int fAQNum = Integer.valueOf(request.getParameter("fAQNum"));
		String url = "error.jsp";
//		System.out.println(request.getParameter("fAQNum"));
		
		try {
			FAQVO faq = FAQDao.answer(fAQNum);
			
			System.out.println(faq.toString());
			if(faq != null){
				url = "answer.jsp";
				request.setAttribute("faq", faq);
			}
			System.out.println(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}

