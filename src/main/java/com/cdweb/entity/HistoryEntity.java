package com.cdweb.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;


@Entity
@Table(name = "history")
@EntityListeners(AuditingEntityListener.class)
public class HistoryEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_rentdetail")
	private RentDetailEntity rentDetailEntity;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_customer")
	private CustomerEntity customerEntity;
	
	@Column(name = "plateinimage")
	@Basic(fetch = FetchType.LAZY)
	private byte[] plateInImage;
	
	@Column(name = "faceinimage")
	@Basic(fetch = FetchType.LAZY)
	private byte[] faceInImage;
	
	@Column(name = "plateoutimage")
	@Basic(fetch = FetchType.LAZY)
	private byte[] plateOutImage;
	
	@Column(name = "faceoutimage")
	@Basic(fetch = FetchType.LAZY)
	private byte[] faceOutImage;
	
	@Column(name = "plateno")
	private String plateNo;
	
	@Column(name = "indate")
	@CreatedDate
	private Date inDate;
	
	@Column(name = "outdate")
	@LastModifiedDate
	private Date outDate;
	
	@Column(name = "price")
	private Integer price;
	
	@Column(name = "createdby")
	@CreatedBy
	private String createdBy;
	
	@Column(name = "note")
	private String note;

	public RentDetailEntity getRentDetailEntity() {
		return rentDetailEntity;
	}

	public void setRentDetailEntity(RentDetailEntity rentDetailEntity) {
		this.rentDetailEntity = rentDetailEntity;
	}

	public CustomerEntity getCustomerEntity() {
		return customerEntity;
	}

	public void setCustomerEntity(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}

	public byte[] getPlateInImage() {
		return plateInImage;
	}

	public void setPlateInImage(byte[] plateInImage) {
		this.plateInImage = plateInImage;
	}

	public byte[] getFaceInImage() {
		return faceInImage;
	}

	public void setFaceInImage(byte[] faceInImage) {
		this.faceInImage = faceInImage;
	}

	public byte[] getPlateOutImage() {
		return plateOutImage;
	}

	public void setPlateOutImage(byte[] plateOutImage) {
		this.plateOutImage = plateOutImage;
	}

	public byte[] getFaceOutImage() {
		return faceOutImage;
	}

	public void setFaceOutImage(byte[] faceOutImage) {
		faceOutImage = faceOutImage;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Long getId() {
		return id;
	}
	
//	@Override
//	public String toString() {
//		
//		return this.id + "\t" + this.plateNo + "\t" + this.getOutDate() + "\t" + this.getPrice();
//	}
	
}
