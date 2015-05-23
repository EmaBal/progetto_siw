package it.uniroma3.controller;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedProperty;

public class ProviderController {

	@ManagedProperty(value="#{param.id}")
	private Long id;
	private String name; 
	private String phonenumber; 
	private String email; 
	private  String vatin;
	
	private Provider provider;
//	private List<Provider> providers;
	
	@EJB(beanName="prFacade")
	private ProviderFacade providerFacade;
	
	private AddressController addressController;

	public String openNewProviderPage() {
		return "newProvider";
	}
	public String createProvider(){
		provider = providerFacade.createProvider(name, phonenumber, email, vatin);
		return "provider";
	}
	
	public String addAddress() {
		this.addressController.createAddress();
		if(provider.getAddress()!=null){
			addressController.deleteProviderAddress(provider);
		}
		providerFacade.setProviderAddress(provider ,addressController.getAddress());
		return "provider";
	}
	public String openNewProviderAddressPage(){
		return addressController.openNewProviderAddressPage();
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	public AddressController getAddressController() {
		return addressController;
	}
	public void setAddressController(AddressController addressController) {
		this.addressController = addressController;
	}
	
	
	
}
