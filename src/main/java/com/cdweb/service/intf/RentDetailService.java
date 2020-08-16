package com.cdweb.service.intf;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.cdweb.model.CustomerModel;
import com.cdweb.model.RentDetailModel;

public interface RentDetailService {

	List<RentDetailModel> findAllSortedByPlateNo(int offset, int numItem);

	List<RentDetailModel> findAllByPlateNoOrCustomerId(int offset, int numItem, String searchedString);

	Boolean detele(Long id);

	RentDetailModel getOne(String id);

	Boolean modifyRentDetail(@Valid RentDetailModel rentDetailModel);
	
}
