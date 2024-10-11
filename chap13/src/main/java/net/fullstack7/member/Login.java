package net.fullstack7.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.fullstack7.utils.CommonUtils;

import java.io.IOException;

@WebServlet("/member/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init() throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    if ("logout".equals(action)) {
	        logout(request, response); // 로그아웃
	    } else {
	        showLoginForm(request, response); // 로그인 폼 표시
	    }
	}
	private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String memberId = (String)session.getAttribute("memberId");
	    String memberName = (String)session.getAttribute("name");
	    CommonUtils COOKs = new CommonUtils();
	    String saveIdFlag = COOKs.getCookiesInfo(request, "save_id_flag");
	    String saveUserId = (saveIdFlag != null && saveIdFlag.equals("Y")) ? COOKs.getCookiesInfo(request, "save_user_id") : "";
	    request.setAttribute("memberId", memberId);
	    request.setAttribute("memberName", memberName);
	    request.setAttribute("saveIdFlag", saveIdFlag);
	    request.setAttribute("saveUserId", saveUserId);
	    
	    request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("memberId");
        session.removeAttribute("memberName");
        session.invalidate();
        // 로그아웃 후 리다이렉트
         request.setAttribute("message", "로그아웃 되었습니다.");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
	
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("login".equals(action)) {
        	Login(request, response);
        } else {
            // 다른 POST 요청 처리 
            //response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
        	request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
	
    // 로그인 처리 메서드
    private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String pwd = request.getParameter("pwd");
        String saveIdFlag = request.getParameter("save_id_flag");
        
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.getMemberInfo(user_id, pwd);
        dao.close();
        if (dto != null && dto.getMemberId() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("memberId", dto.getMemberId());
            session.setAttribute("name", dto.getName());
            if (saveIdFlag != null && saveIdFlag.equals("Y")) {
                CommonUtils COOKs = new CommonUtils();
                COOKs.setCookiesInfo(request, response, "/", 60*60*24*30, "", "save_id_flag", "Y"); // 30일 유지
                COOKs.setCookiesInfo(request, response, "/", 60*60*24*30, "", "save_user_id", dto.getMemberId());
                COOKs.setCookiesInfo(request, response, "/", 60*60*24*30, "", "save_user_name", dto.getName());
            }
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
	
	
}
