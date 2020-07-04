package com.cdweb.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@MappedSuperclass
public class BaseEntity {

	@Column(name = "status")
	private int status;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "createdby")
	private UserEntity createdBy;

	@Column(name = "createddate")
	private Date createdDate;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "modifiedby")
	private UserEntity userEntity;

	@Column(name = "modifieddate")
	private Date modifiedDate;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public UserEntity getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(UserEntity createdBy) {
		this.createdBy = createdBy;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}
