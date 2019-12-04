package dto;
import java.io.*;

public class Event {
	private int e_id;
	private String e_name;
	private int e_price;
	private String e_pic;
	private String e_info;
	private int e_stock;
	private String e_sdate;
	private String e_edate;
	
	public Event(Integer idx, String name, Integer price, String picture, String info, Integer stock, String sdate, String edate)
    {
        this.e_id=idx;
        this.e_name=name;
        this.e_price=price;
        this.e_pic=picture;
        this.e_info=info;
        this.e_stock = stock;
        this.e_sdate=sdate;
        this.e_edate = edate;
    }
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public int getE_price() {
		return e_price;
	}
	public void setE_price(int e_price) {
		this.e_price = e_price;
	}
	public String getE_pic() {
		return e_pic;
	}
	public void setE_pic(String e_pic) {
		this.e_pic = e_pic;
	}
	public String getE_info() {
		return e_info;
	}
	public void setE_info(String e_info) {
		this.e_info = e_info;
	}
	public int getE_stock() {
		return e_stock;
	}
	public void setE_stock(int e_stock) {
		this.e_stock = e_stock;
	}
	public String getE_sdate() {
		return e_sdate;
	}
	public void setE_sdate(String e_sdate) {
		this.e_sdate = e_sdate;
	}
	public String getE_edate() {
		return e_edate;
	}
	public void setE_edate(String e_edate) {
		this.e_edate = e_edate;
	}
	
	
}
