package dao;
import dto.Product;
import java.util.*;
import java.sql.Statement;
import java.sql.*;

public class ProductDAO {
	private Connection conn;
    private String url = "jdbc:mysql://localhost:3306/docamp?serverTimezone=UTC&useSSL=false";

	public ProductDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
        
    public ArrayList<Product> productSelect(){
        ResultSet rs=null;
        Statement stmt = null;

        ArrayList<Product> pdtos = new ArrayList<Product>();
        try{
            conn = DriverManager.getConnection(url, "root", "1234");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from product");
            while(rs.next()){
                Integer idx = rs.getInt("idx");
                String name = rs.getString("name");
                Integer price = rs.getInt("price");
                String picture = rs.getString("picture");
                String info = rs.getString("info");

                Product pdto = new Product(idx, name, price, picture, info);
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
}