package dao;

import dto.*;
import java.util.*;
import java.sql.*;


public class OrderDAO{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public OrderDAO() {
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

	
}


