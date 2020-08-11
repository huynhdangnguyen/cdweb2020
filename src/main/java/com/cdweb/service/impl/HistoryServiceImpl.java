package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.jaxb.SpringDataJaxb.PageRequestDto;
import org.springframework.stereotype.Service;

import com.cdweb.entity.CustomerEntity;
import com.cdweb.entity.HistoryEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.repository.intf.HistoryRepository;
import com.cdweb.service.intf.HistoryService;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	HistoryRepository historyRepository;
	
	@Override
	public HistoryModel saveHistory(HistoryModel historyModel) {
		HistoryEntity historyEntity = new HistoryEntity();
		BeanUtils.copyProperties(historyModel, historyEntity);
		historyEntity = historyRepository.save(historyEntity);
		BeanUtils.copyProperties( historyEntity,historyModel);
		return historyModel;
	}
	
	@Override
	public byte[] getImage(long id, String imageName) {
		HistoryEntity historyEntity = historyRepository.getOne(id);
		switch (imageName.toLowerCase()) {
		case "plateinimage":
			return historyEntity.getPlateInImage();
		case "plateoutimage":
			return historyEntity.getPlateOutImage();
		case "faceinimage":
			return historyEntity.getFaceInImage();
		case "faceoutimage":
			return historyEntity.getFaceOutImage();
		default:
			return null;
		}
	}
	
	@Override
	public HistoryModel getOne(Long id) {
		HistoryEntity historyEntity = historyRepository.getOne(id);
		HistoryModel historyModel = new HistoryModel();
		BeanUtils.copyProperties(historyEntity, historyModel, "plateInImage", "faceInImage", "plateOutImage", "faceOutImage");
		
		CustomerModel customerModel = new CustomerModel();
		BeanUtils.copyProperties(historyEntity.getCustomerEntity(), customerModel);
		historyModel.setCustomerModel(customerModel);

		RentDetailModel rentDetailModel = new RentDetailModel();
		BeanUtils.copyProperties(historyEntity.getRentDetailEntity(), rentDetailModel);
		historyModel.setRentDetailModel(rentDetailModel);
		
		return historyModel;
	}

	@Override
	public List<HistoryModel> findAllHistorySortedByInDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC,"inDate"));
//		Pageable pageable = new PageRequest(offset, numItem);
		List<HistoryModel> historyModels = new ArrayList<HistoryModel>();
		Page<HistoryEntity> historyEntities = historyRepository.findAll(pageable);
//		List<HistoryEntity> historyEntities = historyRepository.findAll();
		historyEntities.forEach(historyEntity -> {
			HistoryModel historyModel = new HistoryModel();
			BeanUtils.copyProperties(historyEntity, historyModel, "plateInImage", "faceInImage", "plateOutImage", "faceOutImage");
			historyModels.add(historyModel);
		});
		return historyModels;
	}

	@Override
	public List<HistoryModel> findAllHistoryByIdRentDetailOrIdCustomer(int offset, int numItem, String searchedString) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC,"inDate"));
		List<HistoryEntity> historyEntities = historyRepository.findAll(searchedString, pageable);
		List<HistoryModel> historyModels = new ArrayList<HistoryModel>();
		historyEntities.forEach(historyEntity ->{
			HistoryModel historyModel = new HistoryModel();
			BeanUtils.copyProperties(historyEntity, historyModel, "plateInImage", "faceInImage", "plateOutImage", "faceOutImage");
			historyModels.add(historyModel);
		});
		return historyModels;
	}

	
}
