package lt.vu.mif.ps5.kupra.form;

import java.sql.Blob;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import lt.vu.mif.ps5.kupra.entity.Role;

public class UserForm {
	
	@NotEmpty
	@Size(min = 3, max = 30)
    private String loginname;
	
	@NotEmpty
	@Size(min = 3, max = 30)
    private String username;
    
	@NotEmpty
	@Size(min = 3, max = 30)
    private String password;
    
	@NotEmpty
	@Size(min = 3, max = 30)
    private String email;
    
	@Size(min = 3, max = 30)
    private String name;
    
	@Size(min = 3, max = 30)
    private String lastname;
    
	@Size(max = 64)
    private String address;
    
	@Size(max = 256)
    private String description;
    
    private String imgName;
    
    private Blob img;
    
    private String imgType;

    private Role role;

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
	
}
