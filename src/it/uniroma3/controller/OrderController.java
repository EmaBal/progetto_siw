package it.uniroma3.controller;

import it.uniroma3.model.Administrator;
import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.Product;
import it.uniroma3.model.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@ManagedBean
@SessionScoped
public class OrderController {

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Date creationDate;
	private Date confirmationDate;
	private Date evadingDate;
	private Map<Product, OrderLine> orderlines = null;
	private Order order = null;
	private List<Order> orders;
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
	public String evadeOrder(Order order){
		return "index";
	}
	public boolean isOrderLine(Product product) {
		boolean result = false;
		for (int i = 0; i < orderlines.size(); i++) {
			if (((orderlines.get(i)).getProduct()) != null && ((orderlines.get(i)).getProduct()).equals(product)) {
				result = true;
			}
		}
		return result;
	}

	public void confirmOrder(Date date) {
		if (order != null && !order.equals(null)) {
			order.setConfirmationDate(date);
			orderFacade.updateOrder(order);
		}
		order = null;
		orderlines = null;
	}

	public String listOrders(User user) {
		if(user.getClass().getName().equals(Customer.class.getName())){
			this.orders = ((Customer) user).getOrders();
		}else if(user.getClass().getName().equals(Administrator.class.getName())){
			this.orders = orderFacade.getAllConfirmedOrders();
		}
		
		return "orders";
	}

	public String getTotalPrice(Product product) {
		float result = product.getPrice();
		for (int i = 0; i < orderlines.size(); i++) {
			if (((orderlines.get(i)).getProduct()) != null && ((orderlines.get(i)).getProduct()).equals(product)) {
				result = orderlines.get(i).getQuantity() * result;
			}
		}
		return String.valueOf(result);
	}

	public String addProductToCart(Product product, Integer quantity) {

		if (orderlines == null || orderlines.equals(null) || orderlines.isEmpty()) {
			orderlines = new HashMap<Product, OrderLine>();
		}
		if (order != null) {
			List<OrderLine> orderlinelist = order.getOrderLines();
			for (int i = 0; i < orderlinelist.size(); i++) {
				orderlines.put(orderlinelist.get(i).getProduct(), orderlinelist.get(i));
			}
		}
		if (quantity != 0 && !quantity.equals(0)) {
			OrderLine orderline = orderLineController.createOrderLine(quantity, product);
			orderlines.put(product, orderline);
		}
		return "products";
	}

	public boolean isNewOrder() {
		return order == null || order.equals(null);
	}
	public void selectOrder(Order order){
		this.order = order;
		
	}

	public Order createOrder(Date creationDate) {
		if (!orderlines.isEmpty()) {
			if (order == null || order.equals(null)) {
				order = orderFacade.createOrder();
				order.setCreationDate(creationDate);
			}
			order.setOrderLines(new ArrayList<OrderLine>(orderlines.values()));
			orderFacade.updateOrder(order);
			return order;
		} else {//in case user attempt to create an empty order
			return null;
		}
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
