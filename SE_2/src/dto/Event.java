package dto;
import java.io.*;

public class Event {
	private int e_id;
	private String e_name;
	private String e_pic;
	private String e_info;
	private String e_sdate;
	private String e_edate;
	
	public Event(Integer idx, String name, String picture, String info, String sdate, String edate)
    {
        this.e_id=idx;
        this.e_name=name;
        this.e_pic=picture;
        this.e_info=info;
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
