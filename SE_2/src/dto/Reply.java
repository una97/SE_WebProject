package dto;

public class Reply {
	private String u_id;
	private String r_reply;
	public Reply(String u_id, String r_reply) {
		this.u_id=u_id;
		this.r_reply=r_reply;
	}
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getR_reply() {
		return r_reply;
	}
	public void setR_reply(String r_reply) {
		this.r_reply=r_reply;
	}
}
