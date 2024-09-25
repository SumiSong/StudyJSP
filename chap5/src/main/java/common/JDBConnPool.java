package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstm;
	public ResultSet rs;
	
	public JDBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)ctx.lookup("jdbc_fullstack7"); // 환경 설정 정보를 가져온 후
			con = ds.getConnection(); // 연결
			
			System.out.println("=====================================");
			System.out.println("DB 커넥션풀 접속 성공(커넥션풀)");
			System.out.println("커넥션풀 :" + con);
			System.out.println("=====================================");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("=====================================");
			System.out.println("DB 커넥션풀 접속 연결 실패(커넥션풀)");
			System.out.println(e.getMessage());
			System.out.println("=====================================");
		}
		
	}
	
	// 연결 해제(리소스 자원 반납)
		public void close() {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(pstm != null) {
					pstm.close();
				}
				if(con != null) {
					con.close();
				}
				
				System.out.println("=========================");
				System.out.println("JDBC 해제");
				System.out.println("=========================");
			}
			catch(Exception e) {
				System.out.println("=========================");
				System.out.println(e.getMessage());
				System.out.println("=========================");
			}

		}
}
