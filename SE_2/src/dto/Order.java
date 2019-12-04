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
	private String o_phone;
	private String o_email;
	private String u_detailAddress;
	private String o_pay;
	private String o_divide;
	private String o_mention;
	

	public Order(int o_id, String u_id, int p_id, String date, String u_name, String u_address, String total_price,
			String o_status, String o_phone, String o_email, String u_detailAddress, String o_pay, String o_divide,
			String o_mention) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.p_id = p_id;
		this.date = date;
		this.u_name = u_name;
		this.u_address = u_address;
		this.total_price = total_price;
		this.o_status = o_status;
		this.o_phone = o_phone;
		this.o_email = o_email;
		this.u_detailAddress = u_detailAddress;
		this.o_pay = o_pay;
		this.o_divide = o_divide;
		this.o_mention = o_mention;
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

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	public String getO_email() {
		return o_email;
	}

	public void setO_email(String o_email) {
		this.o_email = o_email;
	}

	public String getU_detailAddress() {
		return u_detailAddress;
	}

	public void setU_detailAddress(String u_detailAddress) {
		this.u_detailAddress = u_detailAddress;
	}

	public String getO_pay() {
		return o_pay;
	}

	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}

	public String getO_divide() {
		return o_divide;
	}

	public void setO_divide(String o_divide) {
		this.o_divide = o_divide;
	}

	public String getO_mention() {
		return o_mention;
	}

	public void setO_mention(String o_mention) {
		this.o_mention = o_mention;
	}
	
	
}