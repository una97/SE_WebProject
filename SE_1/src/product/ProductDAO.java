package product;

import java.sql.*;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			String dbURL ="jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC";
			String dbID ="egg";
			String dbPassword ="12345678";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ResultSet getResult(String sql) {
		ResultSet rs=null;
		try {
			Statement stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println("DB연동 오류입니다 : "+e.getMessage());
		}
		return rs;
	}

}
