package it.uniroma3.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

public class ProviderFacade {
	@PersistenceContext(unitName = "unit-e-commerce")
    private EntityManager em;
    
	public Provider createProvider(String name, String phonenumber, String email, String vatin) {
		Provider provider = new Provider(name, phonenumber, email, vatin);
		em.persist(provider);
		return provider;
	}
	
	public Provider getProvider(Long id) {
	    Provider provider = em.find(Provider.class, id);
		return provider;
	}
	
	public List<Provider> getAllProviders() {
        CriteriaQuery<Provider> cq = em.getCriteriaBuilder().createQuery(Provider.class);
        cq.select(cq.from(Provider.class));
        List<Provider> providers = em.createQuery(cq).getResultList();
		return providers;
	}

	public void updateProvider(Provider provider) {
        em.merge(provider);
	}
	
    private void deleteProvider(Provider provider) {
        em.remove(provider);
    }

	public void deleteProvider(Long id) {
        Provider provider = em.find(Provider.class, id);
        deleteProvider(provider);
	}
}
