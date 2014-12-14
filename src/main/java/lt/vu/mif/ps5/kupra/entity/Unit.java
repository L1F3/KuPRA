package lt.vu.mif.ps5.kupra.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "units")
public class Unit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long unitId;
	
	@Column(length = 16, name = "name")
	private String name;
	
	@Column(length = 16, name = "abbreviation")
	private String abbreviation;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="unit")
	private Set<Ingredient> ingredients = new HashSet<Ingredient>();       

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="unit")
	private Set<Fridge> fridgeItems = new HashSet<Fridge>();       

	public Set<Fridge> getFridgeItems() {
		return fridgeItems;
	}

	public void setFridgeItems(Set<Fridge> fridgeItems) {
		this.fridgeItems = fridgeItems;
	}

	public Set<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(Set<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public long getUnitId() {
		return unitId;
	}
	
	public String getName() {
		return name;
	}
	
	public String getAbbreviation() {
		return abbreviation;
	}
	
	public void setUnitId(long unitId) {
		this.unitId = unitId;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}
}