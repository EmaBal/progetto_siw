package it.uniroma3.controller;

import it.uniroma3.model.Customer;
import it.uniroma3.model.User;
import it.uniroma3.model.UserFacade;

import java.security.NoSuchAlgorithmException;

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
	private String passwordErr = null;
	private User user;
	private String userprivilege;

	@EJB(beanName = "uFacade")
	private UserFacade userFacade;
	
	
	private AddressController addressController;
	private ProductController productController;
	
	

	public String mostraListinoProdotti() {
		return productController.listProducts();
	}
	public String logIn() {

		try {
			String logInMessage = userFacade.verifyUserCredentials(email, password);
			if (logInMessage.length() == 0) {
				user = userFacade.getUser(email);
				addressController.getAddress();
				passwordErr = "Login successful : " + user.getClass().getName();
				userprivilege = user.getClass().getName();
				return "index";
			} else {
				passwordErr = "Unable to login : " + logInMessage;
				return "index";
			}
		} catch (NoSuchAlgorithmException e) {
			passwordErr = "Unable to login. Md5 conversion failed" + e.getMessage();
			return "index";
		}

	}
	public String logOut(){
		this.user = null;		
		passwordErr = "Logged out";
		return "index";
	}
	public String createCustomer() {
		try {
			this.user = userFacade.createCustomer(firstname, lastname, email, phonenumber, password);
			passwordErr = "Signup successful. ";
		} catch (NoSuchAlgorithmException e) {
			passwordErr = "Unable to sign up. Md5 conversion failed" + e.getMessage();
		}
		return "index";
	}
	public String createAdministrator(){
		try {
			this.user = userFacade.createAdministrator(firstname, lastname, email, phonenumber, password);
			passwordErr = "Signup successful.";
		} catch (NoSuchAlgorithmException e) {
			passwordErr = "Unable to sign up. Md5 conversion failed" + e.getMessage();
		}
		return "index";
	}
	public String openNewAddressPage() {
		return addressController.openNewAddressPage();
	}
	public String openNewProductPage() {
		return productController.openNewProductPage();
	}
	
	public String addAddress() {
		String ret = this.addressController.createAddress();
		userFacade.setCustomerAddress((Customer) user,addressController.getAddress());
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
		return passwordErr;
	}

	public void setPasswordErr(String passwordErr) {
		this.passwordErr = passwordErr;
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
}