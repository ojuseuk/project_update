package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.dao.AdminDAO;
import car.dao.FAQDao;
import car.dao.JoinDao;
import car.dao.LoginDAO;
import car.dao.UpdateDao;
import car.dto.FAQVO;
import car.dto.MemberVO;

@WebServlet("/logSc")
public class MemberController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("MemberController : " + command);
		
		if (command.equals("login")) {
			login(request, response);
			/* response.sendRedirect("loginView.jsp"); */
		} else if (command.equals("join")) {
			insertMember(request, response);
			System.out.println("가입성공");
		} else if (command.equals("update")) {
			update(request, response);
			System.out.println("수정");
		} else if (command.equals("info")) {
			System.out.println("개인정보");
			info(request, response);
		} else if (command.equals("check")){
			getCheck(request, response);
		} 
		
	}
	
	/** 개인정보와 FAQ 질문과 답변을 확인할수 있는 개인정보 페이지를 가기위한 메소드 */
	private void info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// session에 저장중인 id를 가져와서 id에 넣어주는 소스입니다.
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");

		System.out.println(id);

		// id값 을 가지고 넣어주면 되기 때문에 VO에 데이터를 넣어줄 필요가 없습니다.
		// MemberVO infomem = new MemberVO();
		// infomem.setId(id);
		String url = null;

		// 아래 처럼 getInstance를 사용할경우 그 안에 있는 어떤 함수를 불러 올지 사용해주어야 합니다.
		// LoginDAO.getInstance();
		/** 수정한 부분 */
		Map<MemberVO, List<FAQVO>> map = LoginDAO.getInstance().getUserInfo(id);
		
		// 개인정보를 확인해야 하기 때문에 id만 넘겨주는것이 아니라 아래처럼 memberVO 전체를 넘겨주어야 합니다.
		// request.setAttribute("id", id);

		Set<MemberVO> mem = map.keySet();
		MemberVO member = null;
		List<FAQVO> list = null;
		
		for (MemberVO memberVO : mem) {
			member = memberVO;
			list = map.get(memberVO);
		}
		System.out.println(list.size());
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		url = "info.jsp";

		request.getRequestDispatcher(url).forward(request, response);
		
	}// end of info
	

	/** 로그인을 위한 메소드 (admin과 member)로그인을 따로구분 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// id와 password를 받아와서 수정한 부분처럼 바로 넘겨주면 되기 때문에 VO에 담아줄 필요가 없습니다.
		// MemberVO loginMember = new MemberVO();
		// loginMember.setId(id);
		// loginMember.setPassword(password);
		String url = "error.jsp";

		// 아래 처럼 getInstance를 사용할경우 그 안에 있는 어떤 함수를 불러 올지 사용해주어야 합니다.
		// LoginDAO.getInstance();
		// request.setAttribute("id", id);
		// request.setAttribute("pwd", password);
		int num =0;
		/** 수정한 부분 */
		String idCheck = id.substring(0, 5);
		try {
			if(idCheck.equals("admin")){
					num = AdminDAO.loginCheck(id, password);
			}else{
				num = LoginDAO.getInstance().loginCheck(id, password);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/** 만약 id가 admin이고 password가 1111이면 adminView.jsp로 이동한다  */
		System.out.println(num);
		
		if(num == 1){
			HttpSession session = request.getSession();
			if (id.equals("admin")) {
				session.setAttribute("admin", id);
				url = "adminView.jsp";
			}else{
				session.setAttribute("id", id);
				url = "index.jsp";
			}
			
		}
		System.out.println(url);
		request.getRequestDispatcher(url).forward(request, response);

	}//end of login

	/** 회원가입을 위한 메소드 */
	public void insertMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id").trim();
		String pw = request.getParameter("password").trim();
		String name = request.getParameter("name").trim();
		String mail = request.getParameter("mail").trim();
		String addr = request.getParameter("addr").trim();
		String phone = request.getParameter("phone").trim();
		MemberVO mem = new MemberVO(id, pw, name, mail, addr, phone);
		String url = "error.jsp";

		try {
			JoinDao.memberJoin(mem);
			request.setAttribute("mem", mem);
			url = "index.jsp";
		} catch (Exception e) {
			request.setAttribute("error", "입력 실패");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}// end of insertMember

	/** 회원정보 수정을 위한 메소드 */
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mem = new MemberVO(request.getParameter("id").trim(), request.getParameter("password").trim(),
				request.getParameter("name").trim(), request.getParameter("email").trim(),
				request.getParameter("addr").trim(), request.getParameter("phone").trim());
		
		String url = "error.jsp";
		try {
			int num = UpdateDao.update(mem);
			request.setAttribute("mem", mem);
			
			if(num == 1){
				url = "index.jsp";
			}
			
		} catch (SQLException e) {
			request.setAttribute("error", "에러");
		}
		request.getRequestDispatcher(url).forward(request, response);
	} // end of update
	
	/** 아이디 중복 확인을 위한 메소드 */
	private void getCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		String url ="error.jsp";
		
		try {
			int num = LoginDAO.idcheck(id);
			
			if(num == 1){
				url="login/idcheck.jsp";
				request.setAttribute("msg", "아이디가 존재합니다.");
			}else if(num == 0){
				url="login/idcheck.jsp";
				request.setAttribute("msg", "아이디가 존재하지않습니다.");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}// end of getCheck
}
