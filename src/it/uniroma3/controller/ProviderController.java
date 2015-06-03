package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	private List<Product> products;
	
	@EJB(beanName = "prFacade")
	private ProviderFacade providerFacade;

	private AddressController addressController;

	public String openNewProviderPage() {
		return "newProvider";
	}
	public void saveProviderProducts() {
		providerFacade.updateProvider(provider);
		if(provider.getProducts()!=null && !provider.getProducts().equals(null) && !provider.getProducts().isEmpty()){
			products = new ArrayList<Product>(new HashSet<Product>(provider.getProducts()));
		}else{
			products = new ArrayList<Product>();
		}
		
	}

	public String createProvider() {
		provider = providerFacade.createProvider(name, phonenumber, email, vatin);
		products = new ArrayList<Product>();
		return "provider";
	}

	public String selectProvider(Provider provider) {
		this.provider = provider;
		products = new ArrayList<Product>(new HashSet<Product>(provider.getProducts()));
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
		products = new ArrayList<Product>(new HashSet<Product>(provider.getProducts()));
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
	public List<Provider> saveSelectedProductProviders(Product product) {
		List<Provider> productProviders = product.getProviders();
		for (int i = 0; i < providers.size(); i++) {
			if (selectedProviders.get(providers.get(i)).booleanValue()) {
				if (productProviders == null || productProviders.equals(null) || !productProviders.contains(providers.get(i))) {
					if (productProviders == null || productProviders.equals(null)) {
						productProviders = new ArrayList<Provider>();
					}
					productProviders.add(providers.get(i));
					addProductToProvider(providers.get(i),product);
				}
			} else {
				if (productProviders != null && !productProviders.equals(null) && productProviders.contains(providers.get(i))) {
					productProviders.remove(providers.get(i));
					removeProductToProvider(providers.get(i),product);
				}
			}
			
		}
		return productProviders;
		
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
	public void removeProductToProvider(Provider provider,Product product){
		List<Product> providerProducts = provider.getProducts();
		if(providerProducts!= null && !providerProducts.equals(null) && !providerProducts.isEmpty() && providerProducts.contains(product)){
			providerProducts.remove(product);
			provider.setProducts(providerProducts);
			providerFacade.updateProvider(provider);
		}
	}
	
	public List<Provider> getProductProviders(Product product) {
		loadAllProviders();
		List<Provider> productProviders = new ArrayList<Provider>();
		for(int i = 0 ; i < providers.size() ; i++){
			if(providers.get(i) != null && !providers.get(i).equals(null) && providers.get(i).getProducts() != null && !providers.get(i).getProducts().equals(null) && !providers.get(i).getProducts().isEmpty() && providers.get(i).getProducts().contains(product)){
				productProviders.add(providers.get(i));
			}
		}
		return productProviders;
	}
	
	public void selectProduct(Product product) {
		product.setProviders(getProductProviders(product));
		
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}

	


}
