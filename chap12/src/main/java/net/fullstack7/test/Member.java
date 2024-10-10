package net.fullstack7.test;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.member.MemberDAO;
import net.fullstack7.member.MemberDTO;

import java.io.IOException;


//@WebServlet("/Member.mvc")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		dao = new MemberDAO();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//관리자 계정
		String adminId = this.getInitParameter("adminId");
		
		//사용자 계정
		String userId = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		   
		MemberDTO dto = dao.getMemberInfo(userId, pwd);
		System.out.println(dto);
		if(dto != null && dto.getMemberId() != null) {
			req.setAttribute("memberDTO", dto);
			//req.setAttribute("msg", dto.getName() + "회원님(" + dto.getMemberId()+"), 로그인되었습니다");
			msg = dto.getName() + "회원님(" + dto.getMemberId()+"), 로그인되었습니다";
			
		}else {
			if(adminId.equals(userId)) {
				//req.setAttribute("msg", dto.getName() + "관리자(" + adminId +")로, 로그인되었습니다 ");
				msg = "관리자(" + adminId +")로, 로그인되었습니다 ";
			}
			else {
				//req.setAttribute("msg", dto.getName() + "관리자(" + adminId +")로, 로그인되었습니다 ");
				msg = "정회원만 사용 가능한 사이트 입니다.";
			}
		}
		req.setAttribute("msg", msg);
		req.getRequestDispatcher("/Member.jsp").forward(req, res);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}
