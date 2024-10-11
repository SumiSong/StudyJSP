package net.fullstack7.member;

import java.util.ArrayList;
import java.util.List;
import net.fullstack7.common.DBConnPool;

public class MemberDAO extends DBConnPool{
	public MemberDAO() {
		super();
	}
	//회원 정보 조회
	public MemberDTO getMemberInfo(String memberId, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT memberId, name, pwd From tbl_member WHERE memberId = ? ";
		boolean check_id_flag = false;
		boolean check_pwd_flag = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memberId);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				check_id_flag  = true;
				if(pwd.equals(rs.getString("pwd"))) { 
					check_pwd_flag = true;
				}
				
				if(check_id_flag && check_pwd_flag) {
					dto.setMemberId(memberId);
					dto.setPwd(pwd);
					dto.setName(rs.getString("name"));
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

			
		return dto;
	}
	
	public MemberDTO getMemberById(String memberId) {
		MemberDTO dto = null;
		String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId =?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memberId);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMemberId(rs.getString("memberId"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
			}

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return dto;
	}
	
	//회원 목록
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member";
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setMemberId(rs.getString("memberId"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					memberList.add(dto);
				}
			}
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return memberList;
	}
	
	//회원 정보
	public boolean setMemberInfo(String memberId, String name, String pwd) {
		String sql = "INSERT INTO tbl_member(memberId, name, pwd) VALUES(?,?,?)";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
	        pstm.setString(1, memberId);
	        pstm.setString(2, name);
	        pstm.setString(3, pwd);
	        int resultRow = pstm.executeUpdate();
	        if (resultRow > 0) {
	             result = true;
	         }
		}catch(Exception e) {
			System.out.println(e.getMessage());

		}
		return result;
	}
	
	//회원 수정
	public boolean setMemberInfoUpdate(String memberId, String name, String pwd) {
		 String sql = "UPDATE tbl_member SET name = ?, pwd = ? WHERE memberId = ?";
		 boolean result = false;
		 try {
			 pstm = con.prepareStatement(sql);
			 pstm.setString(1, name);  
		     pstm.setString(2, pwd); 
		     pstm.setString(3, memberId);
		     int resultRow = pstm.executeUpdate();
	         if (resultRow > 0) {
	             result = true;
	         }

		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }
		return result;
		
	}
	
	//회원 삭제
	public boolean setMemberDelete(String memberId) {
		 String sql = "DELETE FROM tbl_member WHERE memberId = ?";
		 boolean result = false;
		 try {
			 pstm = con.prepareStatement(sql);
			 pstm.setString(1, memberId);
		     int resultRow = pstm.executeUpdate(); 
		     if (resultRow > 0) {
	             result = true;
	         }
		 }catch(Exception e) {
			 System.out.println(e.getMessage());
		 }
		return result;
	}
	
	// 체크박스 삭제
	public boolean setMemberDeleteCheckBox(List<String> list) {
		StringBuilder sql = new StringBuilder("DELETE FROM tbl_member WHERE memberId IN (");
		boolean result = false;
		if (list != null) {
			 for (int i = 0; i < list.size(); i++) {
					sql.append("'");
					sql.append(list.get(i));
					sql.append("'");
			        if (i < list.size() - 1) {
			            sql.append(","); 
			        }
			 	}
			 sql.append(")");
			 System.out.println("b");
	    }
		System.out.println(sql);
		try {
			pstm = con.prepareStatement(sql.toString());
			int resultrow = pstm.executeUpdate();
			System.out.println("a");
			System.out.println(resultrow);
			if(resultrow > 0) {
				result = true;
				return result;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(result);
		return result;
		
	}
	
	public boolean setDeleteUserSelf(String sessionMemberId, String memberId) {
		System.out.println(sessionMemberId);
		System.out.println(memberId);
		String sql = "DELETE FROM tbl_member WHERE memberId =?";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			if(sessionMemberId.equals(memberId)) {
				int resultrow = pstm.executeUpdate();
				
				if(resultrow > 0) {
					result = true;
					return result;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}
