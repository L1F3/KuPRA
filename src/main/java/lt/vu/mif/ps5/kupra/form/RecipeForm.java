package lt.vu.mif.ps5.kupra.form;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

import lt.vu.mif.ps5.kupra.entity.Product;

public class RecipeForm {

	@NotEmpty
	@Size(min = 3, max = 30)
	private String name;

	private String imgName;

	private Blob img;

	private String imgType;

	private Set<Product> productsOfRecipe = new HashSet<Product>(0);

	@NotEmpty
	@Size(max = 4000)
	private String description;

	private int visibility;

	//<<GET / SET>>
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Set<Product> getProductsOfRecipe() {
		return productsOfRecipe;
	}

	public void setProductsOfRecipe(Set<Product> productsOfRecipe) {
		this.productsOfRecipe = productsOfRecipe;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getVisibility() {
		return visibility;
	}

	public void setVisibility(int visibility) {
		this.visibility = visibility;
	}
}