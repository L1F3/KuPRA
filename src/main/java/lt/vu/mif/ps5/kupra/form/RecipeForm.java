package lt.vu.mif.ps5.kupra.form;

import java.sql.Blob;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

import lt.vu.mif.ps5.kupra.entity.Product;

public class RecipeForm {

	@NotEmpty
	@Size(min = 3, max = 30)
	private String name;

	private List<Long> ingredientsId;
	
	private List<Double> quantities;
	
    public List<Long> getIngredientsId() {
		return ingredientsId;
	}

	public void setIngredientsId(List<Long> ingredientsId) {
		this.ingredientsId = ingredientsId;
	}

	public List<Double> getQuantities() {
		return quantities;
	}

	public void setQuantities(List<Double> quantities) {
		this.quantities = quantities;
	}

	private List<MultipartFile> files;
    
    public List<MultipartFile> getFiles() {
        return files;
    }
 
    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }
    
	private Set<Product> productsOfRecipe = new HashSet<Product>(0);

	@NotEmpty
	private String servings;
	
	public String getServings() {
		return servings;
	}

	public void setServings(String servings) {
		this.servings = servings;
	}

	public String getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(String cookingTime) {
		this.cookingTime = cookingTime;
	}

	@NotEmpty
	private String cookingTime;
	
	@NotEmpty
	@Size(max = 4000)
	private String description;

	private int visibility;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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