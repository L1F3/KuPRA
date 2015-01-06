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
	
	private Unit unit;
	
	private long unitId;
	
	public long getUnitId() {
		return unitId;
	}

	public void setUnitId(long unitId) {
		this.unitId = unitId;
	}

	@Size(max = 2000)
	private String description;
	
    private String imgName;
	
    private Blob img;
    
    private String imgType;
    
	public String getProductName() {
		return productName;
	}

	public void setProductName(String product_name) {
		this.productName = product_name;
	}
	 
	public Unit getUnit(){ 
		return unit;
	}
	 
	public void setUnit(Unit unit){
		this.unit = unit;
	}

	public String getDescription() {
		return description;
	}
  
	public void setDescription(String product_description) {
		this.description = product_description;
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
