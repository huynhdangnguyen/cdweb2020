package com.cdweb.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Currency;

public class PersonModel extends BaseModel {
	@Size(min = 8, max = 15, message = "CMND tối thiểu 8 ký  tự, tối đa 15 ký tự")
	private String id;

	@NotEmpty(message = "Tên không được để trống")
	@Size(max = 40, message = "Tên tối đa 40 ký tự")
	private String name;

	@NotEmpty(message = "Địa chỉ không được để trống")
	@Size(max = 200, message = "Địa chỉ tối đa 200 ký tự")
	private String addr;

	@NotNull(message = "Giới tính không được để trống")
	private Integer gender;

	@NotEmpty(message = "Số điện thoại không được để trống")
	@Size(max = 20, message = "Số điện thoại tối đa 20 ký tự")
	private String phoneNo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
}
