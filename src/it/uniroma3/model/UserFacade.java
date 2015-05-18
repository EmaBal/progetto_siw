package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name ="uFacade")
public class UserFacade {
	
    @PersistenceContext(unitName = "unit-e-commerce")
    private EntityManager em;
    
	public Administrator createAdministrator(String firstname,String lastname,String email,String phonenumber,String password){
		Administrator user = new Administrator(firstname, lastname, email, phonenumber, password);
		em.persist(user);
		return user;
	}
	public Administrator getAdministrator(Long id) {
		Administrator user = em.find(Administrator.class, id);
		return user;
	}

	public List<Administrator> getAdministrators() {
        CriteriaQuery<Administrator> cq = em.getCriteriaBuilder().createQuery(Administrator.class);
        cq.select(cq.from(Administrator.class));
        List<Administrator> users = em.createQuery(cq).getResultList();
		return users;
	}

	public void updateAdministrator(Administrator administrator) {
        em.merge(administrator);
	}
	
    private void deleteAdministrator(Administrator administrator) {
        em.remove(administrator);
    }
    
    

	public User getUser(Long id) {
		User user = em.find(Administrator.class, id);
		return user;
	}
	public User getUser(String email) {
//		 CriteriaQuery<User> cq = em.getCriteriaBuilder().createQuery(User.class);
//	        cq.select(cq.from(User.class));
//	        List<User> users = em.createQuery(cq).getResultList();
//			return users;
		User user = em.find(Administrator.class, email);
		return user;
	}

	public List<User> getUsers() {
        CriteriaQuery<User> cq = em.getCriteriaBuilder().createQuery(User.class);
        cq.select(cq.from(User.class));
        List<User> users = em.createQuery(cq).getResultList();
		return users;
	}

	public void updateUser(User user) {
        em.merge(user);
	}
	
    private void deleteUser(User user) {
        em.remove(user);
    }
    
    public Customer createCustomer(String firstname,String lastname,String email,String phonenumber,String password){
    	Customer user = new Customer(firstname, lastname, email, phonenumber, password);
		em.persist(user);
		return user;
	}
	public Customer getCustomer(Long id) {
		Customer user = em.find(Customer.class, id);
		return user;
	}

	public List<Customer> getCustomers() {
        CriteriaQuery<Customer> cq = em.getCriteriaBuilder().createQuery(Customer.class);
        cq.select(cq.from(Customer.class));
        List<Customer> users = em.createQuery(cq).getResultList();
		return users;
	}

	public void updateCustomer(Customer customer) {
        em.merge(customer);
	}
	
    private void deleteAdministrator(Customer customer) {
        em.remove(customer);
    }
	
}
