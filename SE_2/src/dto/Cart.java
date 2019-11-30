package dto;
import java.util.*;

public class Cart{
	
	private String c_u_id;
	private int c_p_id;
	private int c_quantity;
	private String c_price;
	
	public Cart(String u_id, int p_id, int quantity, String price) {
		this.c_u_id=u_id;
		this.c_p_id=p_id;
		this.c_quantity=quantity;
		this.c_price=price;
	}

	public String getU_id() {
		return c_u_id;
	}

	public void setU_id(String u_id) {
		this.c_u_id = u_id;
	}

	public int getP_id() {
		return c_p_id;
	}

	public void setP_id(int p_id) {
		this.c_p_id = p_id;
	}

	public int getQuantity() {
		return c_quantity;
	}

	public void setQuantity(int quantity) {
		this.c_quantity = quantity;
	}

	public String getPrice() {
		return c_price;
	}

	public void setPrice(String price) {
		this.c_price = price;
	}
	
	
	
	
	
	
	
}