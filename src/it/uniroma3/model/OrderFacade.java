package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name = "oFacade")
public class OrderFacade {

	@PersistenceContext(unitName = "unit-e-commerce")
	private EntityManager em;

	public Order createOrder() {
		Order order = new Order();
		em.persist(order);
		em.flush();
		return order;
	}
	public Order createOrder(Order order) {
		em.persist(order);
		em.flush();
		return order;
	}
	public Order getOrder(Long id) {
		Order order = em.find(Order.class, id);
		return order;
	}

	public List<Order> getAllOrders() {
		CriteriaQuery<Order> cq = em.getCriteriaBuilder().createQuery(Order.class);
		cq.select(cq.from(Order.class));
		List<Order> orders = em.createQuery(cq).getResultList();
		return orders;
	}
	public List<Order> getAllConfirmedOrders() {

		Query query = em.createQuery("SELECT o FROM Order o WHERE o.evadingDate IS NULL AND o.confirmationDate IS NOT NULL");
		@SuppressWarnings("unchecked")
		List<Order> orders = query.getResultList();
		return orders;
	}

	public void updateOrder(Order order) {
		em.merge(order);
		em.flush();
	}

	private void deleteOrder(Order order) {
		em.remove(order);
	}

	public void deleteOrder(Long id) {
		Order order = em.find(Order.class, id);
		deleteOrder(order);
	}

	public Order getUnconrfimedOrder(Customer user) {
		List<Order> orders = user.getOrders();
		Order currentOrder = null;
		for(int i = 0;i<orders.size();i++){
			if(orders.get(i).getConfirmationDate() == null || orders.get(i).getConfirmationDate().equals(null)){
				currentOrder = orders.get(i);
				return currentOrder;
			}
		}
		return currentOrder;
		

	}
}
