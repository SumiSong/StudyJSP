package net.fullstack7.test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Hello2Servlet.do")
public class Hello2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Hello2Servlet() {
        super();

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("msg", "어노테이션으로 접근한 경우");
		req.getRequestDispatcher("/Hello2Servlet.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter wr = res.getWriter();
		wr.println("<html>");
		wr.println("<head><title>aaaa</title></head>");
		wr.println("<body>");
		wr.println("<h2>서블릿에서 직접 출력</h2>");
		wr.println("<p>jsp로 포워드 안 함</p>");
		wr.println("</body>");
		wr.println("</html>");
		wr.close();
	}

}
