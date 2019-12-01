package dto;
import java.util.*;

public class Order{
	
	private int o_id;
	private String u_id;
	private int p_id;
	private String date;
	private String u_name;
	private String u_address;
	private String total_price;
	private String o_status;
	
	public Order(int o_id, String u_id, int p_id, String date, String u_name, String u_address, String total_price,
			String o_status) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.p_id = p_id;
		this.date = date;
		this.u_name = u_name;
		this.u_address = u_address;
		this.total_price = total_price;
		this.o_status = o_status;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	
	
}