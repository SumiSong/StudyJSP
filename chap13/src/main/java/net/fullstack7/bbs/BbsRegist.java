package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CommonFileUtil;

import java.io.IOException;
import java.util.Map;

@MultipartConfig(
		maxFileSize = 1024*1024*1
		)
@WebServlet("/bbs/BbsRegist.do")
public class BbsRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//업로드 경로 지정
		// String saveDir1 = getServletContext().getRealPath("/Uploads"); --> 배포할 떄 동적으로 처리
		System.out.println("===================================================================");
		System.out.println("BbsRegistOk >> doPost Start");
		String saveDir = "D:\\java7\\JSP\\chap13\\src\\main\\webapp\\Uploads";
		System.out.println("saveDir : " + saveDir);
		
		//요청 받은 파라미터 처리
		String memberId = req.getParameter("memberId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String fileCategoty = req.getParameter("fileCategoty");
		
		
		//파일 업로드
		String orgFileName = CommonFileUtil.FileUpload(req, saveDir, "file");
		Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
		
		
		//DTO 설정
		BbsDTO dto = new BbsDTO();
		dto.setMemberId(memberId);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFileCategory(fileCategoty);
		dto.setFilePath(fmap.get("filePath"));
		dto.setFileName(fmap.get("newFileName"));
		dto.setFileExt(fmap.get("fileExt"));
		dto.setFileSize(Integer.parseInt(fmap.get("fileSize")));
		
		BbsDAO dao = new BbsDAO();
		int result = dao.registFile(dto);
		dao.close();
		if(result > 0) {
			res.sendRedirect("/chap13/bbs/list.jsp");
		}
		else{
			CommonFileUtil.fileDelete(req, saveDir, orgFileName);
			CommonFileUtil.fileDelete(req, saveDir, fmap.get("newFileName"));
			req.setAttribute("errMsg", "게시글 등록시 오류가 발생하였습니다.");
			req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
		}
		
		System.out.println("BbsRegistOk >> doPost End");
		System.out.println("===================================================================");
	}

}
