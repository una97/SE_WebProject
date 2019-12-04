package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Question;

public class QuestionDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
    private String url = "jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC&useSSL=false";
    
    public QuestionDAO() {
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
	public int addQuestion(int p_id, String u_id, String title, String content){
	
    	String SQL = "insert into question (p_id, u_id, title, content) values(?,?,?,?);";
    	try {
    		pstmt=conn.prepareStatement(SQL);
    		pstmt.setInt(1, p_id);
    		pstmt.setString(2, u_id);
    		pstmt.setString(3, title);
    		pstmt.setString(4, content);
    		
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }
	public int addReply(int q_id, String u_id, String comment){
		String newComment = u_id+","+comment+";";
    	String SQL = "UPDATE question SET reply = CONCAT(IFNULL(reply,\"\"), ?) WHERE q_id=?";
    	try {
    		pstmt=conn.prepareStatement(SQL);
    		pstmt.setString(1, newComment);
    		pstmt.setInt(2, q_id);
    		
    		return pstmt.executeUpdate();
    		
    	}catch (Exception e) {
			e.printStackTrace();		
			}
    	return -1;
    }
	   public ArrayList<Question> questionSelect(String p){
	        ResultSet rs=null;
	        Statement stmt = null;
	        
	        ArrayList<Question> qdtos = new ArrayList<Question>();
	        try{
	            stmt = conn.createStatement();
	            
	            rs = stmt.executeQuery(p);
	            while(rs.next()){
	            	Integer q_id = rs.getInt("q_id");
	                Integer p_id = rs.getInt("p_id");
	                String u_id = rs.getString("u_id");
	                String title = rs.getString("title");
	                String content = rs.getString("content");
	                String reply = rs.getString("reply");
	                Question qdto = new Question(q_id, p_id,u_id, title, content, reply);
	                qdtos.add(qdto);
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
	        return qdtos;
	    }
}
