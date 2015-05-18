package it.uniroma3.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQuery(name = "findAllOrderLine", query = "SELECT ol FROM OrderLine ol")
public class OrderLine {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private Integer quantity;
	
	@OneToOne (cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Product product;
	
	public OrderLine() {
		
	}
	
	public OrderLine(Integer quantity, Product product) {
		this.quantity = quantity;
		this.product = product;
	}
	
}
