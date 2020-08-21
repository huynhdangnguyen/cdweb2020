package com.cdweb.service.impl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.UserEntity;
import com.cdweb.entity.RoleEntity;
import com.cdweb.entity.UserEntity;
import com.cdweb.model.UserModel;
import com.cdweb.repository.intf.RoleRepository;
import com.cdweb.repository.intf.UserRepository;
import com.cdweb.service.intf.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Override
	public List<UserModel> findAllById(int offset, int numItem, String searchedString) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "createdDate"));
		List<UserModel> userModels = new ArrayList<>();
		Page<UserEntity> userEntities = userRepository.findAllByIdAndStatus(searchedString,
				SystemConstant.ACTIVATE_STATUS, pageable);
		SystemConstant.pageNumber = userEntities.getTotalPages();
		for (UserEntity UserEntity : userEntities) {
			UserModel userModel = new UserModel();
			BeanUtils.copyProperties(UserEntity, userModel);
			userModels.add(userModel);
		}
		return userModels;
	}

	@Override
	public Boolean detele(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserModel getOne(String id) {
		UserEntity userEntity = userRepository.getOne(id);
		UserModel userModel = new UserModel();
		BeanUtils.copyProperties(userEntity, userModel, "roleEntities");
		return userModel;
	}

	@Override
	public Boolean modifyUser(@Valid UserModel userModel) {
		UserEntity userEntity = userRepository.getOne(userModel.getId());
		List<RoleEntity> roleEntities;
		try {
			roleEntities = userEntity.getRoleEntities();
			userEntity.getId();
		} catch (Exception e) {
			return false;
		}
		userEntity = new UserEntity();
		
		userEntity.setRoleEntities(roleEntities);
		
		userModel.setStatus(SystemConstant.ACTIVATE_STATUS);
		userModel.setPassword(new BCryptPasswordEncoder().encode(userModel.getPassword()));
		BeanUtils.copyProperties(userModel, userEntity);
		
		

		userRepository.save(userEntity);
		return true;
	}

	@Override
	public List<UserModel> findAllSortedByModifiedDate(int offset, int numItem) {
		Pageable pageable = new PageRequest(offset, numItem, new Sort(Direction.DESC, "modifiedDate"));
		Page<UserEntity> userEntities = userRepository.findAllByStatus(pageable, SystemConstant.ACTIVATE_STATUS);
		SystemConstant.pageNumber = userEntities.getTotalPages();

		List<UserModel> userModels = new ArrayList<UserModel>();

		userEntities.forEach(userEntity -> {
			UserModel userModel = new UserModel();
			BeanUtils.copyProperties(userEntity, userModel);
			userModels.add(userModel);
		});
		return userModels;
	}

	@Override
	public Boolean saveUser(@Valid UserModel userModel, Long roleId) {
		UserEntity userEntity = userRepository.getOne(userModel.getId());
		try {
			userEntity.getId();
		} catch (Exception e) {
			userEntity = new UserEntity();

			userModel.setStatus(SystemConstant.ACTIVATE_STATUS);
			userModel.setPassword(new BCryptPasswordEncoder().encode(userModel.getPassword()));
			BeanUtils.copyProperties(userModel, userEntity);

			RoleEntity roleEntity = roleRepository.getOne(roleId);
			List<RoleEntity> roleEntities = new ArrayList<RoleEntity>();
			roleEntities.add(roleEntity);

			userEntity.setRoleEntities(roleEntities);

			userRepository.save(userEntity);
			return true;
		}
		return false;
	}

}
