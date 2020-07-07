package com.cdweb.model;

import java.util.Date;

import javax.persistence.Column;

public class VehicleModel {
	private Long id;

	private String name;

	private int status;

	private String createdBy;

	private Date createdDate;

	private String modifiedBy;

	private Date modifiedDate;

	public VehicleModel() {
		super();
	}

	public VehicleModel(Long id, String name, int status, String createdBy, Date createdDate, String modifiedBy,
			Date modifiedDate) {
		this.id = id;
		this.name = name;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.modifiedBy = modifiedBy;
		this.modifiedDate = modifiedDate;

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Override
	public String toString() {
		return this.id + "\n" + this.name +"\n"+ this.status+ "\n" + this.createdBy + "\n" + this.createdDate + "\n" + this.modifiedBy
				+ "\n" + this.modifiedDate;
	}
}
