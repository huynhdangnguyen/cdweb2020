package com.cdweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cdweb.constant.SystemConstant;
import com.cdweb.entity.RoleEntity;
import com.cdweb.entity.UserEntity;
import com.cdweb.model.MyUserModel;
import com.cdweb.repository.intf.UserRepository;

@Service
public class CustomUserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByIdAndStatus(id, SystemConstant.ACTIVATE_STATUS);
		if(userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity roleEntity : userEntity.getRoleEntities()) {
			authorities.add(new SimpleGrantedAuthority(roleEntity.getName()));
		}
		
		MyUserModel myUserModel = new MyUserModel(id, userEntity.getPassword(), true, true, true, true, authorities);
		BeanUtils.copyProperties(userEntity, myUserModel);
		return myUserModel;
	}
	
}
