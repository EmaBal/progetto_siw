package it.uniroma3.controller;

import it.uniroma3.model.Customer;
import it.uniroma3.model.Order;
import it.uniroma3.model.Product;
import it.uniroma3.model.Provider;
import it.uniroma3.model.User;
import it.uniroma3.model.UserFacade;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
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

	@EJB(beanName = "uFacade")
	private UserFacade userFacade;

	private ProviderController providerController;
	private AddressController addressController;
	private ProductController productController;
	private OrderController orderController;

	@PostConstruct
	public void init() {
		productController.init();
	}

	public String createOrder() {
		boolean isNewOrder = orderController.isNewOrder();
		Order order = orderController.createOrder(currentDate());
		List<Order> orders = ((Customer)user).getOrders();
		if (orders == null || orders.equals(null) || orders.isEmpty()) {
			orders = new ArrayList<Order>();
		}
		if(!isNewOrder){
			for(int i = 0;i<orders.size();i++){
				if(orders.get(i).getId().equals(order.getId())){
					orders.set(i, order);
				}
			}
		}else{
			orders.add(order);
		}
		
		((Customer)user).setOrders(orders);
		userFacade.updateUser(user);
		return "index";
	}
	
	public String addProductToCart(Product product) {
		return orderController.addProductToCart(product, productController.getProductsQuantity().get(product));
	}

	public String getAllProductsFromSearch() {
		return productController.getProductsFromSearch();
	}

	public String showProducts() {
		return productController.listProducts();
	}
	public String openCartPage() {
		return orderController.openCartPage((Customer) user);
	}
	public String showProviders() {
		return providerController.listProviders();
	}

	public String openProductSelectionPage() {
		return productController.selectProducts(providerController
				.getProvider());
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
			String logInMessage = userFacade.verifyUserCredentials(email,
					password);
			if (logInMessage.length() == 0) {
				user = userFacade.getUser(email);
				addressController.getAddress();
				logMessage = "Login successful : " + user.getClass().getName();
				userprivilege = user.getClass().getName();
				if(user.getClass().getName() == Customer.class.getName()){
					orderController.getUnconrfimedOrder((Customer)user);//get last session order
				}
				return "index";
			} else {
				logMessage = "Unable to login: " + logInMessage;
				return "index";
			}
		} catch (NoSuchAlgorithmException e) {
			logMessage = "Unable to login. Md5 conversion failed"
					+ e.getMessage();
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
			this.user = userFacade.createCustomer(firstname, lastname, email,
					phonenumber, password, currentDate(), birthdate);
			userprivilege = user.getClass().getName();
			logMessage = "Signup successful. ";
		} catch (Exception e) {
			if (e.getClass().getName()
					.equals("javax.ejb.EJBTransactionRolledbackException")) {
				logMessage = "Unable to sign up. This email is alredy taken";
				nextpage = "signUp";
			} else {
				logMessage = "Unable to sign up. Md5 conversion failed "
						+ e.getClass().getName() + e.getMessage();
				nextpage = "signUp";
			}

		}
		return nextpage;
	}

	public String createAdministrator() {
		try {
			this.user = userFacade.createAdministrator(firstname, lastname,
					email, phonenumber, password, currentDate(), birthdate);
			userprivilege = user.getClass().getName();
			logMessage = "Signup successful.";
		} catch (NoSuchAlgorithmException e) {
			logMessage = "Unable to sign up. Md5 conversion failed"
					+ e.getMessage();
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
		List<Provider> productProviders = providerController
				.saveSelectedProductProviders(productController.getProduct());
		productController.saveProductProviders(productProviders);
		return result;
	}

	public String addAddress() {
		String ret = this.addressController.createAddress();
		if (((Customer) user).getAddress() != null) {
			addressController.deleteCustomerAddress((Customer) user);
		}
		userFacade.setCustomerAddress((Customer) user,
				addressController.getAddress());
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
}