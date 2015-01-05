package lt.vu.mif.ps5.kupra.form;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class FridgeItemForm {
	
	@NotNull
	private String productId;
	
	@NotNull
	private long unitId;
	
	@Min(1)
	private long amount;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public long getUnitId() {
		return unitId;
	}

	public void setUnitId(long unitId) {
		this.unitId = unitId;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}
	
}
