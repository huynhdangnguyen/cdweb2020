package com.cdweb.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="price")
public class PriceEntity extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_vehicletype")
	private VehicleEntity vehicleEntity;

	@Column(name = "dayprice")
	private Integer dayPrice;

	@Column(name = "monthprice")
	private Integer monthPrice;
	
	@Column(name = "startdate")
	private Date startDate;
	
	
	@Column(name = "enddate")
	private Date endDate;


	public Long getId() {
		return id;
	}


	public VehicleEntity getVehicleEntity() {
		return vehicleEntity;
	}


	public void setVehicleEntity(VehicleEntity vehicleEntity) {
		this.vehicleEntity = vehicleEntity;
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
