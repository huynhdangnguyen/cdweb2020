package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.VehicleRepossitory;
import com.cdweb.service.intf.VehicleService;

@Service
public class VehicleServiceImpl implements VehicleService {
	
	@Autowired
	public VehicleRepossitory vehicleRepossitory;
	
	@Override
	public List<VehicleModel> findAll() {
		List<VehicleEntity> listVehicleEntity = vehicleRepossitory.findAll();
		List<VehicleModel> res = new ArrayList<>();
		for(VehicleEntity vehicleEntity : listVehicleEntity) {
			VehicleModel vehicleModel = new VehicleModel();
			BeanUtils.copyProperties(vehicleEntity, vehicleModel);
			res.add(vehicleModel);
		}
		return res;
	}

	@Override
	public List<VehicleModel> findAll(int offSet, int numItem) {
		Pageable pageable = new PageRequest(offSet, numItem);
		return null;
	}

}
