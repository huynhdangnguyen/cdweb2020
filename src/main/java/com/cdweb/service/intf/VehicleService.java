package com.cdweb.service.intf;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.cdweb.model.VehicleModel;

public interface VehicleService {
	public List<VehicleModel> findAll();
	public List<VehicleModel> findAll(int offSet, int numItem);
}
 