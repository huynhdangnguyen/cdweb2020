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
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.CustomerEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.repository.intf.CustomerRepository;
import com.cdweb.service.intf.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;

	@Override
	public List<CustomerModel> findAll(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "createdDate"));
		List<CustomerModel> customerModels = new ArrayList<>();
		List<CustomerEntity> customerEntities = customerRepository.findAllByStatus(pageable,
				SystemConstant.ACTIVATE_STATUS);
		for (CustomerEntity customerEntity : customerEntities) {
			CustomerModel customerModel = new CustomerModel();
			BeanUtils.copyProperties(customerEntity, customerModel);
			customerModels.add(customerModel);
		}

		return customerModels;
	}

	@Override
	public List<CustomerModel> findAllById(int offset, int numItem, String searchedString) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "createdDate"));
		// Pageable pageable = new PageRequest(offset, numItem);
		List<CustomerModel> customerModels = new ArrayList<>();
		List<CustomerEntity> customerEntities = customerRepository.findAllByIdAndStatus(searchedString,
				SystemConstant.ACTIVATE_STATUS, pageable);
		for (CustomerEntity customerEntity : customerEntities) {
			CustomerModel customerModel = new CustomerModel();
			BeanUtils.copyProperties(customerEntity, customerModel);
			customerModels.add(customerModel);
		}

		return customerModels;
	}

	public Boolean detele(String id) {
		try {
			CustomerEntity customerEntity = customerRepository.getOne(id);
			customerEntity.setStatus(0);
			customerRepository.save(customerEntity);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
