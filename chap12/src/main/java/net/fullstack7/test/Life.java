package net.fullstack7.test;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Life
 */
@WebServlet("/Life.do")
public class Life extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("========================================================");
		System.out.println("Life Servlet Start");
		System.out.println("@PostConstruct : myPostConstruct 호출");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(req, res);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//res.getWriter().append("Served at: ").append(req.getContextPath());
		System.out.println("doGet() 호출");
		req.getRequestDispatcher("/life.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(req, res);
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/life.jsp").forward(req, res);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy() 호출");
	}
	
	@PreDestroy
	public void myPreDestroy() {
		System.out.println("@PreDestroy : myPreDestroy() 호출");
		System.out.println("Life Servlet End");
		System.out.println("========================================================");
	}

}
