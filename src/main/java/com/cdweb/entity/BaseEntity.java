package com.cdweb.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@MappedSuperclass
//@EntityListeners(AuditingEntityListener.class)
public class BaseEntity implements Serializable{

	private static final long serialVersionUID = 110184593472651504L;

	@Column(name = "status")
	private int status;

//	@OneToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "createdby")
//	private UserEntity createdBy;

	@Column(name = "createdby")
//	@CreatedBy
	private String createdBy;
	
	@Column(name = "createddate")
//	@CreatedDate
	private Date createdDate;

//	@OneToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "modifiedby")
//	private UserEntity userEntity;

	@Column(name = "modifiedby")
//	@LastModifiedBy
	private String modifiedby;
	
	@Column(name = "modifieddate")
//	@LastModifiedDate
	private Date modifiedDate;

	public String getCreatedBy() {
		return createdBy;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

//	public UserEntity getCreatedBy() {
//		return createdBy;
//	}
//
//	public void setCreatedBy(UserEntity createdBy) {
//		this.createdBy = createdBy;
//	}
//
//	public UserEntity getUserEntity() {
//		return userEntity;
//	}
//
//	public void setUserEntity(UserEntity userEntity) {
//		this.userEntity = userEntity;
//	}

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
