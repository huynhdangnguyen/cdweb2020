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

import com.cdweb.entity.RoleEntity;

public class UserModel extends PersonModel{

	private List<UserModel> listEmployee;

	private UserModel manager;

	private List<RoleModel>	listRole;
	
	public UserModel() {
		super();
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
