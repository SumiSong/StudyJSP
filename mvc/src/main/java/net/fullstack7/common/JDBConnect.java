package net.fullstack7.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con; 
	public Statement stmt; //sql 구문 저장
	public PreparedStatement pstm; //sql 구문 저장
	public ResultSet rs;
	
	//1. 생성자1 (때려박음)
	public JDBConnect() {
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. DB 연결(연결 정보 셋팅)
			//2-1. 주소 URL 설정
			//2-2. 접속 아이디 설정
			//2-3. 비밀번호 
			String url = "jdbc:mariadb://localhost:3306/fullstack7";
			String id = "root";
			String pwd = "1234";
			
			//2.4 드라이버 매니저를 통해 접속
			con = DriverManager.getConnection(url,id,pwd); // 리턴 타입은 데이터베이스 커넥션 객체
			System.out.println("=====================================");
			System.out.println("DB 접근 성공(기본생성자)");
			System.out.println("con1 String :" + con);
			System.out.println("=====================================");
		}
		catch(Exception e) {
			System.out.println("=====================================");
			System.out.println("DB 접근 실패(기본생성자 )");
			System.out.println("getMessage :" + e.getMessage());
			System.out.println("=====================================");
			
		}
	}
	
	//2. 생성자2(매개변수로 받음)
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			//JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("=====================================");
			System.out.println("DB 접근 성공(매개변수 생성자2)");
			System.out.println("con2 String :" + con);
			System.out.println("=====================================");
		}
		catch(Exception e) {
			System.out.println("=====================================");
			System.out.println("DB 접근 실패(매개변수 생성자2)");
			System.out.println("getMessage :" + e.getMessage());
			System.out.println("=====================================");
			
		}
	}
	
	//3. 어플리케이션 객체 이용(web.xml)
		public JDBConnect(ServletContext application) {
			try {
				//DB 연결
				String driver = application.getInitParameter("MariaDriver");
				String url = application.getInitParameter("MariaURL");
				String id = application.getInitParameter("dbId");
				String pwd = application.getInitParameter("dbPwd");
				
				//JDBC 드라이버 로딩
				Class.forName(driver);
				
				
				con = DriverManager.getConnection(url,id,pwd);
				System.out.println("=====================================");
				System.out.println("DB 접근 성공(매개변수 생성자3)");
				System.out.println("con3 String :" + con);
				System.out.println("=====================================");
			}
			catch(Exception e) {
				System.out.println("=====================================");
				System.out.println("DB 접근 실패(매개변수 생성자3)");
				System.out.println("getMessage :" + e.getMessage());
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
