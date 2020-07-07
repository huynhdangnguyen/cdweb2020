package com.cdweb.model;

import javax.persistence.Column;
import javax.persistence.Id;

public class PersonModel extends AbstractModel{
	private String id;
	
	private String name;
	
	private String addr;
	
	private Integer gender;
	
	private String phoneNo;
	
	public PersonModel() {
	}

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
	
}
