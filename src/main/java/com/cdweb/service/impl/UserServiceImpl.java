package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.UserEntity;
import com.cdweb.model.UserModel;
import com.cdweb.repository.intf.UserRepository;
import com.cdweb.service.intf.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserRepository userRepository;
	
	@Override
	public List<UserModel> findAllById(int offset, int numItem, String searchedString) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean detele(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserModel getOne(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean modifyUser(@Valid UserModel userModel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserModel> findAllSortedByModifiedDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "modifiedDate"));
		Page<UserEntity> userEntities = userRepository.findAllByStatus(pageable,SystemConstant.ACTIVATE_STATUS);
		SystemConstant.pageNumber = userEntities.getTotalPages();
		
		List<UserModel> userModels = new ArrayList<UserModel>();

		userEntities.forEach(userEntity ->{
			UserModel userModel = new UserModel();
			BeanUtils.copyProperties(userEntity, userModel);
			userModels.add(userModel);
		});
		return userModels;
	}
	
}
