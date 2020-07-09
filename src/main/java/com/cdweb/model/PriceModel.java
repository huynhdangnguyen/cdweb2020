package com.cdweb.model;

import java.util.Date;

import com.cdweb.entity.VehicleEntity;

public class PriceModel extends BaseModel{
	
	private Long id;
	
	private VehicleModel vehicleModel;

	private Integer dayPrice;

	private Integer monthPrice;
	
	private Date startDate;
	
	
	private Date endDate;


	public PriceModel() {
		super();
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public VehicleModel getVehicleModel() {
		return vehicleModel;
	}


	public void setVehicleModel(VehicleModel vehicleModel) {
		this.vehicleModel = vehicleModel;
	}


	public Integer getDayPrice() {
		return dayPrice;
	}


	public void setDayPrice(Integer dayPrice) {
		this.dayPrice = dayPrice;
	}


	public Integer getMonthPrice() {
		return monthPrice;
	}


	public void setMonthPrice(Integer monthPrice) {
		this.monthPrice = monthPrice;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}
