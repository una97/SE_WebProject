package dao;

import dto.*;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

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

	public int addOrder(String u_id, int p_id, String u_name, String u_address, String total_price,
			String o_status, String o_phone, String o_email, String u_detailAddress, String o_pay, String o_divide,
			String o_mention) {
		String SQL = "insert into orders (u_id,p_id,o_date,u_name,u_address,total_price,o_status,o_phone,o_email,u_detailAddress,o_pay,o_divide,o_mention) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(from);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, u_id);
			pstmt.setInt(2, p_id); 
			pstmt.setString(3, to);
			pstmt.setString(4, u_name);
			pstmt.setString(5, u_address);
			pstmt.setString(6, total_price);
			pstmt.setString(7, o_status);
			pstmt.setString(8, o_phone);
			pstmt.setString(9, o_email);
			pstmt.setString(10, u_detailAddress);
			pstmt.setString(11, o_pay);
			pstmt.setString(12, o_divide);
			pstmt.setString(13, o_mention);
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
				String o_date = rs.getString("date");;
				String u_name = rs.getString("u_name");
				String u_address = rs.getString("u_address");
				String total_price = rs.getString("total_price");
				String o_status = rs.getString("o_status");
				String o_phone = rs.getString("o_phone");
				String o_email = rs.getString("o_email");
				String u_detailAddress = rs.getString("u_detailAddress");
				String o_pay = rs.getString("o_pay");
				String o_divide = rs.getString("o_divide");
				String o_mention = rs.getString("o_mention");
				
				Order order = new Order(o_id, u_id, p_id, o_date, u_name, u_address, total_price,
						o_status, o_phone, o_email, u_detailAddress, o_pay, o_divide, o_mention);
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
    public ResultSet getOrderer(int p_id) {
		ResultSet rs=null;
		String sql="select * from orders where p_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			System.out.println("DB연결 문제: "+e.getMessage());
		}
		return rs;
	}

}
