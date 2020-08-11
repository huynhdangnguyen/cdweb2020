package com.cdweb.repository.intf;

import java.util.List;

import com.cdweb.entity.HistoryEntity;

public interface HistoryRepositoryCustom {
	List<HistoryEntity> searchByRentDetailEntityOrCustomerEntity(int offset, int numItem, String searchedString);
}
