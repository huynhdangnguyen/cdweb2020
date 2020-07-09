package com.cdweb.model;

import java.io.Serializable;
import java.util.Date;

import com.cdweb.entity.CustomerEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.entity.UserEntity;

public class HistoryModel implements Serializable{
	private static final long serialVersionUID = -7992601649460503747L;

	private Long id;
	
	private RentDetailModel rentDetailModel;

	private CustomerModel customerModel;
	
	private byte[] plateInImage;
	
	private byte[] faceInImage;
	
	private byte[] plateOutImage;
	
	private byte[] FaceOutImage;
	
	private String plateNo;
	
	private Date inDate;
	
	private Date outDate;
	
	private Integer price;
	
	private UserEntity userModel;
	
	private String note;

	public HistoryModel() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public RentDetailModel getRentDetailModel() {
		return rentDetailModel;
	}

	public void setRentDetailModel(RentDetailModel rentDetailModel) {
		this.rentDetailModel = rentDetailModel;
	}

	public CustomerModel getCustomerModel() {
		return customerModel;
	}

	public void setCustomerModel(CustomerModel customerModel) {
		this.customerModel = customerModel;
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
		return FaceOutImage;
	}

	public void setFaceOutImage(byte[] faceOutImage) {
		FaceOutImage = faceOutImage;
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

	public UserEntity getUserModel() {
		return userModel;
	}

	public void setUserModel(UserEntity userModel) {
		this.userModel = userModel;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
}
