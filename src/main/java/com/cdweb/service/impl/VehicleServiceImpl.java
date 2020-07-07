package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.VehicleRepossitory;
import com.cdweb.service.intf.VehicleService;

@Service
public class VehicleServiceImpl implements VehicleService {
	
	@Autowired
	public VehicleRepossitory iVehicleRepossitory;
	
	@Override
	public List<VehicleModel> findAll() {
		List<VehicleEntity> listVehicleEntity = iVehicleRepossitory.findAll();
		List<VehicleModel> res = new ArrayList<>();
		for(VehicleEntity vehicleEntity : listVehicleEntity) {
			VehicleModel vehicle = new VehicleModel();
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
