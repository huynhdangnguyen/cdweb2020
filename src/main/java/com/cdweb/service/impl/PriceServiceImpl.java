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
import org.springframework.stereotype.Service;

import com.cdweb.entity.PriceEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.model.PriceModel;
import com.cdweb.model.RentDetailModel;
import com.cdweb.repository.intf.PriceRepository;
import com.cdweb.service.intf.PriceService;

@Service
public class PriceServiceImpl implements PriceService{

	@Autowired
	PriceRepository priceRepository;
	
	@Override
	public List<PriceModel> findAllSortedByStartDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC,"startDate"));
		List<PriceModel> priceModels = new ArrayList<PriceModel>();
		Page<PriceEntity> priceEntitys = priceRepository.findAll(pageable);
		priceEntitys.forEach(priceEntity -> {
			PriceModel priceModel = new PriceModel();
			BeanUtils.copyProperties(priceEntity, priceModel);
			priceModels.add(priceModel);
		});
		return priceModels;
	}
	
}
