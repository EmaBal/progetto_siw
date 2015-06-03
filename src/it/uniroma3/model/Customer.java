package it.uniroma3.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue(value = "C")
public class Customer extends User {

	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@OneToOne(fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Address address;
	
	@OneToMany (fetch=FetchType.EAGER, cascade={CascadeType.ALL})
	@JoinColumn(name="users_id")
	private List<Order> orders;
	
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
