package it.uniroma3.controller;

import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class ProviderController {

	private String name;
	private String phonenumber;
	private String email;
	private String vatin;

	private Provider provider;
	private List<Provider> providers;

	@EJB(beanName = "prFacade")
	private ProviderFacade providerFacade;

	private AddressController addressController;
	private ProductController productController;

	public String openNewProviderPage() {
		return "newProvider";
	}
	public String saveProviderProducts() {
		String result = productController.saveSelectedProviderProducts(provider);
		providerFacade.updateProvider(provider);
		return result;
	}
	public String discardProviderProducts(){
		String result = productController.discardSelectedProviderProducts();
		return result;
	}
	public String openProductSelectionPage(){
		return productController.selectProducts(provider);
	}

	public String createProvider() {
		provider = providerFacade.createProvider(name, phonenumber, email, vatin);
		return "provider";
	}

	public String selezionaProviderDaMostrare(Provider provider) {
		this.provider = provider;
		return "provider";
	}

	public String listProviders() {
		this.providers = providerFacade.getAllProviders();
		return "providers";
	}

	public String addAddress() {
		this.addressController.createAddress();
		if (provider.getAddress() != null) {
			addressController.deleteProviderAddress(provider);
		}
		providerFacade.setProviderAddress(provider, addressController.getAddress());
		return "provider";
	}

	public String openNewProviderAddressPage() {
		return addressController.openNewProviderAddressPage();
	}

	public String openNewProviderAddressPage(Provider provider) {
		this.provider = provider;
		return openNewProviderAddressPage();
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

	public List<Provider> getProviders() {
		return providers;
	}

	public void setProviders(List<Provider> providers) {
		this.providers = providers;
	}

	public ProductController getProductController() {
		return productController;
	}

	public void setProductController(ProductController productController) {
		this.productController = productController;
	}


}
