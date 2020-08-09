package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.CustomerEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.repository.intf.CustomerRepository;
import com.cdweb.service.intf.CustomerService;
import com.cdweb.util.VietnameseUtils;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public List<CustomerModel> findAll(int offSet, int numItem) {
		Pageable pageable = new PageRequest(offSet, numItem);
		List<CustomerModel> customerModels = new ArrayList<>();
		List<CustomerEntity> customerEntities = customerRepository.findAllByStatus(pageable, SystemConstant.ACTIVATE_STATUS);
		for(CustomerEntity customerEntity : customerEntities) {
			CustomerModel customerModel = new CustomerModel();
			BeanUtils.copyProperties(customerEntity, customerModel);
			customerModels.add(customerModel);
		}
		
		Collections.sort(customerModels, new Comparator<CustomerModel>(){
            @Override
            public int compare(CustomerModel cm1, CustomerModel cm2) {
                return VietnameseUtils.generator(cm1.getName()).compareTo(VietnameseUtils.generator(cm2.getName()));
            }
        });
		return customerModels;
	}
	
}
