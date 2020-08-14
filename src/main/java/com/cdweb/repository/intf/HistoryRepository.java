package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.HistoryEntity;

public interface HistoryRepository extends JpaRepository<HistoryEntity, Long>{
	
	@Query("SELECT h FROM HistoryEntity h WHERE h.plateNo LIKE %?1% OR h.customerEntity.id LIKE %?1% AND STATUS = ?2")
	public List<HistoryEntity> findAll(String searchedString,Integer status, Pageable pageable);
}
