package it.uniroma3.controller;

import it.uniroma3.model.Product;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class ConsultaListinoController {
	
//	@EJB
//	private ProductFacade productFacade;
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	private ProductController productController;
	@ManagedProperty(value="#{param.product}")
	private Product product;

	public String mostraListinoProdotti() {
		return productController.listProducts();
	}
	
//	public String selezionaProdottoDaMostrare() {
//		this.product = productController.getProductFacade().getProduct(id);
//		
//		return "product";
//	}
//	public String selezionaProdottoDaMostrare(Long id) {
//		this.product = productController.getProductFacade().getProduct(id);
//		return "product";
//	}
	public String selezionaProdottoDaMostrare(Product product) {
		this.product = product;
		return "product";
	}

//
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductController getProductController() {
		return productController;
	}

	public void setProductController(ProductController productController) {
		this.productController = productController;
	}
}
