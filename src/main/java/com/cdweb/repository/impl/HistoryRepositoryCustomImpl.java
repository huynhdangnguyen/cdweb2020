package com.cdweb.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.model.HistoryModel;
import com.cdweb.repository.intf.HistoryRepositoryCustom;

public class HistoryRepositoryCustomImpl implements HistoryRepositoryCustom {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<HistoryEntity> searchByRentDetailEntityOrCustomerEntity(int offset, int numItem,
			String searchedString) {
		// Query query = entityManager.createNativeQuery("SELECT * FROM history WHERE
		// id_rentdetail LIKE %?% OR id_customer LIKE %?% ORDER BY indate DESC LIMIT ?
		// OFFSET ?", HistoryEntity.class);
		// query.setParameter(1, searchedString);
		// query.setParameter(2, numItem);
		// query.setParameter(3, offset * numItem + 1);
		// return query.getResultList();
		return null;
	}

}
