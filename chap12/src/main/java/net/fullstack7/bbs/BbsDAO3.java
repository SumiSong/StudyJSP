package net.fullstack7.bbs;

import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class BbsDAO3 extends DBConnPool{
	public BbsDAO3() {
		super();
	}
	
	public List<BbsDTO> getBbsList() {
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		String sql = "SELECT idx, title, memberId, regDate FROM tbl_bbs";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					BbsDTO dto = new BbsDTO();
					dto.setIdx(rs.getInt("idx"));
					dto.setTitle(rs.getString("title"));
					dto.setMemberId(rs.getString("memberId"));
					dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
					list.add(dto);
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
	        close();
	    }
		return list;
	}
	
	public boolean setBbsInfo(String title, String content, String memberId) {
		String sql = "INSERT INTO tbl_bbs(title, content, memberId) VALUES(?, ?, ?)";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, memberId);
			int resultrow = pstm.executeUpdate();
			
			if(resultrow > 0) {
				result = true;
				return result;
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
	        close();
	    }
		return result;
	}
	
	public BbsDTO getBbsView(String title) {
		String sql = "SELECT title, content, memberId FROM tbl_bbs WHERE title =?";
		BbsDTO dto = null;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			rs = pstm.executeQuery();
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setMemberId(rs.getString("memberId"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
	        close();
	    }
		return dto;
	}
	
	public boolean setModifyBbs(String title, String content) {
		System.out.println(title);
		System.out.println(content);
		String sql = "UPDATE tbl_bbs SET title = ?, content = ? WHERE title = ?";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, title);
			int resultrow = pstm.executeUpdate();
			
			if(resultrow > 0) {
				result = true;
				return result;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
	        close();
	    }
		return result;
	}
	
	public boolean setDeleteBbs(int idx, String session_memberId) {
		String sql = "SELECT memberId from tbl_bbs where idx =?";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, idx);
			rs = pstm.executeQuery();
			if(rs.next()) {
				String postId = rs.getString("memberId");
				
				if(postId.equals(session_memberId)) {
					String deleteSql = "DELETE FROM tbl_bbs WHERE idx =?";
					try {
						pstm = con.prepareStatement(deleteSql);
						pstm.setInt(1, idx);
						int resultrow = pstm.executeUpdate();
						
						if(resultrow > 0) {
							result = true;
							return result;
						}
					}catch(Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public int deleteSelectedBbs(List<Integer> bbsIdxList) {
	    int result = 0;
	    StringBuilder sql = new StringBuilder("DELETE FROM tbl_bbs WHERE idx IN (");
	    
	    for (int i = 0; i < bbsIdxList.size(); i++) {
	        sql.append(bbsIdxList.get(i)); // idx 값을 추가
	        if (i < bbsIdxList.size() - 1) {
	            sql.append(",");  // 마지막 값이 아니라면 콤마 추가
	        }
	    }
	    sql.append(")");  // 쿼리 닫기
	    
	    try {
	        pstm = con.prepareStatement(sql.toString());  // 완성된 쿼리 문자열을 PreparedStatement로 실행
	        result = pstm.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close();  // 자원 해제
	    }
	    
	    return result;  // 삭제된 행의 수 반환
	}

	
	
}
