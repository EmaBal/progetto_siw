package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;
import it.uniroma3.model.Provider;

import java.util.List;

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
	private Product product;
	private List<Product> products;
	
	@EJB(beanName="pFacade")
	private ProductFacade productFacade;
	
	@PostConstruct
	public void init() {
		listProducts();
	}
	
	public String selezionaProdottoDaMostrare(Product product) {
		this.product = product;
		return "product";
	}
	
	
	
	public String createProduct() {
		this.product = productFacade.createProduct(name, code, price, description);
		return "product"; 
	}
	
	public String selectProducts() {
		this.products = productFacade.getAllProducts();
		return "productSelection";
	}
	
	public String listProducts() {
		this.products = productFacade.getAllProducts();
		return "products"; 
	}
	public void listProviderProducts(Provider provider) {
		this.products = productFacade.getAllProviderProducts(provider); 		
	}


	public String getName() {
		return name;
	}

	public void setNaproductFacademe(String name) {
		this.name = name;
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

	
	
	
}


