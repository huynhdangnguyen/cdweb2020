package com.cdweb.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.cdweb.entity.UserEntity;
import com.cdweb.repository.intf.UserRepositoryCustom;

public class UserRepositoryImpl implements UserRepositoryCustom{

	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	public UserEntity findOneByUserNameAndStatus(String name, int status) {
		Query query = entityManager.createNativeQuery("select * from user where id = ? and status = ?",UserEntity.class);
		query.setParameter(1, name);
		query.setParameter(2, status);
		return (UserEntity) query.getResultList().get(0);
	}
	
}
