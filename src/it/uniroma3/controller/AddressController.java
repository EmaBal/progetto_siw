package it.uniroma3.controller;

import it.uniroma3.model.Customer;

public class AddressController {

	private Long id;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private Customer customer;
	private Address address;
	
	public String createAddress(){
		this.address = new Address(street,city,state,zipcode,country,customer);
		return "index";
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
