package com.cdweb.service.impl;

import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.HistoryEntity;
import com.cdweb.entity.LastHistoryEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.repository.intf.HistoryRepository;
import com.cdweb.repository.intf.PriceRepository;
import com.cdweb.repository.intf.RentDetailRepository;
import com.cdweb.service.intf.ControllingService;
import com.cdweb.service.intf.RentDetailService;

@Service
public class ControllingServiceImpl implements ControllingService {

	@Autowired
	RentDetailRepository rentDetailRepository;

	@Autowired
	HistoryRepository historyRepository;
	
	@Autowired
	PriceRepository priceRepository;

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
			if (rentDetailEntity.getPlateNo() != null) {
				historyEntity.setCustomerEntity(rentDetailEntity.getCustomerEntity());
				historyEntity.setPlateNo(rentDetailEntity.getPlateNo());
				CustomerModel customerModel = new CustomerModel();
				BeanUtils.copyProperties(rentDetailEntity.getCustomerEntity(), customerModel);
				rentDetailModel.setCustomerModel(customerModel);
			}
		} catch (Exception e) {
		}
		historyEntity.setPlateInImage(plateInImage);
		historyRepository.save(historyEntity);
		return rentDetailModel;
	}

	@Override
	public HistoryModel getLastHistoryByRentDetailEntity(Long rentDetailId) {
		LastHistoryEntity lastHistoryEntity = historyRepository.getLastHistroEntity(rentDetailId);
		try {
			lastHistoryEntity.getRentDetailId();
		}catch (Exception e) {
			return null;
		}
		HistoryEntity historyEntity = historyRepository.getLastOne(rentDetailId,
				lastHistoryEntity.getInDate());
		HistoryModel historyModel = new HistoryModel();
		BeanUtils.copyProperties(historyEntity, historyModel, "faceInImage", "faceOutImage");
		return historyModel;
	}

	@Override
	public HistoryModel saveHistoryOut(String rentDetailId, byte[] plateOutImage) {
		LastHistoryEntity lastHistoryEntity = historyRepository.getLastHistroEntity(Long.parseLong(rentDetailId));
		HistoryEntity historyEntity = historyRepository.getLastOne(lastHistoryEntity.getRentDetailId(),
				lastHistoryEntity.getInDate());
		historyEntity.setPrice(calculatePriceOut(historyEntity));
		historyEntity.setOutDate(new Date());
		historyEntity.setPlateOutImage(plateOutImage);
		historyRepository.save(historyEntity);
		
		HistoryModel historyModel = new HistoryModel();
		BeanUtils.copyProperties(historyEntity, historyModel);
		
			
		RentDetailModel rentDetailModel = new RentDetailModel();
		BeanUtils.copyProperties(historyEntity.getRentDetailEntity(), rentDetailModel);
		historyModel.setRentDetailModel(rentDetailModel);

		try {
		CustomerModel customerModel = new CustomerModel();
		BeanUtils.copyProperties(historyEntity.getCustomerEntity(), customerModel);
		historyModel.setCustomerModel(customerModel);
		}catch (Exception e) {
			
		}
		
		return historyModel;
	}

	private int calculatePriceOut(HistoryEntity historyOut) {
		int res = 0;
		try {
			historyOut.getCustomerEntity().getId();
		} catch (Exception e) {
			res = (int) (priceRepository.getOneByIdAndStatus(historyOut.getRentDetailEntity().getPriceEntity().getId(), SystemConstant.ACTIVATE_STATUS).getDayPrice()
					* calculateTheNumberOfDays(new Date(System.currentTimeMillis()), historyOut.getInDate()));
			return res;
		}
			
		if (historyOut.getRentDetailEntity().getEndDate().compareTo(new Date(System.currentTimeMillis())) < 0)
			res = (int) (priceRepository.getOneByIdAndStatus(historyOut.getRentDetailEntity().getPriceEntity().getId(), SystemConstant.ACTIVATE_STATUS).getDayPrice()
					* calculateTheNumberOfDays(new Date(System.currentTimeMillis()), historyOut.getRentDetailEntity().getEndDate()));
		return res;
	}

	private long calculateTheNumberOfDays(Date startDate, Date endDate) {
		return (startDate.getTime() - endDate.getTime()) / (1000 * 60 * 60 * 24) + 1;
	}

}
