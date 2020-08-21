package com.cdweb.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "user")
@EntityListeners(AuditingEntityListener.class)
public class UserEntity extends PersonEntity {

	@Column(name = "password")
	private String password;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "manager")
	private List<UserEntity> listEmployee = new ArrayList<>();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "managerid")
	private UserEntity manager;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = { @JoinColumn(name = "id_user") }, inverseJoinColumns = {
			@JoinColumn(name = "id_role") })
	private List<RoleEntity> roleEntities = new ArrayList<RoleEntity>();

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<UserEntity> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<UserEntity> listEmployee) {
		this.listEmployee = listEmployee;
	}

	public UserEntity getManager() {
		return manager;
	}

	public void setManager(UserEntity manager) {
		this.manager = manager;
	}

	public List<RoleEntity> getRoleEntities() {
		return roleEntities;
	}

	public void setRoleEntities(List<RoleEntity> roleEntities) {
		this.roleEntities = roleEntities;
	}

}