package dao;

import dto.*;
import java.util.*;
import java.sql.*;

public class OrderDAO {

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

	public int addOrder(String u_id, int p_id, String o_u_name, String o_u_address, String totalPrice) {
		String SQL = "insert into orders values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
//    		pstmt.setString(1, u_id);
			pstmt.setString(2, u_id);
			pstmt.setInt(3, p_id); 
			pstmt.setString(4, "2019-12-01");
			pstmt.setString(5, o_u_name);
			pstmt.setString(6, o_u_address);
			pstmt.setString(7, totalPrice);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Order> getOrder(String id) {
		ResultSet rs = null;

		String SQL = "select * from orders where u_id=?";
		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Integer o_id = rs.getInt("o_id");
				String u_id = rs.getString("u_id");
				Integer p_id = rs.getInt("p_id");
				String o_date ="2019-01-01";
				String u_name = rs.getString("u_name");
				String u_address = rs.getString("u_address");
				String total_price = rs.getString("total_price");
				String o_status = rs.getString("o_status");
				Order order = new Order(o_id, u_id, p_id, o_date, u_name, u_address, total_price, o_status);
				orderList.add(order);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;

	}
    public ResultSet getResult(String id) {
		ResultSet rs=null;
		String sql="select o_id, u_id, o.p_id, o_date, u_name, u_address, total_price, o_status, p_pic, p_name from orders as o inner join product as p on o.p_id=p.p_id where u_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			System.out.println("DB연결 문제: "+e.getMessage());
		}
		return rs;
	}

}
