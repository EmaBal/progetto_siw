package it.uniroma3.controller;

import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;

import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;

@SessionScoped
@ManagedBean
public class OrderLineController {
	
//	@ManagedProperty(value="#{param.id}")
	private String productName;
	private Long id;
	private Product product;
	private Integer quantity;
	private Order order;
	private List<OrderLine> orderlines;
	private Integer prova;
	
	@EJB(beanName="olFacade")
	private OrderLineFacade orderLineFacade;
	
	@EJB(beanName="oFacade")
	private OrderFacade orderFacade;
	
	@EJB(beanName="pFacade")
	private ProductFacade productFacade;
	
	public String createOrderLine() {
		this.orderlines.add(orderLineFacade.createOrderLine(quantity, product));
		return "productSelection";
	}
	
//	public String findProduct() {
//		this.product = productFacade.getProduct(id);
//		return "newOrderLine";
//	}
//	
//	public String findProduct(Long id) {
//		this.product = productFacade.getProduct(id);
//		return "newOrderLine";
//	}
	
	public String createOrder() {
		order = orderFacade.createOrder();
		return "index";
	}
	
	public String findProduct() {
		
		return "newOrderLine";
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<OrderLine> getOrderlines() {
		return orderlines;
	}

	public void setOrderlines(List<OrderLine> orderlines) {
		this.orderlines = orderlines;
	}

	public OrderLineFacade getOrderLineFacade() {
		return orderLineFacade;
	}

	public void setOrderLineFacade(OrderLineFacade orderLineFacade) {
		this.orderLineFacade = orderLineFacade;
	}

	public OrderFacade getOrderFacade() {
		return orderFacade;
	}

	public void setOrderFacade(OrderFacade orderFacade) {
		this.orderFacade = orderFacade;
	}

	public ProductFacade getProductFacade() {
		return productFacade;
	}

	public void setProductFacade(ProductFacade productFacade) {
		this.productFacade = productFacade;
	}
}
