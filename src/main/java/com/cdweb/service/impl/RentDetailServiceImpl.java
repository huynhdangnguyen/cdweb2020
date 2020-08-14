package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.CustomerEntity;
import com.cdweb.entity.HistoryEntity;
import com.cdweb.entity.PriceEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.PriceModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.RentDetailRepository;
import com.cdweb.service.intf.RentDetailService;

@Service
public class RentDetailServiceImpl implements RentDetailService {

	@Autowired
	RentDetailRepository rentDetailRepository;
	
	@Override
	public List<RentDetailModel> findAllSortedByPlateNo(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC,"plateNo"));
		List<RentDetailModel> rentDetailModels = new ArrayList<RentDetailModel>();
		Page<RentDetailEntity> rentDetailEntitys = rentDetailRepository.findAll(pageable);
		rentDetailEntitys.forEach(rentDetailEntity -> {
			RentDetailModel rentDetailModel = new RentDetailModel();
			BeanUtils.copyProperties(rentDetailEntity, rentDetailModel);
			rentDetailModels.add(rentDetailModel);
		});
		return rentDetailModels;
	}

	@Override
	public List<RentDetailModel> findAllByPlateNoOrCustomerId(int offset, int numItem, String searchedString) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC,"plateNo"));
		List<RentDetailEntity> rentDetailEntities = rentDetailRepository.findAll(searchedString, pageable);
		List<RentDetailModel> rentDetailModels = new ArrayList<RentDetailModel>();
		rentDetailEntities.forEach(rentDetailEntity ->{
			RentDetailModel rentDetailModel = new RentDetailModel();
			BeanUtils.copyProperties(rentDetailEntity, rentDetailModel);
			rentDetailModels.add(rentDetailModel);
		});
		return rentDetailModels;
	}

	@Override
	public Boolean detele(Long id) {
		try {
			RentDetailEntity rentDetailEntity = rentDetailRepository.getOne(id);
			rentDetailEntity.setStatus(0);
			rentDetailRepository.save(rentDetailEntity);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public RentDetailModel getOne(String id) {
		RentDetailEntity rentDetailEntity = rentDetailRepository.getOneByIdAndStatus(id, SystemConstant.ACTIVATE_STATUS);
		RentDetailModel rentDetailModel = new RentDetailModel();
		BeanUtils.copyProperties(rentDetailEntity, rentDetailModel);

		PriceEntity priceEntity = rentDetailEntity.getPriceEntity();
		PriceModel priceModel = new PriceModel();
		BeanUtils.copyProperties(priceEntity, priceModel);
		rentDetailModel.setPriceModel(priceModel);
		
		VehicleEntity vehicleEntity = rentDetailEntity.getVehicleEntity();
		VehicleModel vehicleModel = new VehicleModel();
		BeanUtils.copyProperties(vehicleEntity, vehicleModel);
		rentDetailModel.setVehicleModel(vehicleModel);
		
		return rentDetailModel;
	}

	@Override
	public Boolean modifyRentDetail(@Valid RentDetailModel rentDetailModel) {
		rentDetailModel.setStatus(1);
		try {
			RentDetailEntity rentDetailEntity = new RentDetailEntity();
			BeanUtils.copyProperties(rentDetailModel, rentDetailEntity);
			rentDetailRepository.save(rentDetailEntity);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	
}
