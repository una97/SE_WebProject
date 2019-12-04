package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Event;

public class EventDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public EventDAO() {
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
	public ArrayList<Event> productSelect(String q){
        ResultSet rs=null;
        Statement stmt = null;

        ArrayList<Event> edtos = new ArrayList<Event>();
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(q);
            while(rs.next()){
                Integer idx = rs.getInt("e_id");
                String name = rs.getString("e_name");
                Integer price = rs.getInt("e_price");
                String picture = rs.getString("e_pic");
                String info = rs.getString("e_info");
                Integer stock = rs.getInt("e_stock");
                String sdate = rs.getString("e_sdate");
                String edate = rs.getString("e_edate");
                Event pdto = new Event(idx, name, price, picture, info, stock, sdate,edate);
                edtos.add(pdto);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(rs!=null)rs.close();
                if(stmt!=null)stmt.close();
                if(conn!=null)conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return edtos;
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
	public int add(int e_id, String e_name, int e_price, String e_pic, String e_info, int e_stock, String e_sdate, String e_edate) {
		String SQL = "insert into event values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, e_id);
			pstmt.setString(2, e_name);
			pstmt.setInt(3, e_price); 
			pstmt.setString(4, e_pic);
			pstmt.setString(5, e_info);
			pstmt.setInt(6, e_stock);
			pstmt.setString(7, e_sdate);
			pstmt.setString(8, e_edate);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
