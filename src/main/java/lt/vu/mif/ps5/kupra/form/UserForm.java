package lt.vu.mif.ps5.kupra.form;

import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class UserForm {
	@NotEmpty
	@Size(min = 1, max = 16)
	private String name;
	@NotEmpty
	@Size(min = 1, max = 16)
	private String abbreviation;
}