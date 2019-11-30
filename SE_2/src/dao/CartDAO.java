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
    		pstmt.setInt(3, 1); //�닔�웾 異뷀썑 怨꾩궛
    		pstmt.setString(4, "price");//媛�寃� 怨꾩궛
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }
	public ArrayList<Cart> getCart(String u_id) {
		ResultSet rs=null;
        Statement stmt = null;
        
		String SQL = "select * from cart where c_u_id=?";
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String c_u_id = rs.getString("c_u_id");
				Integer c_p_id = rs.getInt("c_p_id");
				Integer c_quantity = rs.getInt("c_quantity");
				String c_price = rs.getString("c_price");
				Cart cart = new Cart(c_u_id, c_p_id, c_quantity, c_price);
				System.out.println(cart.getPrice() + "won");
				cartList.add(cart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return cartList;
	}
}