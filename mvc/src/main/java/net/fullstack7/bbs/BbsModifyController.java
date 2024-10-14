package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CommonFileUtil;
import net.fullstack7.utils.Pagination;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet("/bbs/list")
public class BbsModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		  	String searchCategory = req.getParameter("key");
		    String searchValue = req.getParameter("value");

		    Map<String, String> map = new HashMap<>();
		    map.put("searchCategory", searchCategory != null ? searchCategory : "");
		    map.put("searchValue", searchValue != null ? searchValue : "");
		    

		    BbsDAO dao = new BbsDAO();
		    int totalCnt = dao.getTotalBbsCnt(map);
		    //System.out.println(totalCnt);

		    // 페이징 처리
		    int pageNo = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		    int pageSize = 10;
		    int blockSize = 5;
		    Pagination paging = new Pagination(pageNo, totalCnt, pageSize, blockSize);
		    int startIdx = paging.getStartIndex();
		    int startBlock = paging.getStartBlockPage();
		    int endBlock = paging.getEndBlockPage();
		    
		    List<BbsDTO> list = dao.listAll(map, startIdx, pageSize);

		    // 데이터 전달
		    req.setAttribute("startBlock", startBlock);
		    req.setAttribute("endBlock", endBlock);
		    req.setAttribute("pageNo", pageNo);
		    req.setAttribute("paging", paging);
		    req.setAttribute("searchCategory", searchCategory);
		    req.setAttribute("searchValue", searchValue);
		    req.setAttribute("list", list);
		    req.getRequestDispatcher("/bbs/list.jsp").forward(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
}
