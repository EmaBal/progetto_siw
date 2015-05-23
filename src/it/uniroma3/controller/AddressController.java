package it.uniroma3.controller;

import it.uniroma3.model.Address;
import it.uniroma3.model.AddressFacade;
import it.uniroma3.model.Customer;
import it.uniroma3.model.Provider;

import javax.ejb.EJB;

public class AddressController {

	private Long id;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private Address address;
	
	@EJB(beanName="aFacade")
	private AddressFacade addressFacade;
	
	public String createAddress(){
		this.address = addressFacade.createAddress(street, city, state, zipcode, country);
		
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

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String openNewUserAddressPage() {
		return "newUserAddress";
	}
	public String openNewProviderAddressPage() {
		return "newProviderAddress";
	}

	public void deleteCustomerAddress(Customer user) {
		addressFacade.deleteAddress(user.getAddress().getId());	
	}
	public void deleteProviderAddress(Provider provider) {
		addressFacade.deleteAddress(provider.getAddress().getId());
		
	}
	
	
}
