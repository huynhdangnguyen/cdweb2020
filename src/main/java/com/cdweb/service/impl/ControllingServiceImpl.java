package com.cdweb.service.impl;

import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.HistoryEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.repository.intf.HistoryRepository;
import com.cdweb.repository.intf.RentDetailRepository;
import com.cdweb.service.intf.ControllingService;
import com.cdweb.service.intf.RentDetailService;

@Service
public class ControllingServiceImpl implements ControllingService {


	@Autowired
	RentDetailRepository rentDetailRepository;

	@Autowired
	HistoryRepository historyRepository;
	
	@Override
	public RentDetailModel saveHistoryIn(String rentDetailId, byte[] plateInImage) {
		RentDetailEntity rentDetailEntity = new RentDetailEntity();
		HistoryEntity historyEntity = new HistoryEntity();
		RentDetailModel rentDetailModel = new RentDetailModel();
		try {
			rentDetailEntity = rentDetailRepository.getOneByIdAndStatus(Long.parseLong(rentDetailId),
					SystemConstant.ACTIVATE_STATUS);
			rentDetailEntity.getId();
			historyEntity.setRentDetailEntity(rentDetailEntity);
			BeanUtils.copyProperties(rentDetailEntity, rentDetailModel);
		} catch (Exception e) {
			return null;
		}
		try {
		if(rentDetailEntity.getPlateNo() != null) {
			historyEntity.setCustomerEntity(rentDetailEntity.getCustomerEntity());
			historyEntity.setPlateNo(rentDetailEntity.getPlateNo());
			CustomerModel customerModel = new CustomerModel();
			BeanUtils.copyProperties(rentDetailEntity.getCustomerEntity(), customerModel);
			rentDetailModel.setCustomerModel(customerModel);
		}
		}catch (Exception e) {
		}
		historyEntity.setPlateInImage(plateInImage);
		historyEntity.setInDate(new Date(System.currentTimeMillis()));
		historyRepository.save(historyEntity);
		return rentDetailModel;
	}

	@Override
	public HistoryModel getLastHistoryByRentDetailEntity(Long rentDetailId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RentDetailModel saveHistoryOut(String idCardOut, byte[] image) {
		// TODO Auto-generated method stub
		return null;
	}

}
