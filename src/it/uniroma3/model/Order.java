package it.uniroma3.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Order {
	

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private Date creationDate;
//	@ManyToOne
//	private Customer customer;
	@OneToMany (fetch=FetchType.EAGER, cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="orders_id")
	private List<OrderLine> orderLines;
	
	public List<OrderLine> getOrderLines() {
		return orderLines;
	}
	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}
//	public Customer getCustomer() {
//		return customer;
//	}
//	public void setCustomer(Customer customer) {
//		this.customer = customer;
//	}
	public Order() {
		
	}
	
	public Order(Date creationDate, List<OrderLine> orderLines) {
		this.creationDate = creationDate;
		this.orderLines = orderLines;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
}