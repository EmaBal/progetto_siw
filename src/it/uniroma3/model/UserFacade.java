package it.uniroma3.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Stateless(name = "uFacade")
public class UserFacade {

	@PersistenceContext(unitName = "unit-e-commerce")
	private EntityManager em;


	public Administrator createAdministrator(String firstname, String lastname, String email, String phonenumber, String password,Date registrationDate,Date birthDate) throws NoSuchAlgorithmException {
		Administrator user = new Administrator(firstname, lastname, email, phonenumber, md5(password),registrationDate,birthDate);
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
		Query query = em.createQuery("SELECT u FROM User u WHERE u.email LIKE :usermail").setParameter("usermail", email);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if(users == null || users.equals(null) || users.isEmpty() || users.size() != 1){
			return null;
		}else{
			return users.get(0);
		}
		
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

	public Customer createCustomer(String firstname, String lastname, String email, String phonenumber, String password,Date registrationDate,Date birthDate) throws NoSuchAlgorithmException {
		Customer user = new Customer(firstname, lastname, email, phonenumber, md5(password),registrationDate,birthDate);
		em.persist(user);
		return user;
	}

	public User getCustomer(Long id) {
		Customer user = em.find(Customer.class, id);
		return user;
	}

	public List<Customer> getCustomers() {
		CriteriaQuery<Customer> cq = em.getCriteriaBuilder().createQuery(Customer.class);
		Root<Customer> croot = cq.from(Customer.class);
		cq.select(croot);
		List<Customer> users = em.createQuery(cq).getResultList();
		return users;
	}

	public void updateCustomer(Customer customer) {
		em.merge(customer);
	}

	private void deleteAdministrator(Customer customer) {
		em.remove(customer);
	}

	public String verifyUserCredentials(String email, String password) throws NoSuchAlgorithmException {
		// CriteriaBuilder cb = em.getCriteriaBuilder();
		// EntityType<User> User_ = em.getMetamodel().entity(User.class);
		// CriteriaQuery<User> cq = cb.createQuery(User.class);
		// Root<User> user = cq.from(User.class);
		// cq.where(cb.equal(user.get((SignularAttribute<? super User, String>)
		// User_.getAttribute("email")), email));
		User user = getUser(email);
		if (user == null) {
			return "There is no account with the given email.";
		} else if (user.getPassword().equals(md5(password))) {
			return "";
		} else {
			return "The password is incorrect.";
		}

	}

	public static String md5(String pasword) throws NoSuchAlgorithmException {
		MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
		mdAlgorithm.update(pasword.getBytes());

		byte[] digest = mdAlgorithm.digest();
		StringBuffer hexString = new StringBuffer();

		for (int i = 0; i < digest.length; i++) {
			pasword = Integer.toHexString(0xFF & digest[i]);

			if (pasword.length() < 2) {
				pasword = "0" + pasword;
			}

			hexString.append(pasword);
		}

		return hexString.toString();
	}

	public void setCustomerAddress(Customer customer, Address address) {
		customer.setAddress(address);
		updateCustomer(customer);		
	}




}
