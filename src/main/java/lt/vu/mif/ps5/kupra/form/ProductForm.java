package lt.vu.mif.ps5.kupra.form;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;
import lt.vu.mif.ps5.kupra.entity.Unit;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

public class ProductForm {
	
	@NotEmpty
	@Size(min = 3, max = 30)
	private String productName;
	
	private Set<Unit> unitsSet = new HashSet<Unit>();
	
	@Size(max = 2000)
	private String product_description;
	
    private String imgName;
	
    private Blob img;
    
    private String imgType;
    
	public String getProductName() {
		return productName;
	}

	public void setProductName(String product_name) {
		this.productName = product_name;
	}
	 
	public Set<Unit> getUnits(){ 
		return unitsSet;
	}
	 
	public void setUnits(Set<Unit> unitsSet){
		this.unitsSet = unitsSet;
	}

	public String getDescription() {
		return product_description;
	}
  
	public void setDescription(String product_description) {
		this.product_description = product_description;
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
