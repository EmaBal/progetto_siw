package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;
import it.uniroma3.model.Provider;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class ProductController {

	private String name;
	private Float price;
	private String description;
	private String code;
	private Integer quantity;
	private Product product;
	private List<Product> products;
	private Map<Product, Boolean> selectedProducts;

	@EJB(beanName = "pFacade")
	private ProductFacade productFacade;

	@PostConstruct
	public void init() {
		listProducts();
	}

	public String getProductsFromSearch() {
		this.products = productFacade.getProductFromSearch(getName());
		return "products";
	}

	public String selectProduct(Product product) {
		this.product = product;
		return "product";
	}

	public String createProduct() {
		this.product = productFacade.createProduct(name, code, price, description, quantity);
		return "product";
	}
	public void saveProductProviders(List<Provider> productProviders) {
		product.setProviders(productProviders);
		productFacade.updateProduct(product);
	}
	public String saveSelectedProviderProducts(Provider provider) {
		List<Product> providerProducts = provider.getProducts();
		for (int i = 0; i < products.size(); i++) {
			if (selectedProducts.get(products.get(i)).booleanValue()) {
				if (providerProducts == null || providerProducts.equals(null) || !providerProducts.contains(products.get(i))) {
					if (providerProducts == null || providerProducts.equals(null)) {
						providerProducts = new ArrayList<Product>();
					}
					providerProducts.add(products.get(i));
				}
			} else {
				if (providerProducts != null && !providerProducts.equals(null) && providerProducts.contains(products.get(i))) {
					providerProducts.remove(products.get(i));
				}
			}
		}
		provider.setProducts(providerProducts);
		return "provider";
	}

	public String discardSelectedProviderProducts() {
		selectedProducts = null;
		return "provider";
	}

	public String selectProducts(Provider provider) {
		loadAllProducts();
		this.selectedProducts = new HashMap<Product, Boolean>();
		for (int i = 0; i < products.size(); i++) {
			if (provider.getProducts() != null && !provider.getProducts().equals(null) && provider.getProducts().contains(products.get(i))) {
				selectedProducts.put(products.get(i), true);
			} else {
				selectedProducts.put(products.get(i), false);
			}

		}
		return "productSelection";
	}

	public void selectProducts() {
		loadAllProducts();
		this.selectedProducts = new HashMap<Product, Boolean>();
		for (int i = 0; i < products.size(); i++) {
			selectedProducts.put(products.get(i), false);
		}
	}

	public String listProducts() {
		loadAllProducts();
		return "products";
	}

	public void loadAllProducts() {
		this.products = productFacade.getAllProducts();
	}

	public String getName() {
		return name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;

	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Product getProduct() {
		return product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public ProductFacade getProductFacade() {
		return productFacade;
	}

	public void setProductFacade(ProductFacade productFacade) {
		this.productFacade = productFacade;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String openNewProductPage() {
		return "newProduct";
	}

	public Map<Product, Boolean> getSelectedProducts() {
		return selectedProducts;
	}

	public void setSelectedProducts(Map<Product, Boolean> selectedProducts) {
		this.selectedProducts = selectedProducts;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
