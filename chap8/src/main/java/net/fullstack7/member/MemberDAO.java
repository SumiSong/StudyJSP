package net.fullstack7.member;
import net.fullstack7.common.DBConnPool; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


public class MemberDAO extends DBConnPool{
	public MemberDAO() {
		super();
	}
	 
	
//	public MemberDAO(String driver, String url, String id, String pwd) {
//		super(driver, url, id, pwd);
//	}
	
	/**
	 * @desc 아이디로 회원 정보 조회
	 * @param user_id String
	 * @return MemberDTO
	 * 
	 * @example getMemberInfo('user1')
	 */
	
	public List<MemberDTO> getMemberInfo(String user_id) {
		String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE memberId = ?";
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberId(rs.getString("memberId"));
	            dto.setName(rs.getString("name"));
	            dto.setPwd(rs.getString("pwd"));
	            list.add(dto);
			}
		}catch(Exception e) {
			System.out.println("getMessage :" + e.getMessage());
		}
		
		return list;
	}
	
	
	public MemberDTO getMemberInfo(String user_id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ?;";

		boolean check_id_flag = false;
		boolean check_pwd_flag = false;
			
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			rs = pstm.executeQuery();
			if(rs.next()) {
				check_id_flag  = true;
				if(pwd.equals(rs.getString("pwd"))) {
					check_pwd_flag = true;
				}
				
				if(check_id_flag && check_pwd_flag) {
					dto.setMemberId(user_id);
					dto.setPwd(pwd);
					dto.setName(rs.getString("name"));
				}
			}

		} catch(Exception e) {
			System.out.println("=====================================");
			System.out.println("실패");
			System.out.println("getMessage :" + e.getMessage());
			System.out.println("=====================================");
			
		}
		finally{
			close();
		}
			
		return dto;
	}
	
	
	public List<MemberDTO> getMemberList() {
		//MemberDTO dto = new MemberDTO();
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "SELECT memberId, name, pwd FROM tbl_member";
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					 MemberDTO dto = new MemberDTO(); // 외부에 선언할 때는 dto=null;로 선언하기
					 dto.setMemberId(rs.getString("memberId"));
		             dto.setName(rs.getString("name"));
		             dto.setPwd(rs.getString("pwd"));
		             list.add(dto);
				}
			}
		}catch(Exception e) {
			System.out.println("등록된 회원 정보가 존재하지 않습니다.");
		}

		return list;
	}
	
	
	public boolean setMemberRegist(Map<String, String> memberInfo) {
		
		String sql = "INSERT INTO tbl_member(memberId, name, pwd) VALUES(?,?,?)";
		boolean result = false;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memberInfo.get("member_id"));
			pstm.setString(2, memberInfo.get("name"));
			pstm.setString(3, memberInfo.get("pwd"));
			int rs = pstm.executeUpdate();
			if ( rs > 0 ) {
				return true;
					
			} else {
				return false;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public int setMemberModify(Map memberInfo) {
		return 0;
	}
	
	public int setMemberDelete(String user_id) {
		return 0;
	}

}
