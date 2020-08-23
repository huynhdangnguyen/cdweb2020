package com.cdweb.entity;

import java.util.Date;

public class LastHistoryEntity {
	Date inDate;
	
	Long rentDetailId;

	public LastHistoryEntity(Long rentDetailId,Date inDate) {
		this.inDate = inDate;
		this.rentDetailId = rentDetailId;
	}
	
	public Long getRentDetailId() {
		return rentDetailId;
	}

	public void setRentDetailId(Long rentDetailId) {
		this.rentDetailId = rentDetailId;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	
	
}
