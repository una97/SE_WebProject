package dao;
import dto.Sharing;
import dto.User;
import java.sql.*;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

    public UserDAO() {
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
    public String findName(String u_id) {
    	String SQL = "select u_name from user where u_id = ?"; 
    	String name="";
    	   try {
    	      pstmt = conn.prepareStatement(SQL);
    	      pstmt.setString(1, u_id);
    	      rs= pstmt.executeQuery();
    	      while(rs.next())
    	    	  name=rs.getString("u_name");
    	      return name;
    	   }catch(Exception e) {
    	      e.printStackTrace();
    	   }
    	   return name;
    }
    public int findAuth(String u_id) {
    	String SQL = "select u_auth from user where u_id = ?"; 
    	int auth=0;
    	   try {
    	      pstmt = conn.prepareStatement(SQL);
    	      pstmt.setString(1, u_id);
    	      rs= pstmt.executeQuery();
    	      while(rs.next())
    	    	  auth=rs.getInt("u_auth");
    	      return auth;
    	   }catch(Exception e) {
    	      e.printStackTrace();
    	   }
    	   return auth;
    }
    public int login(String u_id, String u_pw) { //로그인
       String SQL = "select u_pw from user where u_id = ?"; 
       try {
          pstmt = conn.prepareStatement(SQL);
          pstmt.setString(1, u_id);
          rs= pstmt.executeQuery();
          
          if(rs.next()) {
             if(rs.getString(1).equals(u_pw)) {
                return 1; //로그인 성공
             }
             else
                return 0; //비밀번호 불일치
          }
          return -1; //아이디 없음
       }catch(Exception e) {
          e.printStackTrace();
       }
       return -2; //데이터 베이스 오류
    }

    public int join(User user) {//회원가입
       String SQL = "insert into user values(?,?,?,?,?,?,?)";
       try {
          pstmt=conn.prepareStatement(SQL);
          pstmt.setString(1, user.getU_id());
          pstmt.setString(2, user.getU_pw());
          pstmt.setString(3, user.getU_name());
          pstmt.setString(4, user.getU_address());
          pstmt.setString(5, user.getU_tel());
          pstmt.setString(6, user.getU_email());
          pstmt.setInt(7, user.getU_auth());
          return pstmt.executeUpdate();
       }catch(Exception e) {
          e.printStackTrace();
       }
       return -1;
    }
    
    //회원정보 수정
    public void modifyInfo (String u_id, String u_email, String u_pw, String u_address, String u_tel)
    {
    	try {		
    		 String SQL="update user set u_email='"+u_email+"', u_pw='"+u_pw+
    				 "', u_address='"+u_address+"', u_tel='"+u_tel+"' where u_id='"+u_id+"'";
    		 	pstmt=conn.prepareStatement(SQL);
    			pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    //회원탈퇴
    public int out(String u_id ,String u_pw) {
    	 String SQL = "select u_pw from user where u_id = ?"; 
         try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, u_id);
            rs= pstmt.executeQuery();
            
            if(rs.next()) {
               if(rs.getString(1).equals(u_pw)) {
            	 SQL="delete from user where u_id=\""+u_id+"\"";
      			 pstmt=conn.prepareStatement(SQL);
      			 pstmt.executeUpdate();
                  return 1; //탈퇴 성공
               }
               else
                  return 0; //비밀번호 불일치
            }
            return -1; //아이디 없음
         }catch(Exception e) {
            e.printStackTrace();
         }
         return -2; //데이터 베이스 오류
    } 



public Sharing getSharing(int p_id) {
   String sql = "select p.p_name,p.p_pic, s.s_p_price  from shar_product s , product p where s_p_id=?";
   Sharing shto=null;
   try {
       pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, p_id);
           rs= pstmt.executeQuery();
            while(rs.next()) {
               int s_p_id= p_id;
               String s_p_name = rs.getString(1);
               String s_p_img= rs.getString(2);
               int s_p_price = rs.getInt(3);
               int discount = (s_p_id +1)*10;
                shto = new Sharing(s_p_id, s_p_name, s_p_img, s_p_price, discount);
               
            }
         }   
            catch(Exception e){
                e.printStackTrace();
            }
            return shto;
         } 

}
