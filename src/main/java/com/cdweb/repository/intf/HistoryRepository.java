package com.cdweb.repository.intf;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cdweb.entity.HistoryEntity;

public interface HistoryRepository extends JpaRepository<HistoryEntity, Long>{
	
	@Query("SELECT h FROM HistoryEntity h WHERE h.plateNo LIKE %?1% OR h.customerEntity.id LIKE %?1%")
	public Page<HistoryEntity> findAllByPlateNoOrCustomerEntity(String searchedString, Pageable pageable);
}
