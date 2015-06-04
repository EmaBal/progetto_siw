package it.uniroma3.controller;

import it.uniroma3.model.Administrator;
import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;
import it.uniroma3.model.User;
import it.uniroma3.model.UserFacade;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map.Entry;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class UserController {

	private String email;
	private String password;
	private String firstname;
	private String lastname;
	private String phonenumber;
	private String logMessage = null;
	private User user;
	private Date birthdate;
	private String userprivilege;
	private List<Customer> customers;
	private Customer customer;
	
	@EJB(beanName = "uFacade")
	private UserFacade userFacade;

	private ProviderController providerController;
	private AddressController addressController;
	private ProductController productController;
	private OrderController orderController;
	
	public String openCustomerProfilePage() {
		this.customer = (Customer) user;
		return "customerProfile";
	}
	
	public List<Customer> findAllCustomers() {
		List<Customer> customerRes = new ArrayList<Customer>();
		List<User> users = userFacade.getUsers();
		for (User user:users) {
			if (user.getClass().getName().equals(Customer.class.getName())) {
				customerRes.add((Customer) user);
			}
		}
		return customerRes;
	}
	public String evadeOrder(Order order){
		orderController.evadeOrder(order,currentDate());
		List<OrderLine> orderlines = order.getOrderLines();
		for(int x=0;x<orderlines.size();x++) {
			List<Provider> providers = providerController.getProductProviders(orderlines.get(x).getProduct());
			int n = orderlines.get(x).getQuantity();
			for (int a=0;a<providers.size();a++) {
				Provider provider = providers.get(a);
				List<Product> providerProducts = provider.getProducts();
				for(int i = 0;i<provider.getProducts().size();i++){
					if(n == 0){
						break;
					}
					if(provider.getProducts().get(i).equals(orderlines.get(x).getProduct())){
						n--;
						providerProducts.remove(orderlines.get(x).getProduct());
					}
					
				}
				provider.setProducts(providerProducts);
				providerController.updateProvider(provider);
				if(n == 0){
					break;
				}
			}
			
		}
		return showOrders();
	}
	public String getCustomerFromOrder(Order currentorder) {
		customers = findAllCustomers();
		System.out.println("clicked order: " + currentorder.getId());
		for (int i=0;i<customers.size();i++) {
			System.out.println("customer: " + customers.get(i).getFirstname() + " orders: " + customers.get(i).getOrders().size());
			
			if (customers.get(i).getOrders().contains(currentorder)) {
				this.customer = customers.get(i);
			}
		}
		if (customer == null) {
			return "index";
		}
		return "customerProfile";
	}

	public String createOrder() {
		boolean isNewOrder = orderController.isNewOrder();
		Order order = orderController.createOrder(currentDate());
		if (order != null) {
			List<Order> orders = ((Customer) user).getOrders();
			if (orders == null || orders.equals(null) || orders.isEmpty()) {
				orders = new ArrayList<Order>();
			}
			if (!isNewOrder) {
				for (int i = 0; i < orders.size(); i++) {
					if (orders.get(i).getId().equals(order.getId())) {
						orders.set(i, order);
					}
				}
			} else {
				orders.add(order);
			}

			((Customer) user).setOrders(orders);
			userFacade.updateUser(user);
			return openCartPage();
		}else{
			return "index";//in case user attempt to create an empty order
		}
		
	}

	public String confirmOrder() {
		orderController.confirmOrder(currentDate());
		productController.confirmOrder();
		userFacade.updateCustomer((Customer) user);
		return showOrders();
	}

	public String addProductToCart(Product product) {
		return orderController.addProductToCart(product, productController.getProductsQuantity().get(product));
	}

	public String getAllProductsFromSearch() {
		return productController.getProductsFromSearch();
	}

	public String showProducts() {
		return productController.listProducts(orderController.getOrder());
	}

	public String openCartPage() {
		return orderController.openCartPage((Customer) user);
	}

	public String showOrders() {
		orderController.clearOrders();
		if(user.getClass().getName().equals(Customer.class.getName())){
			List<Order> userOrders = ((Customer) user).getOrders();
			orderController.setOrders(userOrders);
			for(int i=0;i<userOrders.size();i++) {
				orderController.putOrder(userOrders.get(i), true);
			}
		}else if(user.getClass().getName().equals(Administrator.class.getName())){
			List<Order> confirmedOrders = (orderController.getAllConfirmedOrders());
			for(int i=0;i<confirmedOrders.size();i++) {
				List<OrderLine> orderlines = confirmedOrders.get(i).getOrderLines();
				for(int x=0;x<orderlines.size();x++) {
					List<Provider> providers = providerController.getProductProviders(orderlines.get(x).getProduct());
					int n = 0;
					for (int a=0;a<providers.size();a++) {
						Provider provider = providers.get(a);
						for (int q = 0; q < provider.getProducts().size(); q++) {
							if(provider.getProducts().get(q).equals(orderlines.get(x).getProduct())){
								n++;
							}
						}
					}
					if (n>=orderlines.get(x).getQuantity()) {
						orderController.putOrder(confirmedOrders.get(i), true);
					} else {
						orderController.putOrder(confirmedOrders.get(i), false);
					}
					
				}
			}
		}
		return "orders";
	}

	public String showProviders() {
		return providerController.listProviders();
	}

	public String openProductSelectionPage() {
		return productController.selectProducts(providerController.getProvider());
	}
	public String openOrderDetails(Order order){
		orderController.selectOrder(order);
		return "order";
	}
	public String discardSelectedProviderProducts() {
		String result = productController.discardSelectedProviderProducts();
		return result;
	}

	public String saveSelectedProviderProducts() {
		String result = productController.saveSelectedProviderProducts(providerController.getProvider());
		providerController.saveProviderProducts();
		return result;
	}

	public String openProductDetails(Product product) {
		String result = productController.selectProduct(product);
		providerController.selectProduct(product);
		return result;
	}

	public String logIn() {

		try {
			String logInMessage = userFacade.verifyUserCredentials(email, password);
			if (logInMessage.length() == 0) {
				user = userFacade.getUser(email);
				addressController.getAddress();
				logMessage = "Login successful : " + user.getClass().getName();
				userprivilege = user.getClass().getName();
				if (user.getClass().getName().equals(Customer.class.getName())) {
					orderController.getUnconrfimedOrder((Customer) user);// get
																			// last
																			// session
																			// order
				}
				return "index";
			} else {
				logMessage = "Unable to login: " + logInMessage;
				return "index";
			}
		} catch (NoSuchAlgorithmException e) {
			logMessage = "Unable to login. Md5 conversion failed" + e.getMessage();
			return "index";
		}

	}

	public String logOut() {
		this.user = null;
		logMessage = "";
		return "index";
	}

	public String createCustomer() {
		String nextpage = "index";
		try {
			this.user = userFacade.createCustomer(firstname, lastname, email, phonenumber, password, currentDate(), birthdate);
			userprivilege = user.getClass().getName();
			logMessage = "Signup successful. ";
		} catch (Exception e) {
			if (e.getClass().getName().equals("javax.ejb.EJBTransactionRolledbackException")) {
				logMessage = "Unable to sign up. This email is alredy taken";
				nextpage = "signUp";
			} else {
				logMessage = "Unable to sign up. Md5 conversion failed " + e.getClass().getName() + e.getMessage();
				nextpage = "signUp";
			}

		}
		return nextpage;
	}

	public String createAdministrator() {
		try {
			this.user = userFacade.createAdministrator(firstname, lastname, email, phonenumber, password, currentDate(), birthdate);
			userprivilege = user.getClass().getName();
			logMessage = "Signup successful.";
		} catch (NoSuchAlgorithmException e) {
			logMessage = "Unable to sign up. Md5 conversion failed" + e.getMessage();
		}
		return "index";
	}

	public Date currentDate() {
		return new Date(System.currentTimeMillis());
	}

	public String openNewUserAddressPage() {
		return addressController.openNewUserAddressPage();
	}

	public String openNewProductPage() {
		providerController.selectProviders();
		return productController.openNewProductPage();
	}

	public String openNewProviderPage() {
		return providerController.openNewProviderPage();
	}

	public String createProduct() {
		String result = productController.createProduct();
		List<Provider> productProviders = providerController.saveSelectedProductProviders(productController.getProduct());
		productController.saveProductProviders(productProviders);
		return result;
	}

	public String addAddress() {
		String ret = this.addressController.createAddress();
		if (((Customer) user).getAddress() != null) {
			addressController.deleteCustomerAddress((Customer) user);
		}
		userFacade.setCustomerAddress((Customer) user, addressController.getAddress());
		return ret;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordErr() {
		return logMessage;
	}
	
	public void setPasswordErr(String passwordErr) {
		this.logMessage = passwordErr;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AddressController getAddressController() {
		return addressController;
	}

	public void setAddressController(AddressController addressController) {
		this.addressController = addressController;
	}

	public String getUserprivilege() {
		return userprivilege;
	}

	public void setUserprivilege(String userprivilege) {
		this.userprivilege = userprivilege;
	}

	public ProductController getProductController() {
		return productController;
	}

	public void setProductController(ProductController productController) {
		this.productController = productController;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getLogMessage() {
		return logMessage;
	}

	public void setLogMessage(String logMessage) {
		this.logMessage = logMessage;
	}

	public ProviderController getProviderController() {
		return providerController;
	}

	public void setProviderController(ProviderController providerController) {
		this.providerController = providerController;
	}

	public OrderController getOrderController() {
		return orderController;
	}

	public void setOrderController(OrderController orderController) {
		this.orderController = orderController;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}