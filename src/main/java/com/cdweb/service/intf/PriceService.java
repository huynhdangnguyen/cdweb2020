package com.cdweb.service.intf;

import java.util.List;

import javax.validation.Valid;

import com.cdweb.entity.PriceEntity;
import com.cdweb.model.PriceModel;

public interface PriceService {

	List<PriceModel> findAllSortedByStartDate(int offset, int numItem);

	List<PriceModel> findAllById(int offset, int numItem, Long searchedString);

	Boolean detele(Long id);

	PriceModel getOne(Long id);

	Boolean modifyPrice(@Valid PriceModel priceModel);

}
