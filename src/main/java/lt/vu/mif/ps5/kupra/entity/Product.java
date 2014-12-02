package lt.vu.mif.ps5.kupra.entity;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//import net.metasite.des.entity.Unit;
@Entity
@Table (name= "products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long productId;
	
	@Column(length = 30, name= "product_name")
	private String product_name;
	
	
/*	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "units_of_measurement",
	            joinColumns = {
	                @JoinColumn(name = "productId")},
	            inverseJoinColumns = {
	                @JoinColumn(name = "unitId")})
	private Set<Unit> units = new HashSet<Unit>(0);
*/

	@Column(length = 2000, name="product_despription")
	private String product_despription;
	
	@Column(name = "imgName")
    private String imgName;
	
    @Column(name = "img")
    @Lob
    private Blob img;
    
    @Column(name = "imgType")
    private String imgType;
	
    public void setProductId(long productId) {
        this.productId = productId;
    }

    public long getProductId() {
        return productId;
    }
    
	public String getName() {
	        return product_name;
	    }

	public void setName(String Name) {
	        this.product_name = product_name;
	    }
	 
/*	 public Set<Unit> getUnits(){ 
		 return units;
	 }
	 
	 public void setUnits( Set<Unit> units){
		 this.units = units;
	 }
*/
	 public String getDescription() {
	        return product_despription;
	    }

	   
	 public void setDescription(String description) {
	        this.product_despription = product_despription;
	    }
	 
	 
	 public String getImgName() {
	        return imgName;
	    }

	 public void setImgName(String imgName) {
	        this.imgName = imgName;
	    }

	 public Blob getImg() {
	        return img;
	    }

	 public void setImg(Blob img) {
	        this.img = img;
	    }

	 public String getImgType() {
	        return imgType;
	    }

	 public void setImgType(String imgType) {
	        this.imgType = imgType;
	    }

	 
}
