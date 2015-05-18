package it.uniroma3.controller;

import it.uniroma3.model.UserFacade;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class UserController {
	
	private String email;
	private String password;
	private String passwordErr = null;
	
	@EJB(beanName="uFacade")
	private UserFacade userFacade;
	
	public String findCredentials() {
		if (this.password.equals(userFacade.getUser(email).getPassword())) {
			return "products";
		} else {
			passwordErr="Wrong email or password";
			return "index";
		}
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
}