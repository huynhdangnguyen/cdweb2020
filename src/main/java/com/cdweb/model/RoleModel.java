package com.cdweb.model;

import java.util.List;

public class RoleModel extends BaseModel{
	private Long id;
	
	private String name;
	
	private List<UserModel> listUser;

	public RoleModel() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<UserModel> getListUser() {
		return listUser;
	}

	public void setListUser(List<UserModel> listUser) {
		this.listUser = listUser;
	}

}
