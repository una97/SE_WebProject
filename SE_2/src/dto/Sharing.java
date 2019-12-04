package dto;


public class Sharing {
	private int s_p_id;
	private String s_p_name;
	private String s_p_img; 
	private int s_p_price;
	private int discount;
	
	
	
	public Sharing(int s_p_id, String s_p_name, String s_p_img, int s_p_price, int discount) {
		super();
		this.s_p_id = s_p_id;
		this.s_p_name = s_p_name;
		this.s_p_img = s_p_img;
		this.s_p_price = s_p_price;
		this.discount = discount;
	}
	
	public String getS_p_img() {
		return s_p_img;
	}

	public void setS_p_img(String s_p_img) {
		this.s_p_img = s_p_img;
	}

	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getS_p_id() {
		return s_p_id;
	}
	public void setS_p_id(int s_p_id) {
		this.s_p_id = s_p_id;
	}
	public String getS_p_name() {
		return s_p_name;
	}
	public void setS_p_name(String s_p_name) {
		this.s_p_name = s_p_name;
	}
	public int getS_p_price() {
		return s_p_price;
	}
	public void setS_p_price(int s_p_price) {
		this.s_p_price = s_p_price;
	}
	
}