package it.uniroma3.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

@Stateless(name="aFacade")
public class AddressFacade {
	
	@PersistenceContext(unitName = "unit-e-commerce")
	private EntityManager em;
	
	public Address createAddress(Customer customer, String street, String city, String state, String zipcode, String country) {
		Address address = new Address(customer,street,city,state,zipcode,country);
		em.persist(address);
		return address;
	}
	
	public Address getAddress(Long id) {
	    Address address = em.find(Address.class, id);
		return address;
	}
	
	public List<Address> getAllAddresss() {
        CriteriaQuery<Address> cq = em.getCriteriaBuilder().createQuery(Address.class);
        cq.select(cq.from(Address.class));
        List<Address> addresss = em.createQuery(cq).getResultList();
		return addresss;
	}

	public void updateAddress(Address address) {
        em.merge(address);
	}
	
    private void deleteAddress(Address address) {
        em.remove(address);
    }

	public void deleteAddress(Long id) {
        Address address = em.find(Address.class, id);
        deleteAddress(address);
	}
}
