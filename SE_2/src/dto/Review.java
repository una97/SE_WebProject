package dto;
import java.util.Date;
import java.util.List;

public class Review {

	private int r_id;
	private int o_id;
	private String r_date;
	private int r_star;
	private String r_content;
	private String r_reply;
	private int r_like;
	private int r_hate;
    
    public Review(int o_id, String r_date, int r_star, String r_content, String r_reply, int r_like, int r_hate)
    {
    	this.o_id = o_id;
    	this.r_date = r_date;
    	this.r_star = r_star;
    	this.r_content = r_content;
    	this.r_reply = r_reply;
    	this.r_like = r_like;
    	this.r_hate = r_hate;
    }

    public int getO_id() {
		return o_id;
	}

	public void setO_id(int id) {
		this.o_id = id;
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

	public String getR_reply() {
		return r_reply;
	}

	public void setR_reply(String r_reply) {
		this.r_reply = r_reply;
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
		this.r_id = r_hate;
	}

}