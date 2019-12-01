package dao;
import dto.Product;
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
                Product pdto = new Product(idx, name, price, picture, info, stock, category);
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
    public int upload(Product product) {
    	String SQL = "insert into user values(?,?,?,?,?,?,?)";
        try {
           pstmt=conn.prepareStatement(SQL);
           pstmt.setInt(1, product.getP_id());
           pstmt.setString(2, product.getP_name());
           pstmt.setInt(3, product.getP_price());
           pstmt.setString(4, product.getP_pic());
           pstmt.setInt(5, product.getP_stock());
           pstmt.setString(6, product.getP_info());
           pstmt.setString(7, product.getP_category());
           return pstmt.executeUpdate();
        }catch(Exception e) {
        	e.printStackTrace();
        }
        return -1;
    }
}