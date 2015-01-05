package lt.vu.mif.ps5.kupra.entity;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table (name= "products")
@JsonIgnoreProperties({"ingredients", "fridgeItems", "unitsSet", "description", "imgName", "img", "imgType"})
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long productId;
	
	@Column(length = 30, name= "name")
	private String name;

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="product")
	@Fetch (FetchMode.SELECT)
	private Set<Ingredient> ingredients = new HashSet<Ingredient>();                        


	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="product")
	@Fetch (FetchMode.SELECT)
	private Set<Fridge> fridgeItems = new HashSet<Fridge>();                        
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@Fetch (FetchMode.SELECT)
    @JoinTable(name = "unit_product",
            joinColumns = {
                @JoinColumn(name = "productId")},
            inverseJoinColumns = {
                @JoinColumn(name = "unitId")})
	private Set<Unit> unitsSet = new HashSet<Unit>();
	//private Unit unit;
	
	@Column(length = 2000, name="description")
	private String description;
	
	@Column(name = "imgName")
    private String imgName;
	
    @Column(name = "img")
    @Lob
    private Blob img;
    
    @Column(name = "imgType")
    private String imgType;

	/*@ManyToOne
	@JoinColumn(name="recipeId")
	private Recipe recipe;*/

	
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(Set<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public Set<Fridge> getFridgeItems() {
		return fridgeItems;
	}

	public void setFridgeItems(Set<Fridge> fridgeItems) {
		this.fridgeItems = fridgeItems;
	}

	public Set<Unit> getUnitsSet() {
		return unitsSet;
	}

	public void setUnitsSet(Set<Unit> unitsSet) {
		this.unitsSet = unitsSet;
	}

	public Unit getUnit() {
		return getUnitsSet().iterator().next();
	}

	//public void setUnit(Unit unit) {
	//	this.unit = unit;
	//}


	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public void setProductId(long productId) {
        this.productId = productId;
    }

	public long getProductId() {
        return productId;
    }
   
	 /*public Set<Unit> getUnits(){ 
		 return unitsSet;
	 }
	 
	 public void setUnits( Set<Unit> unitsSet){
		 this.unitsSet = unitsSet;
	 }*/
	 
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
