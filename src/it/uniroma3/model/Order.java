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
	private Date confirmationDate;
	private Date evadingDate;
	
	@OneToMany (fetch=FetchType.EAGER, cascade={CascadeType.ALL})
	@JoinColumn(name="orders_id")
	private List<OrderLine> orderLines;
	
	public List<OrderLine> getOrderLines() {
		return orderLines;
	}
	
	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public Order() {
		
	}
	
	public Order(Date creationDate, Date confirmationDate, Date evadingDate, List<OrderLine> orderLines) {
		this.creationDate = creationDate;
		this.confirmationDate = confirmationDate;
		this.evadingDate = evadingDate;
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
	public Date getConfirmationDate() {
		return confirmationDate;
	}
	public void setConfirmationDate(Date confirmationDate) {
		this.confirmationDate = confirmationDate;
	}
	public Date getEvadingDate() {
		return evadingDate;
	}
	public void setEvadingDate(Date evadingDate) {
		this.evadingDate = evadingDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}