package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "user_products")
public class UserProduct {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userProductId;
	
	@Column(name="productId")
	private long productId;
	
	@Column(length = 15, name= "userId")
	private long userId;

	@Column(name="unitId")
    private long unitId;
    
    @Column(length = 30, name= "quantity")
    private long quantity;

    public long getProductId() {
		return productId;
	}

	public long getUnitId() {
		return unitId;
	}

	public void setUnitId(long unitId) {
		this.unitId = unitId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}
	
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

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}
    
}
