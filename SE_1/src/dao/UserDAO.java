package dao;
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
    public String findName(String userEmail) {
    	String SQL = "select u_id from user where u_email = ?"; 
    	String name="";
    	   try {
    	      pstmt = conn.prepareStatement(SQL);
    	      pstmt.setString(1, userEmail);
    	      rs= pstmt.executeQuery();
    	      while(rs.next())
    	    	  name=rs.getString("u_id");
    	      return name;
    	   }catch(Exception e) {
    	      e.printStackTrace();
    	   }
    	   return name;
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
       String SQL = "insert into user values(?,?,?,?,?,?)";
       try {
          pstmt=conn.prepareStatement(SQL);
          pstmt.setString(1, user.getU_id());
          pstmt.setString(2, user.getU_pw());
          pstmt.setString(3, user.getU_name());
          pstmt.setString(4, user.getU_address());
          pstmt.setString(5, user.getU_tel());
          pstmt.setString(6, user.getU_email());
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
    				 "', u_address='"+u_address+"', u_tel='"+u_tel+"' where u_id=\""+u_id+"\"";
    		 pstmt=conn.prepareStatement(SQL);
    			pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    }
    
    //회원탈퇴
    public void out(String u_id ,String u_pw) {
    		try {
    			 String SQL="delete from user where u_id=\""+u_id+"\"";
    			 pstmt=conn.prepareStatement(SQL);
    			 pstmt.executeUpdate();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    } 

}
