package com.cdweb.model;

public class VehicleModel extends BaseModel{

	private Long id;

	private String name;

	public VehicleModel() {
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



	@Override
	public String toString() {
		return this.id + "\n" + this.name +"\n"+ this.getStatus() + "\n" + this.getCreatedBy() + "\n" + this.getCreatedDate() + "\n" + this.getModifiedBy()
				+ "\n" + this.getModifiedDate();
	}
}
