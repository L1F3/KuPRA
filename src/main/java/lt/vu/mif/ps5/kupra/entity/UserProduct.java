package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Table;

@Entity
@Table(name = "user_products")
public class UserProduct {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userId;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "productId")
	private Product product;
	
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "unitId")
    private Unit unit;
    
    @Column(length = 30, name= "quantity")
    private long quantity;

    @Column(length = 30, name= "userProductId")
    private long userProductId;
    
    
	public long getUserProductId() {
		return userProductId;
	}

	public void setUserProductId(long userProductId) {
		this.userProductId = userProductId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
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

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
    
}
