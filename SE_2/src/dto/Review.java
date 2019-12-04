package dto;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class Review {

	private int o_id;
	private String u_id;
	private String r_date;
	private int r_star;
	private String r_content;
	private ArrayList<Reply> reples;
	private int r_like;
	private int r_hate;
    
    public Review(int o_id, String u_id, String r_date, int r_star, String r_content, String r_reply, int r_like, int r_hate)
    {
    	this.o_id = o_id;
    	this.u_id = u_id;
    	this.r_date = r_date;
    	this.r_star = r_star;
    	this.r_content = r_content;
    	this.reples = (r_reply==null)? null: setReples(r_reply);
    	this.r_like = r_like;
    	this.r_hate = r_hate;
    }

    public int getO_id() {
		return o_id;
	}

	public void setO_id(int id) {
		this.o_id = id;
	}
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String id) {
		this.u_id = id;
	}
	
	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
    public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
	
    public int getR_hate() {
		return r_hate;
	}

	public void setR_hate(int r_hate) {
		this.r_hate = r_hate;
	}

	public ArrayList<Reply> setReples(String reply) {
		String[] rep = (reply==null)? null: reply.split(";");
		try {
			reples = new ArrayList<Reply>();
			for(int i=0;i<rep.length;i++) {
				String[] inp = rep[i].split(",");
				Reply tmp = new Reply(inp[0], inp[1]);
				reples.add(tmp);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return reples;
	}

	public ArrayList<Reply> getReples() {
		return reples;
	}

}