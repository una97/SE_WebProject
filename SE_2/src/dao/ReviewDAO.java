package dao;
import dto.Product;
import dto.Review;
import java.util.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.*;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
    private String url = "jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC&useSSL=false";   

    public ReviewDAO() {
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
    
	public int addReview(int o_id, String u_id, int r_star, String r_content){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(from);
		
    	String SQL = "insert into review (o_id, u_id, r_date, r_star, r_content) values(?,?,?,?);";
    	try {
    		pstmt=conn.prepareStatement(SQL);
    		pstmt.setInt(1, o_id);
    		pstmt.setString(2, to);
    		pstmt.setInt(3, r_star);
    		pstmt.setString(4, r_content);
    		
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }
	
	public int addReply(int o_id, String u_id, String comment){
		String newComment = u_id+","+comment+";";
    	String SQL = "UPDATE review SET r_reply = CONCAT(IFNULL(r_reply,\"\"), ?) WHERE o_id=?";
    	try {
    		pstmt=conn.prepareStatement(SQL);
    		pstmt.setString(1, newComment);
    		pstmt.setInt(2, o_id);
    		
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }
    public ArrayList<Review> reviewSelect(String p){
        ResultSet rs=null;
        Statement stmt = null;
        
        ArrayList<Review> rdtos = new ArrayList<Review>();
        try{
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(p);
            while(rs.next()){
                Integer o_id = rs.getInt("o_id");
                String u_id = rs.getString("u_id");
                String r_date = rs.getString("r_date");
                Integer r_star = rs.getInt("r_star");
                String r_content = rs.getString("r_content");
                String r_reply = rs.getString("r_reply");
                Integer r_like = rs.getInt("r_like");
                Integer r_hate = rs.getInt("r_hate");
                Review rdto = new Review(o_id,u_id, r_date, r_star, r_content, r_reply, r_like, r_hate);
                rdtos.add(rdto);
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
        return rdtos;
    }
    
    
}
