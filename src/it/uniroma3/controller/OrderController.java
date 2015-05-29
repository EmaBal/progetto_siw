package it.uniroma3.controller;

import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.Product;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.myfaces.config.element.OrderSlot;

@ManagedBean
@SessionScoped
public class OrderController {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Date creationDate;
	private Date confirmationDate;
	private Date evadingDate;
	private List<OrderLine> orderlines;
	private Order order;

	private OrderLineController orderLineController;

	@EJB(beanName = "oFacade")
	private OrderFacade orderFacade;

	public String addProductToCart(Product product, Integer quantity) {
		OrderLine orderline = orderLineController.createOrderLine(quantity,
				product);
		if (order != null) {
			orderlines = order.getOrderLines();
		}
		if (orderlines == null || orderlines.equals(null)
				|| orderlines.isEmpty()) {
			orderlines = new ArrayList<OrderLine>();
		}
		orderlines.add(orderline);
		return "products";
	}

	public Order createOrder(Date creationDate) {
		order = orderFacade.createOrder();
		order.setCreationDate(creationDate);
		order.setOrderLines(orderlines);
		orderFacade.updateOrder(order);
		return order;
	}

	// getters & setters

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

	public List<OrderLine> getOrderlines() {
		return orderlines;
	}

	public void setOrderlines(List<OrderLine> orderlines) {
		this.orderlines = orderlines;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
