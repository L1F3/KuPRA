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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table (name= "ingredients")
public class Ingredient {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long ingrId;

	@ManyToOne
	@JoinColumn(name="recId")
	private Recipe recipe;

	@ManyToOne
	@JoinColumn(name="productId")
	private Product product;

	@ManyToOne
	@JoinColumn(name="unitId")
	private Unit unit;
	
	@Column(length=10, name="amount")
	private long amount;

	public long getIngrId() {
		return ingrId;
	}

	public void setIngrId(long ingrId) {
		this.ingrId = ingrId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}
	
}