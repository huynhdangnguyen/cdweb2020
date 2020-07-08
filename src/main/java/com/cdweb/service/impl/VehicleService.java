package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.Vehicle;
import com.cdweb.repository.IVehicleRepossitory;
import com.cdweb.service.IVehicleService;

@Service
public class VehicleService implements IVehicleService {
	
	@Autowired
	public IVehicleRepossitory iVehicleRepossitory;
	
	@Override
	public List<Vehicle> findAll() {
		List<VehicleEntity> listVehicleEntity = iVehicleRepossitory.findAll();
		List<Vehicle> res = new ArrayList<>();
		for(VehicleEntity vehicleEntity : listVehicleEntity) {
			Vehicle vehicle = new Vehicle();
			vehicle.setId(vehicleEntity.getId());
			vehicle.setName(vehicleEntity.getName());
			vehicle.setStatus(vehicleEntity.getStatus());
//			vehicle.setCreatedBy(vehicleEntity.getCreatedBy());
			vehicle.setCreatedDate(vehicleEntity.getCreatedDate());
//			vehicle.setModifiedBy(vehicleEntity.getModifiedBy());
			vehicle.setModifiedDate(vehicleEntity.getModifiedDate());
			res.add(vehicle);
		}
		return res;
	}

}
