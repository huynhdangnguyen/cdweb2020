package com.cdweb.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity{
	
	@Id
	@Column(name = "id")
	private String id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "addr")
	private String addr;
	
	@Column(name = "gender")
	private Integer gender;
	
	@Column(name = "phoneno")
	private String phoneNo;
	
	@OneToMany(fetch = FetchType.LAZY ,mappedBy = "customerEntity")
	Set<RentDetailEntity> RentDetailEntities;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public Set<RentDetailEntity> getRentDetailEntities() {
		return RentDetailEntities;
	}

	public void setRentDetailEntities(Set<RentDetailEntity> rentDetailEntities) {
		RentDetailEntities = rentDetailEntities_Khang;
	}
//Khang nè
}	
	
