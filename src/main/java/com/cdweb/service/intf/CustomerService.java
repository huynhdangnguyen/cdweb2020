package com.cdweb.service.intf;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;

public interface CustomerService {
	
	
	List<CustomerModel> findAllByStatus(int offset, int numItem);

	List<CustomerModel> findAllByIdAndStatus(int offset, int numItem, String searchedString);

	Boolean detele(String id);

	Boolean saveCustomer(@Valid CustomerModel customerModel);

	CustomerModel getOne(String id);

	Boolean modifyCustomer(@Valid CustomerModel customerModel);
}
