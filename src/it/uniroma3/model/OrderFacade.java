package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name="oFacade")
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
}
