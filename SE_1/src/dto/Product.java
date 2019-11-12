package dto;
import java.util.Date;
import java.util.List;

public class Product {

    private Integer idx;
    private String name;
    private Integer price;
    private String info;
    
    public Product(Integer idx, String name, Integer price, String picture, String info)
    {
        this.idx=idx;
        this.name=name;
        this.price=price;
        this.imagepath=picture;
        this.info=info;
        
    }
    
    public Integer getProductidx() { 
        return idx; 
    }
    
    public void setProductidx(Integer idx) { 
        this.idx = idx; 
    }
    
    public String getName() { 
        return name; 
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    public Integer getPrice() { return price; }
    
    public void setPrice(Integer Price) { this.price = Price; }
    
    private String imagepath;
    /*
    private List<ImagePath> imagePaths;

    public List<ImagePath> getImagePaths() {
        return imagePaths;
    }

    public void setImagePaths(List<ImagePath> imagePaths) {
        this.imagePaths = imagePaths;
    }
*/
    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath == null ? null : imagepath.trim();
    }
    
    private Integer sellerid;
    private String sellername;

    public String getInfo() {
        return info;
    }

    public void setInfo(String Info) {
        //this.info = Info == null ? null : Info.trim();
    	this.info = Info;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public String getSellername() {
        return sellername;
    }

    public void setSellername(String sellername) {
        this.sellername = sellername == null ? null : sellername.trim();
    }
}