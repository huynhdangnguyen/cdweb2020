package com.cdweb.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "rentdetail")
public class RentDetailEntity extends BaseEntity{

	@Id
	@Column(name = "id")
	private Long id;
	
	@Column(name = "plateno")
	private String plateNo;
	
	@Column(name = "framenumber")
	private String framenumber;
	
	@Column(name = "machinenumber")
	private String machinenumber;
	
	@Column(name = "enddate")
	private Date endDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_customer")
	private CustomerEntity customerEntity;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_price")
	private PriceEntity priceEntity;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_vehicletype")
	private VehicleEntity vehicleEntity;

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

	public CustomerEntity getCustomerEntity() {
		return customerEntity;
	}

	public void setCustomerEntity(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}

	public PriceEntity getPriceEntity() {
		return priceEntity;
	}

	public void setPriceEntity(PriceEntity priceEntity) {
		this.priceEntity = priceEntity;
	}

	public VehicleEntity getVehicleEntity() {
		return vehicleEntity;
	}

	public void setVehicleEntity(VehicleEntity vehicleEntity) {
		this.vehicleEntity = vehicleEntity;
	}

	public Long getId() {
		return id;
	}
	
	
}
