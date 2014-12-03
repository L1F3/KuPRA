package lt.vu.mif.ps5.kupra.form;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UnitForm {
	
	@NotEmpty
	@Size(min = 3, max = 16)
	private String name;
	
	@NotEmpty
	@Size(max = 16)
	private String abbreviation;

	public String getName() {
		return name;
	}
	
	public String getAbbreviation() {
		return abbreviation;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}
}