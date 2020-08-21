package com.cdweb.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;


public class UserModel extends PersonModel{

	@Size(min = 6, max = 15, message = "Mật khẩu tối thiểu 6 ký  tự, tối đa 15 ký tự")
	private String password;
	
	@Size(min = 6, max = 15, message = "Mật khẩu tối thiểu 6 ký  tự, tối đa 15 ký tự")
	private String retypePassword;
	
	private List<UserModel> listEmployee;

	private UserModel manager;

	private List<RoleModel>	listRole;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRetypePassword() {
		return retypePassword;
	}

	public void setRetypePassword(String retypePassword) {
		this.retypePassword = retypePassword;
	}

	public List<UserModel> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<UserModel> listEmployee) {
		this.listEmployee = listEmployee;
	}

	public UserModel getManager() {
		return manager;
	}

	public void setManager(UserModel manager) {
		this.manager = manager;
	}

	public List<RoleModel> getRoleModel() {
		return listRole;
	}

	public void setRoleEntities(List<RoleModel> listRole) {
		this.listRole = listRole;
	} 
	
}
