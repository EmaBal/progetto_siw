package it.uniroma3.controller;

import it.uniroma3.model.Order;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
import it.uniroma3.model.Product;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@SessionScoped
@ManagedBean
public class OrderLineController {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Product product;
	private Integer quantity;
	private Float unitPrice;



	@EJB(beanName = "olFacade")
	private OrderLineFacade orderLineFacade;

	public OrderLine createOrderLine(Integer quantity, Product product) {
		return orderLineFacade.createOrderLine(quantity, product.getPrice(),
				product);
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

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void deleteOrderLine(OrderLine orderLine) {
		orderLineFacade.deleteOrderLine(orderLine.getId());
	}

}
