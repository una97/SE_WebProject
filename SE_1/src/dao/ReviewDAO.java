package dao;
import dto.Product;
import dto.Review;
import java.util.*;
import java.sql.*;

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
    
    public ArrayList<Review> reviewSelect(String p){
        ResultSet rs=null;
        Statement stmt = null;
        
        ArrayList<Review> rdtos = new ArrayList<Review>();
        try{
            conn = DriverManager.getConnection(url, "egg", "12345678");
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(p);
            while(rs.next()){
                Integer r_id = rs.getInt("r_id");
                Integer o_id = rs.getInt("o_id");
                String r_date = rs.getString("r_date");
                Integer r_star = rs.getInt("r_star");
                String r_content = rs.getString("r_content");
                String r_reply = rs.getString("r_reply");
                Integer r_like = rs.getInt("r_like");
                Integer r_hate = rs.getInt("r_hate");
                Review rdto = new Review(r_id, o_id, r_date, r_star, r_content, r_reply, r_like, r_hate);
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
