package it.uniroma3.model;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="A")
public class Administrator extends User {
	
	public Administrator(String firstname, String lastname, String email, String phonenumber,String password,Date registrationDate,Date birthDate) {
		super(firstname, lastname, email, phonenumber, password,registrationDate,birthDate);
	}
	
	public Administrator(){
		super();
	}
	
	
}
