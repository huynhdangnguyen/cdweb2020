package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.jaxb.SpringDataJaxb.PageRequestDto;
import org.springframework.stereotype.Service;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.model.HistoryModel;
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
		switch (imageName) {
		case "plateInImage":
			return historyEntity.getPlateInImage();
		case "plateOutImage":
			return historyEntity.getPlateOutImage();
		case "faceInImage":
			return historyEntity.getFaceInImage();
		case "faceOutImage":
			return historyEntity.getFaceOutImage();
		default:
			return null;
		}
	}
	
	@Override
	public HistoryModel getOne(Long id) {
		HistoryEntity historyEntity = historyRepository.getOne(id);
		HistoryModel historyModel = new HistoryModel();
		BeanUtils.copyProperties(historyEntity, historyModel);
		return historyModel;
	}

	@Override
	public List<HistoryModel> findAllHistorySortedByInDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort("inDate"));
		List<HistoryModel> historyModels = new ArrayList<HistoryModel>();
		Page<HistoryEntity> historyEntities = historyRepository.findAll(pageable);
		historyEntities.forEach(historyEntity -> {
			HistoryModel historyModel = new HistoryModel();
			BeanUtils.copyProperties(historyEntity, historyModel);
			historyModels.add(historyModel);
		});
		return historyModels;
	}
	
	
}
