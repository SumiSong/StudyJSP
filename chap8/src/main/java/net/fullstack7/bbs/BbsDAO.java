package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;
import net.fullstack7.member.MemberDTO;

	public class BbsDAO extends DBConnPool{
	public BbsDAO(){
			super();
		}
	
	public List<BbsDTO> getBbsList(){
		List<BbsDTO> BbsList = new ArrayList<BbsDTO>();
		String sql = "SELECT idx, title, memberId, readCnt, regDate FROM tbl_bbs";
		//sql += " AND idx IN (?) ";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setIdx(rs.getInt("readCnt"));
				dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
				BbsList.add(dto);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
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
		}
		return result;
	}
	
	public BbsDTO getBbsInfo(String title) {
		BbsDTO dto = null;
		String sql = "SELECT title, memberId, content FROM tbl_bbs WHERE title = ?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				//System.out.println("a");
				dto = new BbsDTO();
	            dto.setTitle(rs.getString("title"));
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setContent(rs.getString("content"));
	            //System.out.println("bbbb");
			}
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return dto;
	}
	
	public boolean setModifyBbs(String title, String content) {
		//System.out.println(title);
		//System.out.println(content);
		String sql = "UPDATE tbl_bbs SET title = ?, content = ? WHERE title = ?";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, title);
			int resultrow = pstm.executeUpdate();
			System.out.println("b");
			
			if(resultrow > 0) {
				System.out.println("a");
				result = true;
				return result;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(result);
		return result;
	}
	
	public boolean setDeleteBbs(String title) {
		String sql = "DELETE FROM tbl_bbs WHERE title =?";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			int resultrow = pstm.executeUpdate();
			
			if(resultrow > 0) {
				result = true;
				return result;
			}
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}
}
