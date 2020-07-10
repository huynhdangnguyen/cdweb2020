package com.cdweb.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	
}
