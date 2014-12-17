package lt.vu.mif.ps5.kupra.entity;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userId;

	@Column(length = 30, name = "loginname")
	private String loginname;

	@Column(length = 30, name = "username")
	private String username;

	@Column(length = 30, name = "password")
	private String password;

	@Column(length = 30, name = "email")
	private String email;

	@Column(length = 30, name = "name")
	private String name;

	@Column(length = 30, name = "lastname")
	private String lastname;

	@Column(length = 64, name = "address")
	private String address;

	@Column(length = 256, name = "description")
	private String description;

	@Column(name = "imgName")
	private String imgName;

	@Column(name = "img")
	@Lob
	private Blob img;

	@Column(name = "imgType")
	private String imgType;

	@Column(length = 30, name = "role")
	@Enumerated(EnumType.STRING)
	private Role role;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@Fetch (FetchMode.SELECT)
    @JoinTable(name = "user_meals",
            joinColumns = {
                @JoinColumn(name = "userId")},
            inverseJoinColumns = {
                @JoinColumn(name = "recId")})
    private Set<Recipe> meals = new HashSet<Recipe>(0);

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="user")
	@Fetch (FetchMode.SELECT)
	private Set<Recipe> recipies = new HashSet<Recipe>();

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="user")
	@Fetch (FetchMode.SELECT)
	private Set<Fridge> fridgeItems = new HashSet<Fridge>();

	public Set<Fridge> getFridgeItems() {
		return fridgeItems;
	}

	public void setFridgeItems(Set<Fridge> fridgeItems) {
		this.fridgeItems = fridgeItems;
	}

	public long getUserId() {
		return userId;
	}

	public Set<Recipe> getRecipies() {
		return recipies;
	}

	public void setRecipies(Set<Recipe> recipies) {
		this.recipies = recipies;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Recipe> getMeals() {
		return meals;
	}

	public void setMeals(Set<Recipe> meals) {
		this.meals = meals;
	}

}
