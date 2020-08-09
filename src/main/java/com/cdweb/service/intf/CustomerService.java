package com.cdweb.service.intf;

import java.util.List;

import com.cdweb.model.CustomerModel;

public interface CustomerService {
	List<CustomerModel> findAll(int offset, int numItem);
}
