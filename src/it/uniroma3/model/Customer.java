package it.uniroma3.model;

public class Customer extends User{
	
	
	public Customer(String firstname,String lastname,String email,String phonenumber,String password){
		super(firstname, lastname, email, phonenumber, password);
	}
	public Customer(){
		super();
	}
}
