package it.uniroma3.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderLines")
public class OrderLine {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private Integer orderedQuantity;
	
	@Column(nullable=false)
	private Float unitPrice;
	
	@OneToOne (cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private Product product;
	
	public OrderLine() {
		
	}
	
	public OrderLine(Integer orderedQuantity, Float unitPrice, Product product) {
		this.unitPrice = unitPrice;
		this.orderedQuantity = orderedQuantity;
		this.product = product;
	}
	
}
