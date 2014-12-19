package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.sql.Blob;

@Entity
@Table(name = "recipies")
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long recId;

	@Column(length = 30, name = "name")
	private String name;
	@Column(name = "imgName")
	private String imgName;
	@Column(name = "img")
	@Lob
	private Blob img;
	@Column(name = "imgType")
	private String imgType;

	/*@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "rec_prod", joinColumns = { @JoinColumn(name = "productId") }, inverseJoinColumns = { @JoinColumn(name = "recId") })
	private Set<Product> productsOfRecipe = new HashSet<Product>(0);
*/
	//@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, mapedBy="recipe")
	//private Set<Product> productsOfRecipe = new HashSet<Product>();p
	/*@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinTable(name = "recipe_product",
            joinColumns = {
                @JoinColumn(name = "recId")},
            inverseJoinColumns = {
                @JoinColumn(name = "productId")})
	private Set<Product> products = new HashSet<Product>();*/
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="recipe")
	@Fetch (FetchMode.SELECT)
	private Set<Ingredient> ingredients = new HashSet<Ingredient>();

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="recipe")
	@Fetch (FetchMode.SELECT)
	private List<RecipeImage> images = new ArrayList<RecipeImage>();
	
	public List<RecipeImage> getImages() {
		return images;
	}

	public void setImages(List<RecipeImage> images) {
		this.images = images;
	}

	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	@Column(length = 4000, name = "description")
	private String description;
	@Column(name = "visibility")
	private int visibility;
	@Column(name = "rating")
	private int rating;
	@Column(name = "ratingCount")
	private int ratingCount;

	/*public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}*/
	public Set<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(Set<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public int getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public long getRecId() {
		return recId;
	}

	public void setRecId(long recId) {
		this.recId = recId;
	}

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

	/*public Set<Product> getProductsOfRecipe() {
		return productsOfRecipe;
	}

	public void setProductsOfRecipe(Set<Product> productsOfRecipe) {
		this.productsOfRecipe = productsOfRecipe;
	}*/

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
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}