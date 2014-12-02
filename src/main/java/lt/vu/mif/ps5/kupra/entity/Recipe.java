package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import java.util.HashSet;
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

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "rec_prod", joinColumns = { @JoinColumn(name = "productId") }, inverseJoinColumns = { @JoinColumn(name = "recId") })
	private Set<Product> productsOfRecipe = new HashSet<Product>(0);

	@Column(length = 4000, name = "description")
	private String description;
	@Column(name = "visibility")
	private int visibility;

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