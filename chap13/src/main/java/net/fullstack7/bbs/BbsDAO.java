package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.fullstack7.common.DBConnPool;
import net.fullstack7.member.MemberDTO;
import net.fullstack7.utils.CommonDateUtil;

	public class BbsDAO extends DBConnPool{
		CommonDateUtil dateUtil = new CommonDateUtil();
	public BbsDAO(){
			super();
		}
	
	public List<BbsDTO> getBbsList(){
		List<BbsDTO> BbsList = new ArrayList<BbsDTO>();
		String sql = "SELECT idx, title, memberId, readCnt, regDate FROM tbl_bbs";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
				//dto.setRegDate(dateUtil.toLocalDateTime(rs.getTimestamp("regDate")));

				BbsList.add(dto);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
		    close();
		}
		return BbsList;
	}
	
	public boolean setRegistBbs(String title, String content, String memberId) {
		String sql = "INSERT INTO tbl_bbs(title, content, memberId) VALUES(?, ?, ?) ";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, memberId);
			int resultRow = pstm.executeUpdate();
			
			if(resultRow > 0) {
				result = true;
				return result; 
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
		    close();
		}
		return result;
	}
	
	public BbsDTO getBbsInfo(String idx) {
		BbsDTO dto = null;
		String sql = "SELECT idx, title, memberId, content FROM tbl_bbs WHERE idx = ?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, idx);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setContent(rs.getString("content"));
			}
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
		    close();
		}
		return dto;
	}
	
	public BbsDTO getBbsInfo(int idx, String session_id) {
		BbsDTO dto = null;
		System.out.println(session_id);
		if(getCheckUser(idx, session_id)) {
		String sql = "SELECT idx, title, memberId, content FROM tbl_bbs WHERE idx = ?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setContent(rs.getString("content"));
			}
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
		    close();
		}
		}
		else {
			System.out.println("게시글 수정 불가");
		}
		return dto;
	}
	
	public boolean setModifyBbs(int idx,String title, String content, String session_id) {
		 boolean result = false;
		 if (getCheckUser(idx,session_id)) {
			String sql = "UPDATE tbl_bbs SET title = ?, content = ? WHERE idx = ?";
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, title);
				pstm.setString(2, content);
				pstm.setInt(3, idx);
				int resultrow = pstm.executeUpdate();
				
				if(resultrow > 0) {
					result = true;
					return result;
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
			    close();
			}
			return result;
		}else {
			System.out.println("사용자 권한이 없습니다.");
		}
		return result;
	}
	
	public boolean setDeleteBbs(int idx, String session_memberId) {
		boolean result = false;
		if(getCheckUser(idx, session_memberId)) {
			String sql = "DELETE FROM tbl_bbs WHERE idx = ?";
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, idx);
				int resultrow = pstm.executeUpdate();
				
				if(resultrow > 0) {
					result = true;
					return result;
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				close();
			}
		}
		else {
			System.out.println("게시글 삭제 불가");
		}
		return result;
	}
	
	public int deleteSelectedBbs(List<Integer> bbsIdxList) {
	    int result = 0;
	    StringBuilder sql = new StringBuilder("DELETE FROM tbl_bbs WHERE idx IN (");
	    
	    for (int i = 0; i < bbsIdxList.size(); i++) {
	        sql.append(bbsIdxList.get(i)); 
	        if (i < bbsIdxList.size() - 1) {
	            sql.append(","); 
	        }
	    }
	    sql.append(")");
	    
	    try {
	        pstm = con.prepareStatement(sql.toString());
	        result = pstm.executeUpdate();
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    } finally {
	        close();
	    }
	    return result;
	}
	
	public int getTotalBbsCnt(Map<String, String> map) {
		String key = map.get("searchKey");
		String value = map.get("searchValue");
		String sql = "SELECT COUNT(idx) FROM tbl_bbs";
		int total = 0;
		if(key != null && !value.isEmpty()) {
			sql += " WHERE " + key + " Like ?";
		}
		try {
			pstm = con.prepareStatement(sql);
			if(key != null && !value.isEmpty()) {
				pstm.setString(1, "%" + value + "%");
			}
			rs = pstm.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(total);
		return total;
	}
	

	public List<BbsDTO> getBbsCnt(int startPage, int pageSize){
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		 String sql = "SELECT idx, title, memberId, content, readCnt, regDate FROM tbl_bbs ORDER BY idx LIMIT ?, ?";
		try {
			pstm = con.prepareStatement(sql);  
			pstm.setInt(1, startPage);
			pstm.setInt(2, pageSize);
			rs = pstm.executeQuery();
			while(rs.next()) {
				 BbsDTO dto = new BbsDTO();
		            dto.setIdx(rs.getInt("idx"));
		            dto.setTitle(rs.getString("title"));
		            dto.setMemberId(rs.getString("memberId"));
		            dto.setContent(rs.getString("content"));
		            dto.setReadCnt(rs.getInt("readCnt"));
		            dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
		            list.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// 검색값이 있을 때 limit 하는 페이징
	public List<BbsDTO> getBbsCnt(Map<String, String> map, int startIndex, int pageSize) {
	    String searchKey = map.get("searchKey");
	    String searchValue = map.get("searchValue");
	    List<BbsDTO> list = new ArrayList<BbsDTO>();

	    String sql = "SELECT idx, title, memberId, content, readCnt, regDate FROM tbl_bbs";
	    
	    if (searchValue != null && !searchValue.isEmpty()) {
	        sql += " WHERE " + searchKey + " LIKE ?";
	    }
	    sql += " ORDER BY idx LIMIT ?, ?";

	    try {
	        pstm = con.prepareStatement(sql);
	        int idx = 1;


	        if (searchValue != null && !searchValue.isEmpty()) {
	            pstm.setString(idx++, "%" + searchValue + "%");
	        }

	        pstm.setInt(idx++, startIndex); 
	        pstm.setInt(idx, pageSize);  

	        rs = pstm.executeQuery();

	        while (rs.next()) {
	            BbsDTO dto = new BbsDTO();
	            dto.setIdx(rs.getInt("idx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setContent(rs.getString("content"));
	            dto.setReadCnt(rs.getInt("readCnt"));
	            dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
	            list.add(dto);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



	public List<BbsDTO> getSelectWord(Map<String, String> map){
		List<BbsDTO> selectList = new ArrayList<BbsDTO>();
		String searchKey = map.get("searchKey");
	    String searchValue = map.get("searchValue");
		String sql = "SELECT idx, title, content, readCnt, regDate FROM tbl_bbs WHERE ? % LIKE ?%";

	    try {
	        pstm = con.prepareStatement(sql);
	        if (searchValue != null) {
	        	pstm.setString(1, searchKey);
	            pstm.setString(2, searchValue);
	        }
	        rs = pstm.executeQuery();
	        
	        while (rs.next()) {
	            BbsDTO dto = new BbsDTO();
	            dto.setIdx(rs.getInt("idx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setReadCnt(rs.getInt("readCnt"));
	            dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
	            selectList.add(dto);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return selectList;
	}
	
	public boolean getCheckUser(int idx, String session_memberId) {
		System.out.println("getCheckUser" + session_memberId);
		boolean result = false;
		 String sql = "SELECT memberId FROM tbl_bbs WHERE idx = ? AND memberId = ?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
	        pstm.setString(2, session_memberId); 
			rs = pstm.executeQuery();
			if (rs.next()) {
	            result = true;
	        }
	    } catch(Exception e) {
	        System.out.println(e.getMessage());
	    }
	    System.out.println("사용자 인증 결과: " + result);
	    return result;
	}
	
	
	
	
	
	
	
	// 파일 등록(나중에는 파일 관련 DTO도 추가해줘야함)
	public int registFile(BbsDTO dto) {
		System.out.println("BbsDAO >> registFile Start");
		int result = 0;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO tbl_bbs(");
			sb.append("memberId, title, content"); 
			sb.append(", filePath, fileName, fileExt, fileSize, fileCategory"); 
			sb.append(") VALUES ("); 
			sb.append("?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstm = con.prepareStatement(sb.toString());
			pstm.setString(1, dto.getMemberId());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			pstm.setString(4, dto.getFilePath());
			pstm.setString(5, dto.getFileName());
			pstm.setString(6, dto.getFileExt());
			pstm.setInt(7, dto.getFileSize());
			pstm.setString(8, dto.getFileCategory());
			
			result = pstm.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시글 등록시 에러가 발생하였습니다.");
			System.out.println(e.getMessage());
		}
		System.out.println("BbsDAO >> registFile End");
		System.out.println("===================================================================");
		return result;
	}
	
	//파일 수정
	public int modifyFile(BbsDTO dto) {
		return 0;
	}
	//파일 삭제
	public int deleteFile(BbsDTO dto) {
		return 0;
	}
	//파일 목록
	
	public List<BbsDTO> listFile(Map<String, String> pmap){
		//1. pmap 상태에 따라 sql 생성
		//2. prepared  statement 실행
		//3. 결과 리턴
		return null;
	}
}
