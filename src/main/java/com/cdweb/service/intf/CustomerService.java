package com.cdweb.service.intf;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cdweb.model.CustomerModel;

@Service
public interface CustomerService {
	List<CustomerModel> findAll(int offset, int numItem);

	List<CustomerModel> findAllById(int offset, int numItem, String searchedString);
}
