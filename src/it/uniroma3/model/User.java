package it.uniroma3.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="USER_TYPE")
public abstract class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String firstname;

	@Column(nullable = false)
	private String lastname;

	@Column(nullable = false,unique=true)
	private String email;

	@Column(nullable = false)
	private String phonenumber;
	
	@Column(nullable = false)
	private Date registrationDate;
	
	@Column(nullable = false)
	private Date birthDate;
	
	@Column(nullable = false)
	private String password;

	public User() {
	}

	public User(String firstname, String lastname, String email, String phonenumber,String password,Date registrationDate,Date birthDate) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.password = password;
		this.registrationDate = registrationDate;
		this.birthDate = birthDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

}
