package poly.com.entity;

import java.io.Serializable;
import java.util.List;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.NumberFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable{
	@Id
	@NotNull
	@Digits(integer = 9, fraction = 0, message = "Username must contain only digits")
	@Pattern(regexp = "^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$", 
    message = "Phone number must be a valid Vietnamese phone number")
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private Boolean admin;
	@OneToMany(mappedBy = "account")
	private List<Order> orders;
}
