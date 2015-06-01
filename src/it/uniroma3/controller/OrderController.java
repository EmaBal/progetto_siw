package it.uniroma3.controller;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
import it.uniroma3.model.Product;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@ManagedBean
@SessionScoped
public class OrderController {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Date creationDate;
	private Date confirmationDate;
	private Date evadingDate;
	private Map<Product, OrderLine> orderlines;
	private Order order;

	private OrderLineController orderLineController;

	@EJB(beanName = "oFacade")
	private OrderFacade orderFacade;

	public String openCartPage(Customer user) {
		getUnconrfimedOrder(user);
		return "cart";
	}

	public void getUnconrfimedOrder(Customer user) {
		this.order = orderFacade.getUnconrfimedOrder(user);
	}

	public boolean isOrderLine(Product product) {
		boolean result = false;
		for (int i = 0; i < orderlines.size(); i++) {
			if (((orderlines.get(i)).getProduct()) != null
					&& ((orderlines.get(i)).getProduct()).equals(product)) {
				result = true;
			}
		}
		return result;
	}

	public String getTotalPrice(Product product) {
		float result = product.getPrice();
		for (int i = 0; i < orderlines.size(); i++) {
			if (((orderlines.get(i)).getProduct()) != null
					&& ((orderlines.get(i)).getProduct()).equals(product)) {
				result = orderlines.get(i).getQuantity() * result;
			}
		}
		return String.valueOf(result);
	}

	public String addProductToCart(Product product, Integer quantity) {
		OrderLine orderline = null;
		if (quantity != 0 && !quantity.equals(0)) {
			orderline = orderLineController.createOrderLine(quantity, product);
		}
		if (orderlines == null || orderlines.equals(null)
				|| orderlines.isEmpty()) {
			orderlines = new HashMap<Product, OrderLine>();
		}
		if (order != null) {
			List<OrderLine> orderlinelist = order.getOrderLines();
			for (int i = 0; i < orderlinelist.size(); i++) {
				orderlines.put(orderlinelist.get(i).getProduct(),
						orderlinelist.get(i));
			}
		}
		if (orderlines.keySet().contains(product)) {
			orderLineController.deleteOrderLine(orderlines.get(product));
		}
		if (quantity != 0 && !quantity.equals(0)) {
			orderlines.put(product, orderline);
		}
		return "products";
	}

	public boolean isNewOrder() {
		return order == null || order.equals(null);
	}

	public Order createOrder(Date creationDate) {
		if (order == null || order.equals(null)) {
			order = orderFacade.createOrder();
		}
		order.setCreationDate(creationDate);
		order.setOrderLines(new ArrayList<OrderLine>(orderlines.values()));
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

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Map<Product, OrderLine> getOrderlines() {
		return orderlines;
	}

	public void setOrderlines(Map<Product, OrderLine> orderlines) {
		this.orderlines = orderlines;
	}

}
