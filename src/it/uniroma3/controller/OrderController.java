package it.uniroma3.controller;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.Product;

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

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Date creationDate;
	private Date confirmationDate;
	private Date evadingDate;
	private Map<Product, OrderLine> orderlines = null;
	private Order order = null;
	private List<Order> orders;
	private Map<Order, Boolean> orderEvasion;
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

	public void evadeOrder(Order order, Date date) {
		order.setEvadingDate(date);
		orderFacade.updateOrder(order);
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
		clearOrder();
	}

	public void clearOrder() {
		this.order = null;
		this.orderlines = null;
	}

	public void clearOrders() {
		this.orders = null;
		this.orderEvasion = null;
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

	public void addProductToCart(Product product, Integer quantity, Date now) {
		boolean createNewOrder = order == null;

		if (orderlines == null || orderlines.equals(null) || orderlines.isEmpty()) {
			orderlines = new HashMap<Product, OrderLine>();
		}
		if (!createNewOrder) {
			List<OrderLine> orderlinelist = order.getOrderLines();
			orderlines = new HashMap<Product, OrderLine>();
			for (int i = 0; i < orderlinelist.size(); i++) {
				orderlines.put(orderlinelist.get(i).getProduct(), orderlinelist.get(i));
			}
		}
		if (quantity != 0 && !quantity.equals(0)) {
			OrderLine orderline;
			if (orderlines.containsKey(product) && orderlines.get(product).getQuantity().compareTo(quantity) != 0) {// changing
				// orderline
				orderLineController.deleteOrderLine(orderlines.get(product));
				orderline = orderLineController.createOrderLine(quantity, product);
				orderlines.put(product, orderline);
			} else if (orderlines.containsKey(product)) {// same quantity for an
															// orderline
				orderline = orderlines.get(product);
				orderline = orderLineController.createOrderLine(quantity, product);
				orderlines.put(product, orderline);
			}
		} else {
			if (orderlines.containsKey(product)) {
				orderLineController.deleteOrderLine(orderlines.get(product));
				orderlines.remove(product);
			}
		}

		if (createNewOrder) {
			order = orderFacade.createOrder();
			order.setCreationDate(now);
		}
		order.setOrderLines(new ArrayList<OrderLine>(orderlines.values()));

	}

	public boolean isNewOrder() {
		return order == null || order.equals(null);
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

	public void putOrder(Order order, boolean b) {
		if (orderEvasion == null) {
			orderEvasion = new HashMap<Order, Boolean>();
		}
		orderEvasion.put(order, b);
	}

	public List<Order> getAllConfirmedOrders() {
		this.orders = orderFacade.getAllConfirmedOrders();
		return orders;
	}

	public Order getOrderFromId(Long id) {

		return orderFacade.getOrder(id);
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Map<Order, Boolean> getOrderEvasion() {
		return orderEvasion;
	}

	public void setOrderEvasion(Map<Order, Boolean> orderEvasion) {
		this.orderEvasion = orderEvasion;
	}

	public void showProducts(Customer user) {
		getUnconrfimedOrder(user);
		if (isNewOrder()) {
			clearOrder();
		} else {
			if (order.getOrderLines() != null && !order.getOrderLines().equals(null) && !order.getOrderLines().isEmpty()) {
				List<OrderLine> realorderlines = order.getOrderLines();
				orderlines = new HashMap<Product, OrderLine>();
				for (int i = 0; i < realorderlines.size(); i++) {
					orderlines.put(realorderlines.get(i).getProduct(), realorderlines.get(i));
				}
			}
		}

	}

	public void deleteOrder() {

	}

}
