package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table (name= "meals")
public class Meal {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long mealId;
	
	@ManyToOne
	@JoinColumn(name="recId")
	private Recipe recipe;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;

	@Column(length = 1, name= "made")
	private boolean made;

	@Column(length = 1, name= "rated")
	private boolean rated;
	
	public boolean isMade() {
		return made;
	}

	public void setMade(boolean made) {
		this.made = made;
	}

	public boolean isRated() {
		return rated;
	}

	public void setRated(boolean rated) {
		this.rated = rated;
	}

	public long getMealId() {
		return mealId;
	}

	public void setMealId(long mealId) {
		this.mealId = mealId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
