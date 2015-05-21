package it.uniroma3.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="A")
public class Administrator extends User {
	
	public Administrator(String firstname,String lastname,String email,String phonenumber,String password){
		super(firstname, lastname, email, phonenumber, password);
	}
	
	public Administrator(){
		super();
	}
	
	
}
