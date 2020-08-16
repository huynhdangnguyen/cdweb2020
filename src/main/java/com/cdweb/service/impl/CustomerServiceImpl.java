package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.CustomerEntity;
import com.cdweb.entity.RentDetailEntity;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;
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

	@Override
	public Boolean detele(String id) {
		try {
			CustomerEntity customerEntity = customerRepository.getOne(id);
			customerEntity.setStatus(0);
			customerRepository.save(customerEntity);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Boolean saveCustomer(@Valid CustomerModel customerModel) {
		customerModel.setStatus(1);
		CustomerEntity customerEntity = customerRepository.getOne(customerModel.getId());
		try {
			customerEntity.getId();
		} catch (Exception e) {
			customerEntity = new CustomerEntity();
			BeanUtils.copyProperties(customerModel, customerEntity);
			customerRepository.save(customerEntity);
			return true;
		}
		return false;

	}

	@Override
	public Boolean modifyCustomer(@Valid CustomerModel customerModel) {
		CustomerEntity customerEntity = new CustomerEntity();
		try {
			customerEntity.getId();
		} catch (Exception e) {
			return false;
		}
		customerEntity.setId(customerModel.getId());
		customerEntity.setName(customerModel.getName());
		customerEntity.setAddr(customerModel.getAddr());
		customerEntity.setPhoneNo(customerModel.getPhoneNo());
		customerRepository.save(customerEntity);
		return true;
	}

	@Override
	public CustomerModel getOne(String id) {
		CustomerEntity customerEntity = customerRepository.getOneByIdAndStatus(id, SystemConstant.ACTIVATE_STATUS);
		CustomerModel customerModel = new CustomerModel();
		BeanUtils.copyProperties(customerEntity, customerModel);

		List<RentDetailEntity> rentDetailEntities = customerEntity.getRentDetailEntities();
		List<RentDetailModel> rentDetailModels = new ArrayList<>();
		for (RentDetailEntity rentDetailEntity : rentDetailEntities) {
			RentDetailModel rentDetailModel = new RentDetailModel();
			BeanUtils.copyProperties(rentDetailEntity, rentDetailModel);
			rentDetailModels.add(rentDetailModel);
		}
		customerModel.setListRentDetail(rentDetailModels);

		return customerModel;
	}

}
