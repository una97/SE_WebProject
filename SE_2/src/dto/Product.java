package dto;
import java.util.Date;
import java.util.List;

public class Product {

	private int p_id;
	private String p_name;
	private int p_price;
	private String p_pic;
	private int p_stock;
	private String p_info;
	private String p_category;
    
    public Product(Integer idx, String name, Integer price, String picture, String info, Integer stock, String category)
    {
        this.p_id=idx;
        this.p_name=name;
        this.p_price=price;
        this.p_pic=picture;
        this.p_info=info;
        this.p_stock = stock;
        this.p_category=category;
        
    }
    public int getP_id() {
		return p_id;
	}

	public void setP_id(int id) {
		this.p_id = id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_pic() {
		return p_pic;
	}

	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

}