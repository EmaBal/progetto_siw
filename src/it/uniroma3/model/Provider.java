package it.uniroma3.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Provider")
public class Provider {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id; 
	@Column(nullable = false)
	private String name; 
	@Column(nullable = false)
	private String phonenumber; 
	@Column(nullable = false)
	private String email; 
	@Column(nullable = false,length = 100)
	private  String vatin;
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Address address;
	
	@ManyToMany
	private List<Product> products;
	
	
	public Provider(String name, String phoneNumber, String email, String vatin) {
		this.name = name;
		this.phonenumber = phoneNumber;
		this.email = email;
		this.vatin = vatin;
	}
	public Provider() {
		
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVatin() {
		return vatin;
	}
	public void setVatin(String vatin) {
		this.vatin = vatin;
	} 
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
