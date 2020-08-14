package com.cdweb.service.intf;

import java.util.List;

import com.cdweb.entity.PriceEntity;
import com.cdweb.model.PriceModel;

public interface PriceService {

	List<PriceModel> findAllSortedByStartDate(int offset, int numItem);

}
