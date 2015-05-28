package it.uniroma3.controller;

import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class OrderController {
	
	private Long id;
	private Date creationDate;
	private Date confirmationDate;
	private Date evadingDate;
	private Map<Product, Integer> selectedProducts;
	private List<Product> products;
	
	private OrderLineController orderLineController;
	private ProductController productController;
	
	@EJB(beanName = "oFacade")
	private OrderFacade orderFacade;
	
	public void addProductToCart() {
			productController.loadAllProducts();
			this.selectedProducts = new HashMap<Product, Integer>();
			for (int i = 0; i < products.size(); i++) {
				selectedProducts.put(products.get(i), 0);
			}
	}

	//getters & setters
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getConfirmationDate() {
		return confirmationDate;
	}
	public void setConfirmationDate(Date confirmationDate) {
		this.confirmationDate = confirmationDate;
	}
	public Date getEvadingDate() {
		return evadingDate;
	}
	public void setEvadingDate(Date evadingDate) {
		this.evadingDate = evadingDate;
	}

	public OrderLineController getOrderLineController() {
		return orderLineController;
	}

	public void setOrderLineController(OrderLineController orderLineController) {
		this.orderLineController = orderLineController;
	}

	public Map<Product, Integer> getSelectedProducts() {
		return selectedProducts;
	}

	public void setSelectedProducts(Map<Product, Integer> selectedProducts) {
		this.selectedProducts = selectedProducts;
	}

	public ProductController getProductController() {
		return productController;
	}

	public void setProductController(ProductController productController) {
		this.productController = productController;
	}

}
