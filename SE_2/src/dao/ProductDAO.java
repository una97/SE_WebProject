package dao;
import dto.*;
import java.util.*;
import java.sql.*;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
    private String url = "jdbc:mysql://docamp.cgxcxscgnhfb.us-east-2.rds.amazonaws.com:3306/docamp?serverTimezone=UTC&useSSL=false";

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
        
    public ArrayList<Product> productSelect(String q){
        ResultSet rs=null;
        Statement stmt = null;

        ArrayList<Product> pdtos = new ArrayList<Product>();
        try{
            conn = DriverManager.getConnection(url, "egg", "12345678");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(q);
            while(rs.next()){
                Integer idx = rs.getInt("p_id");
                String name = rs.getString("p_name");
                Integer price = rs.getInt("p_price");
                String picture = rs.getString("p_pic");
                String info = rs.getString("p_info");
                Integer stock = rs.getInt("p_stock");
                String category = rs.getString("p_category");
                String sm_category = rs.getString("p_sm_category");
                Product pdto = new Product(idx, name, price, picture, info, stock, category,sm_category);
                pdtos.add(pdto);
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
        return pdtos;
    }
    public ArrayList<Sharing> getSharing(){
        ResultSet rs=null;
        Statement stmt = null;
        String sql =  "select * from product where isShared=1";
        ArrayList<Sharing> shtos = new ArrayList<Sharing>();
        try{
   
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
            	  Integer s_p_id = rs.getInt("p_id");
            	  String s_p_name = rs.getString("p_name");
            	  String s_p_img  = rs.getString("p_pic");
            	  Integer s_p_price =rs.getInt("p_price")* (s_p_id +1)*10/100 ;
            	  Integer discount = (s_p_id +1)*10;
            	  Sharing shto = new Sharing(s_p_id,s_p_name,s_p_img,s_p_price,discount);
            	  shtos.add(shto);
           
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
        return shtos;
    }
    
    
    
    
    public ResultSet getResult(String sql) {
		ResultSet rs=null;
		try {
			Statement stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println("DB���� �����Դϴ� : "+e.getMessage());
		}
		return rs;
	}
    public int upload(int p_id, String p_name, int p_price, String p_pic, int p_stock, String p_info, String p_category, String p_sm_category) {
    	String SQL="";
    	try {
    		if(p_info!=null) {
    			SQL="update product set p_name='"+p_name+"', p_pic='"+p_pic+"', p_stock="+p_stock+
   				 ", p_info='"+p_info+"', p_category='"+p_category+"', p_sm_category='"+p_sm_category+"', p_price="+p_price+" where p_id="+p_id;
    		}
    		else {
    			SQL="update product set p_name='"+p_name+"', p_pic='"+p_pic+"', p_stock="+p_stock+
    	   				 ", p_category='"+p_category+"', p_sm_category='"+p_sm_category+"', p_price="+p_price+" where p_id="+p_id;
    		}
   		 	pstmt=conn.prepareStatement(SQL);
   			return pstmt.executeUpdate();
	   	}catch(Exception e) {
	   		e.printStackTrace();
	   	}
    	return -1;
    }
    public int add(int p_id, String p_name, int p_price, String p_pic, int p_stock, String p_info, String p_category, String p_sm_category, int shared) {
    	String SQL="insert into product values(?,?,?,?,?,?,?,?,?)";
    	try {
    		 pstmt=conn.prepareStatement(SQL);
    		 pstmt.setInt(1, p_id);
             pstmt.setString(2, p_name);
             pstmt.setInt(3, p_price);
             pstmt.setString(4, p_pic);
             pstmt.setString(5, p_info);
             pstmt.setInt(6, p_stock);
             pstmt.setString(7, p_category);
             pstmt.setString(8, p_sm_category);
             pstmt.setInt(9, shared);
   			return pstmt.executeUpdate();
	   	}catch(Exception e) {
	   		e.printStackTrace();
	   	}
    	return -1;
    }
}



