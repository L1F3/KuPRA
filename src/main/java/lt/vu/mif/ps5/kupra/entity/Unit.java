package lt.vu.mif.ps5.kupra.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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