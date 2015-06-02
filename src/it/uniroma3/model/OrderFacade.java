package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;

@Stateless(name = "oFacade")
public class OrderFacade {

	@PersistenceContext(unitName = "unit-e-commerce")
	private EntityManager em;

	public Order createOrder() {
		Order order = new Order();
		em.persist(order);
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
		CriteriaBuilder cb =  em.getCriteriaBuilder();
		CriteriaQuery<Order> cq = cb.createQuery(Order.class);
		Metamodel m = em.getMetamodel();
		//EntityType<Order> Order_ = m.entity(Order.class);
		Root<Order> order = cq.from(Order.class);
		cq.select(order).where(order.get("evadingDate").isNull()).where(order.get("confirmationDate").isNotNull());
		List<Order> orders = em.createQuery(cq).getResultList();
//		Query query = em.createQuery("SELECT o FROM Order o WHERE o.evadingDate IS EMPTY");
//		@SuppressWarnings("unchecked")
//		List<Order> orders = query.getResultList();
		return orders;
	}

	public void updateOrder(Order order) {
		em.merge(order);
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
