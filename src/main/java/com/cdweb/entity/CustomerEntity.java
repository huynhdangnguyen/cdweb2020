package com.cdweb.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class CustomerEntity extends PersonEntity{
	
	@OneToMany(fetch = FetchType.LAZY ,mappedBy = "customerEntity")
	List<RentDetailEntity> RentDetailEntities = new ArrayList<>();

	public List<RentDetailEntity> getRentDetailEntities() {
		return RentDetailEntities;
	}

	public void setRentDetailEntities(List<RentDetailEntity> rentDetailEntities) {
		RentDetailEntities = rentDetailEntities;
	}
}	
	
