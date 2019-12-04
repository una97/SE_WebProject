package dto;
import java.util.*;
import java.util.ArrayList;

public class Question {
	private int q_id;
	private int p_id;
	private String u_id;
	private String title;
	private String content;
	private ArrayList<Reply> reples;
    
    public Question(int q_id, int p_id, String u_id, String title, String content, String reply)
    {
    	
    	this.q_id = q_id;
    	this.p_id = p_id;
    	this.u_id = u_id;
    	this.title = title;
    	this.content = content;
    	this.reples = (reply==null)? null: setReples(reply);
    }
    public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int id) {
		this.q_id = id;
	}
    public int getP_id() {
		return p_id;
	}
	public void setP_id(int id) {
		this.p_id = id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String id) {
		this.u_id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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