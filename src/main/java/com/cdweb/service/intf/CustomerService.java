package com.cdweb.service.intf;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;

@Service
public interface CustomerService {
	List<CustomerModel> findAll(int offset, int numItem);

	List<CustomerModel> findAllById(int offset, int numItem, String searchedString);

	Boolean detele(String id);

	Boolean saveCustomer(@Valid CustomerModel customerModel);

	CustomerModel getOne(String id);

	Boolean modifyCustomer(@Valid CustomerModel customerModel);
}
