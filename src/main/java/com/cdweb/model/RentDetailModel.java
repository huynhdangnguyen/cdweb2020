package com.cdweb.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.cdweb.entity.CustomerEntity;
import com.cdweb.entity.PriceEntity;
import com.cdweb.entity.VehicleEntity;

public class RentDetailModel extends BaseModel{

	private Long id;
	
	private String plateNo;
	
	private String framenumber;
	
	private String machinenumber;
	
	private Date endDate;
	
	private CustomerModel customerModel;
	
	private PriceModel priceModel;
	
	private VehicleModel vehicleModel;

	public RentDetailModel() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}

	public String getFramenumber() {
		return framenumber;
	}

	public void setFramenumber(String framenumber) {
		this.framenumber = framenumber;
	}

	public String getMachinenumber() {
		return machinenumber;
	}

	public void setMachinenumber(String machinenumber) {
		this.machinenumber = machinenumber;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public CustomerModel getCustomerModel() {
		return customerModel;
	}

	public void setCustomerModel(CustomerModel customerModel) {
		this.customerModel = customerModel;
	}

	public PriceModel getPriceModel() {
		return priceModel;
	}

	public void setPriceModel(PriceModel priceModel) {
		this.priceModel = priceModel;
	}

	public VehicleModel getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(VehicleModel vehicleModel) {
		this.vehicleModel = vehicleModel;
	}
	
}
