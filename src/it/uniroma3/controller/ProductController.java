package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;

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
	private Product product;
	private List<Product> products;
	private Map<Product,String> productSelected;
	private List<String> selectedProducts;
	@EJB(beanName = "pFacade")
	private ProductFacade productFacade;
	private String testString;

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
		this.productSelected = new HashMap<Product,String>();
		for (int i = 0;i< products.size();i++ ){
			productSelected.put(products.get(i), "");
			
		}
		return "productSelection";
	}

	public String listProducts() {
		this.products = productFacade.getAllProducts();
		return "products";
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

	public List<String> getSelectedProducts() {
		return selectedProducts;
	}

	public void setSelectedProducts(List<String> selectedProducts) {
		this.selectedProducts = selectedProducts;
	}

	public Map<Product, String> getProductSelected() {
		return productSelected;
	}

	public void setProductSelected(Map<Product, String> productSelected) {
		this.productSelected = productSelected;
	}

	public String getTestString() {
		return testString;
	}

	public void setTestString(String testString) {
		this.testString = testString;
	}

}
