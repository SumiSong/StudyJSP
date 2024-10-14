package net.fullstack7.bbs;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.fullstack7.common.DBConnPool;

public class BbsDAO extends DBConnPool{
	public BbsDAO() {
		super();
	}
	
	//게시글 등록
	public int regist(BbsDTO dto) {
		System.out.println("===================================================================");
		System.out.println("BbsDAO >> regist(dto) Start");
		int result = 0;
		String sql = "INSERT INTO tbl_bbs(title, memberId, content, displayDate, filePath, fileName, fileExt, fileSize, fileCategory) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getMemberId());
			pstm.setString(3, dto.getContent());
			pstm.setString(4, (dto.getDisplayDate() != null ? dto.getDisplayDate() : ""));
			pstm.setString(5, (dto.getFilePath()  != null ? dto.getFilePath() : ""));
			pstm.setString(6, (dto.getFileName()  != null ? dto.getFileName() : ""));
			pstm.setString(7, (dto.getFileExt()  != null ? dto.getFileExt() : ""));
			pstm.setInt(8, dto.getFileSize());
			pstm.setString(9, (dto.getFileCategory()  != null ? dto.getDisplayDate() : ""));
			
			result = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("게시글 등록 오류");
			e.printStackTrace();
		}
		System.out.println("BbsDAO >> regist End");
		System.out.println("===================================================================");
		return result;
	}
	
	//게시글 조회
	public BbsDTO view(int bbsNo) {
		String sql = "SELECT idx, content";
		return null;
	}
	
	//(view)
	public List<BbsDTO> list(int page, int pageSize, String serachCategory, String searchWord, String sortCateGory, String sortOrder){
		return null;
	}
	
	
	// 게시글 전체 갯수 확인
	public int getTotalBbsCnt(Map<String, String> map) {
		String sql = "SELECT COUNT(idx) FROM tbl_bbs";
		String searchCategory = map.get("searchCategory");
		String searchValue = map.get("searchValue");
		int total = 0;
		
		if(searchValue != null && ! searchValue.isEmpty()) {
			sql+= " WHERE " + searchCategory + " LIKE ? ";
		}
		
		try {
			pstm = con.prepareStatement(sql);
			
			if(searchValue != null && ! searchValue.isEmpty()) {
				pstm.setString(1, "%" + searchValue + "%");
			}
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				total += rs.getInt(1);
			}
			System.out.println("sql: " + sql);
			System.out.println("searchCategory: " + searchCategory);
			System.out.println("searchValue: " + searchValue);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("sql: " + sql);
			e.printStackTrace();
		}
		
		return total;
	}
	
	
	//게시글 목록(view)
	public List<BbsDTO> listAll(Map<String, String> map, int startIdx, int pageSize){
		String sql = "SELECT idx, title, memberId, regDate FROM tbl_bbs";
		String searchCategory = map.get("searchCategory");
		String searchValue = map.get("searchValue");
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		
		//검색이 있을 때 추가
		if(searchValue != null && ! searchValue.isEmpty()) {
			sql+= " WHERE " + searchCategory + " LIKE ? ";
		}
		
		sql+= " ORDER BY idx desc LIMIT ?, ?";
		
		try {
			int idx = 1;
			pstm = con.prepareStatement(sql);
			
			if(searchValue != null && ! searchValue.isEmpty()) {
				pstm.setString(idx++, "%" + searchValue + "%");
			}
			pstm.setInt(idx++, startIdx);
			pstm.setInt(idx, pageSize);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
				list.add(dto);
			}
			System.out.println("sql: " + sql);
			System.out.println("searchCategory: " + searchCategory);
			System.out.println("searchValue: " + searchValue);
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("sql: " + sql);
			e.printStackTrace();
		}

		return list;
	}
	
	//게시글 수정
	public int modify(BbsDTO dto) {
		return 0;
	}
	
	//게시글 삭제
	public int delete(int idx) {
		return 0;
	}

}
