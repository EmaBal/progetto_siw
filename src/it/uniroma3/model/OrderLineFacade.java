package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name="olFacade")
public class OrderLineFacade {
	
    @PersistenceContext(unitName = "unit-e-commerce")
    private EntityManager em;
    
	public OrderLine createOrderLine(Integer quantity, Float unitPrice, Product product) {
		OrderLine orderline = new OrderLine(quantity, unitPrice, product);
		em.persist(orderline);
		return orderline;
	}
	
	public OrderLine getOrderLine(Long id) {
	    OrderLine orderline = em.find(OrderLine.class, id);
		return orderline;
	}
	
	public List<OrderLine> getAllOrderLines() {
        CriteriaQuery<OrderLine> cq = em.getCriteriaBuilder().createQuery(OrderLine.class);
        cq.select(cq.from(OrderLine.class));
        List<OrderLine> orderlines = em.createQuery(cq).getResultList();
		return orderlines;
	}

	public void updateOrderLine(OrderLine orderline) {
        em.merge(orderline);
	}
	
    private void deleteOrderLine(OrderLine orderline) {
        em.remove(orderline);
    }

	public void deleteOrderLine(Long id) {
        OrderLine orderline = em.find(OrderLine.class, id);
        deleteOrderLine(orderline);
	}
}
