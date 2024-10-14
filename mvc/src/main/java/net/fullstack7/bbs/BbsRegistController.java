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
		maxFileSize = 1024*1024*1,
		maxRequestSize = 1024*1024*10
		)
public class BbsRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
		// req.getRequestDispatcher("/WEB-INF/bbs/regist.jsp").forward(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1. 폼 데이터 전송 받아서 변수에 할당
		//2. 파일 업로드 처리 --> 실패시 롤백
		//3. DAO를 통해 DB 프로세스 진행 --> INSERT
		//4. INSERT 상태에 따라서 성공 --> send.redirect -->list || 실패 --> /bbs/regist.jsp
		
		//1.폼 데이터 전송 받아서 변수에 할당 ( 나중 구현할 때 벨리데이션 체크하기)
		BbsDTO dto = new BbsDTO();
		dto.setMemberId(req.getParameter("memberid"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setDisplayDate(req.getParameter("displaydate"));
		
		
		//2. 파일 업로드 처리 --> 실패시 롤백
		String saveDir = "D:\\java7\\JSP\\mvc\\src\\main\\webapp\\uploads";
		System.out.println("saveDir : " + saveDir);
		
		String orgfileName = CommonFileUtil.FileUpload(req, saveDir, "file1");
		String newfileName = "";
		String filePath = "";
		String fileExt = "";
		int fileSize = 0;
		BbsDAO dao = new BbsDAO();
		
		if(!orgfileName.isEmpty()) {
			Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgfileName);
			if(fmap != null ) {
				filePath = fmap.get("filePath");
				orgfileName = fmap.get("orgfileName");
				fileExt = fmap.get("fileExt");
				fileSize = Integer.parseInt(fmap.get("fileSize"));
				
				dto.setFilePath(filePath);
				dto.setFileName(orgfileName);
				dto.setFileExt(fileExt);
				dto.setFileSize(fileSize);
			}
			
			System.out.println("orgfileName : " + orgfileName);
			System.out.println("newfileName : " + fmap.get("newfileName"));
			
			dao = new BbsDAO();
			int result = dao.regist(dto);
			dao.close();
			
			//등록 성공
			if(result > 0) {
				res.sendRedirect("/mvc/bbs/list.jsp");
			}
			else {
				CommonFileUtil.fileDelete(req, saveDir, orgfileName);
				CommonFileUtil.fileDelete(req, saveDir, fmap.get("newfileName"));
				req.setAttribute("errMsg", "게시글 등록시 에러가 발생함");
				req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
			}

		}
		else {
			int result = dao.regist(dto);
			dao.close();
			
			//등록 성공(첨부 파일 없을 때)
			if(result > 0) {
				res.sendRedirect("/mvc/bbs/list.jsp");
			}
			else {
				req.setAttribute("errMsg", "게시글 등록시 에러가 발생함");
				req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
			}
		}
		
		

	}

}
