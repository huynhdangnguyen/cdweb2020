package com.cdweb.model;

import java.util.ArrayList;
import java.util.Comparator;
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
	
	@Override
	public String toString() {
		return this.getId() + "\t" + this.getName() + "\t" + this.getAddr() + "\t" + this.getPhoneNo() + "\t" + this.getGender();
	}

//	@Override
//	public int compareTo(CustomerModel cm) {
//		return VietnameseUtils.generator(this.getName()).compareTo(VietnameseUtils.generator(cm.getName()));
//	}
//
//	 implements Comparable<CustomerModel>
	

}
