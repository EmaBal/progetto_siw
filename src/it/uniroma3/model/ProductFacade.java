package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name="pFacade")
public class ProductFacade {
	
    @PersistenceContext(unitName = "unit-e-commerce")
    private EntityManager em;
    
	public Product createProduct(String name, String code, Float price, String description, Integer quantity) {
		Product product = new Product(name, price, description, code, quantity);
		em.persist(product);
		return product;
	}
	
	public Product getProduct(Long id) {
	    Product product = em.find(Product.class, id);
		return product;
	}
	
	public List<Product> getAllProducts() {
        CriteriaQuery<Product> cq = em.getCriteriaBuilder().createQuery(Product.class);
        cq.select(cq.from(Product.class));
        List<Product> products = em.createQuery(cq).getResultList();
		return products;
	}

	public void updateProduct(Product product) {
        em.merge(product);
	}
	
    private void deleteProduct(Product product) {
        em.remove(product);
    }

	public void deleteProduct(Long id) {
        Product product = em.find(Product.class, id);
        deleteProduct(product);
	}
	
	public List<Product> getProductFromSearch(String name) {
		Query query = em.createQuery("SELECT p FROM Product p WHERE p.name LIKE :products").setParameter("products", name);
		@SuppressWarnings("unchecked")
		List<Product> products = query.getResultList();
		return products;
	}
	

}