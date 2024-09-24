package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstm;
	public ResultSet rs;
	
	public JDBConnect() {
		try {
			//JDBC 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			//DB 연결
			String url = "jdbc:mariadb://localhost:3306/fullstack7";
			String id = "root";
			String pwd = "1234";
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch(Exception e) {
			
		}
	}
}
