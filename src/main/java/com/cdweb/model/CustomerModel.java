package com.cdweb.model;

import java.util.ArrayList;
import java.util.List;

import com.cdweb.entity.RentDetailEntity;

public class CustomerModel extends PersonModel{
	List<RentDetailModel> listRentDetail;

	public CustomerModel() {
		super();
	}

	public List<RentDetailModel> getListRentDetail() {
		return listRentDetail;
	}

	public void setListRentDetail(List<RentDetailModel> listRentDetail) {
		this.listRentDetail = listRentDetail;
	}

}
