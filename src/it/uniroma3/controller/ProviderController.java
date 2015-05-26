package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private Map<Provider,Boolean> selectedProviders;

	@EJB(beanName = "prFacade")
	private ProviderFacade providerFacade;

	private AddressController addressController;

	public String openNewProviderPage() {
		return "newProvider";
	}
	public void saveProviderProducts() {
		providerFacade.updateProvider(provider);
	}

	public String createProvider() {
		provider = providerFacade.createProvider(name, phonenumber, email, vatin);
		return "provider";
	}

	public String selectProvider(Provider provider) {
		this.provider = provider;
		return "provider";
	}
	public void selectProviders() {
		loadAllProviders();
		this.selectedProviders = new HashMap<Provider, Boolean>();
		for (int i = 0; i < providers.size(); i++) {
			selectedProviders.put(providers.get(i), false);
		}
	}
	public String listProviders() {
		loadAllProviders();
		return "providers";
	}
	public void loadAllProviders() {
		this.providers = providerFacade.getAllProviders();
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

	
	public Map<Provider, Boolean> getSelectedProviders() {
		return selectedProviders;
	}
	public void setSelectedProviders(Map<Provider, Boolean> selectedProviders) {
		this.selectedProviders = selectedProviders;
	}
	public void saveSelectedProductProviders(Product product) {
		List<Provider> productProviders = product.getProviders();
		for (int i = 0; i < providers.size(); i++) {
			if (selectedProviders.get(providers.get(i)).booleanValue()) {
				if (productProviders == null || productProviders.equals(null) || !productProviders.contains(providers.get(i))) {
					if (productProviders == null || productProviders.equals(null)) {
						productProviders = new ArrayList<Provider>();
					}
					addProductToProvider(providers.get(i),product);
				}
//			} else {
//				if (productProviders != null && !productProviders.equals(null) && productProviders.contains(providers.get(i))) {
//					productProviders.remove(providers.get(i));
//					providerFacade.updateProvider(providers.get(i));
//				}
			}
		}
		product.setProviders(productProviders);
		
	}
	public void addProductToProvider(Provider provider,Product product){
		List<Product> providerProducts = provider.getProducts();
		if(providerProducts== null || providerProducts.equals(null) || providerProducts.isEmpty()){
			providerProducts =  new ArrayList<Product>();
			
		}
		providerProducts.add(product);
		provider.setProducts(providerProducts);
		providerFacade.updateProvider(provider);
	}
	
	


}
