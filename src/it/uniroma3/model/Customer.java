package it.uniroma3.model;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;

@Entity
@DiscriminatorValue(value="C")
public class Customer extends User {
	
	public Customer(String firstname,String lastname,String email,String phonenumber,String password){
		super(firstname, lastname, email, phonenumber, password);
	}
	
	public Customer(){
		super();
	}
}
