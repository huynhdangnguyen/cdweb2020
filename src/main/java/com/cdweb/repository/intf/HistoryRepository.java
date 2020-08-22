package com.cdweb.repository.intf;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cdweb.entity.HistoryEntity;

public interface HistoryRepository extends JpaRepository<HistoryEntity, Long>{
	
	@Query("SELECT h FROM HistoryEntity h WHERE h.plateNo LIKE %?1% OR h.customerEntity.id LIKE %?1%")
	public Page<HistoryEntity> findAllByPlateNoOrCustomerEntity(String searchedString, Pageable pageable);
	
//	@Query("SELECT h FROM HistoryEntity h INNER JOIN (select h1.rentDetail.id, h1.max(h1.inDate) as MaxInDate from HistoryEntity h1 where h1.rentDetailEntity.id = ?1 group by h1.rentDetailEntity.id, h1.customerEntity.id) groupedh ON h.rentDetailEntity.id = groupedh.rentDetailEntity.id AND h.inDate = groupedh.MaxInDate")
//	public HistoryEntity getLastOneByRentDetailEntity(Long rentDetailId);
	
}
