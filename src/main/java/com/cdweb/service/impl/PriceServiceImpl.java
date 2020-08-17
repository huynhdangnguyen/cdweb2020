package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.Date;
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
import com.cdweb.entity.PriceEntity;
import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.PriceModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.repository.intf.PriceRepository;
import com.cdweb.repository.intf.VehicleRepossitory;
import com.cdweb.service.intf.PriceService;

@Service
public class PriceServiceImpl implements PriceService {

	@Autowired
	PriceRepository priceRepository;
	
	@Autowired
	VehicleRepossitory vehicleRepossitory;

	@Override
	public List<PriceModel> findAllSortedByStartDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "startDate"));
		List<PriceModel> priceModels = new ArrayList<PriceModel>();
		Page<PriceEntity> priceEntitys = priceRepository.findAllByStatus(pageable, SystemConstant.ACTIVATE_STATUS);
		SystemConstant.pageNumber = priceEntitys.getTotalPages();
		priceEntitys.forEach(priceEntity -> {
			PriceModel priceModel = new PriceModel();
			BeanUtils.copyProperties(priceEntity, priceModel);
			priceModels.add(priceModel);
		});
		return priceModels;
	}

	@Override
	public List<PriceModel> findAllById(int offset, int numItem, Long searchedString) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "id"));
		Page<PriceEntity> priceEntities = priceRepository.findAllByIdAndStatus(searchedString,
				SystemConstant.ACTIVATE_STATUS, pageable);
		SystemConstant.pageNumber = priceEntities.getTotalPages();
		List<PriceModel> priceModels = new ArrayList<PriceModel>();
		priceEntities.forEach(priceEntity -> {
			PriceModel priceModel = new PriceModel();
			BeanUtils.copyProperties(priceEntity, priceModel);
			priceModels.add(priceModel);
		});
		return priceModels;
	}

	@Override
	public Boolean detele(Long id) {
		try {
			PriceEntity priceEntity = priceRepository.getOne(id);
			priceEntity.setStatus(0);
			priceEntity.setEndDate(new Date(System.currentTimeMillis()));
			priceRepository.save(priceEntity);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public PriceModel getOne(Long id) {
		PriceEntity priceEntity = priceRepository.getOneByIdAndStatus(id,
				SystemConstant.ACTIVATE_STATUS);
		PriceModel priceModel = new PriceModel();
		BeanUtils.copyProperties(priceEntity, priceModel);

		VehicleEntity vehicleEntity = priceEntity.getVehicleEntity();
		VehicleModel vehicleModel = new VehicleModel();
		BeanUtils.copyProperties(vehicleEntity, vehicleModel);
		priceEntity.setVehicleEntity(vehicleEntity);

		return priceModel;
	}

	@Override
	public Boolean modifyPrice(@Valid PriceModel priceModel) {
		PriceEntity priceEntity = priceRepository.getOne(priceModel.getId());
		try {
			if(!priceModel.getVehicleModel().getId().equals(priceEntity.getVehicleEntity().getId()))
				priceEntity.setVehicleEntity(vehicleRepossitory.getOne(priceModel.getVehicleModel().getId()));
			priceEntity.getId();
		} catch (Exception e) {
			return false;
		}
		priceEntity.setDayPrice(priceModel.getDayPrice());
		priceEntity.setMonthPrice(priceModel.getMonthPrice());
		
		priceRepository.save(priceEntity);
		
		return true;
	}

}
