package dao;

import dto.*;
import java.util.*;
import java.sql.*;

public class CartDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String url = "jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC&useSSL=false";

	public CartDAO() {
		try {
			String dbURL = "jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC";
			String dbID = "egg";
			String dbPassword = "12345678";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addCart(String u_id, int p_id ){
    	String SQL ="insert into cart values(?,?,?,?)";
    	try {
    		pstmt=conn.prepareStatement(SQL);
    		pstmt.setString(1, u_id);
    		pstmt.setInt(2, p_id);
    		pstmt.setInt(3, 1); //수량 추후 계산
    		pstmt.setString(4, "price");//가격 계산
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }

}