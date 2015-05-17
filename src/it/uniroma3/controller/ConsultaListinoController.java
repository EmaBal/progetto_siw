package it.uniroma3.controller;

import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class ConsultaListinoController {
	
//	@EJB
//	private ProductFacade productFacade;
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	private ProductController productController;

	public String mostraListinoProdotti() {
		return productController.listProducts();
	}
	
	public String selezionaProdottoDaMostrare() {
		return productController.findProduct();
	}
//	private Product product;
//	@ManagedProperty(value="#{param.id}")
//	private Long id;
//	private List<Product> products;
//	
//	public String listProducts() {
//		this.products = productFacade.getAllProducts();
//		return "products"; 
//	}
//	
//	public String findProduct() {
//		this.product = productFacade.getProduct(id);
//		return "product";
//	}
//	
//	public String findProduct(Long id) {
//		this.product = productFacade.getProduct(id);
//		return "product";
//	}
//
//	public Product getProduct() {
//		return product;
//	}
//
//	public void setProduct(Product product) {
//		this.product = product;
//	}
//
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
//
//	public List<Product> getProducts() {
//		return products;
//	}
//
//	public void setProducts(List<Product> products) {
//		this.products = products;
//	}

	
	public ProductController getProductController() {
		return productController;
	}

	public void setProductController(ProductController productController) {
		this.productController = productController;
	}
}
