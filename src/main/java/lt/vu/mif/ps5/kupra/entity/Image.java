package lt.vu.mif.ps5.kupra.entity;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name= "recipesimages")
public class Image {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long imgId;
	
	@ManyToOne
	@JoinColumn(name="recId")
	private Recipe recipe;

	@Column(name = "imgName")
	private String imgName;
	
	@Column(name = "img")
	@Lob
	private Blob img;
	
	@Column(name = "imgType")
	private String imgType;

	public long getImgId() {
		return imgId;
	}

	public void setImgId(long imgId) {
		this.imgId = imgId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
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