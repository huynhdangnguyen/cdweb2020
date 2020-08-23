package com.cdweb.repository.intf;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.entity.LastHistoryEntity;
	

public interface HistoryRepository extends JpaRepository<HistoryEntity, Long>{
	
	@Query("SELECT h FROM HistoryEntity h WHERE h.plateNo LIKE %?1% OR h.customerEntity.id LIKE %?1%")
	public Page<HistoryEntity> findAllByPlateNoOrCustomerEntity(String searchedString, Pageable pageable);
	
	@Query("SELECT h FROM HistoryEntity h where h.rentDetailEntity.id = ?1 AND h.inDate = ?2")
	public HistoryEntity getLastOne(Long rentDetailId, Date inDate);
	
	@Query("SELECT new com.cdweb.entity.LastHistoryEntity(h.rentDetailEntity.id as rentDetailId, max(h.inDate) as inDate) from HistoryEntity h where h.rentDetailEntity.id = ?1 group by h.rentDetailEntity.id")
	public LastHistoryEntity getLastHistroEntity(long rentDetaitId);
}
