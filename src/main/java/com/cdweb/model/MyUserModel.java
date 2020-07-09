package com.cdweb.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.cdweb.entity.UserEntity;

public class MyUserModel extends User implements Serializable{

	private static final long serialVersionUID = 3280529050642637395L;

	private String name;

	private String addr;

	private Integer gender;

	private String phoneNo;
	
	private int status;

	private String createdBy;
	
	private Date createdDate;

	private String modifiedby;
	
	private Date modifiedDate;
	
	private List<UserEntity> listEmployee;
	
	private UserEntity manager;
	
	public MyUserModel(String id, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(id, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
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
	
	@Override
	public String toString() {
		return this.getUsername() + "\t" + this.getPassword() + "\t" + this.name + "\t" + this.addr + "\t" + this.phoneNo + "\t";
	}


}
