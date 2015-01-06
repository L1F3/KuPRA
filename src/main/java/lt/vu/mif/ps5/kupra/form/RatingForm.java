package lt.vu.mif.ps5.kupra.form;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class RatingForm {
	private long recipeId;
	private int ratingValue;
	
	public long getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(long recipeId) {
		this.recipeId = recipeId;
	}
	public int getRatingValue() {
		return ratingValue;
	}
	public void setRatingValue(int ratingValue) {
		this.ratingValue = ratingValue;
	}
	
}
