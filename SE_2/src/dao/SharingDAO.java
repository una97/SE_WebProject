package dao;

import dto.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SharingDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public SharingDAO() {
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

	public int checkDuplication( int p_id, String s_start, String s_end) {
		
		String sql = "select s_r_start, s_r_end from shar_reservation where s_r_p_id=? ";
		try {
		    pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, p_id);
	        rs= pstmt.executeQuery();
	        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd" );
	        Date myStart,myEnd,dbStart,dbEnd ;
            int s_s,e_s,s_e,e_e;
	        String start, end;
	        
	        myStart=format.parse(s_start);
	        myEnd=format.parse(s_end);
	
	        
	        if(rs.next()) {
	        	start= rs.getString(1);
	        	end = rs.getString(2);
	            dbStart = format.parse(start);
	            dbEnd = format.parse(end);
	         
	            s_s = myStart.compareTo(dbStart);
	            e_s = myEnd.compareTo(dbStart);
	            s_e = myStart.compareTo(dbEnd);
	            e_e = myEnd.compareTo(dbEnd);
	            
	        	if((s_s<=0 && e_s>0)||(s_e<0 && e_e>=0)) {
	        		
	        		return 0; //겹치는 날짜가 있어서 안돼 
	        	}
	        	else
	        		return 1; //겹치지 않아서 성공 
	        }
	        return -1; //아무도 이 상품을 신청하지 않음 
	        
		}catch(Exception e) {
	          e.printStackTrace();
	       }
		
	return -2; //database오류 
		
	}

}