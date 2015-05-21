package it.uniroma3.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue(value = "C")
public class Customer extends User {

	
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Address address;
	

	
	public Customer(String firstname, String lastname, String email, String phonenumber,String password,Date registrationDate,Date birthDate) {
		super(firstname, lastname, email, phonenumber, password,registrationDate,birthDate);
	}

	public Customer() {
		super();
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	
}
