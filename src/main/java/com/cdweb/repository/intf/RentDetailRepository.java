package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.entity.RentDetailEntity;

@Repository
public interface RentDetailRepository extends JpaRepository<RentDetailEntity, Long> {
	@Query("SELECT rd FROM RentDetailEntity rd WHERE rd.plateNo LIKE %?1% OR rd.customerEntity.id LIKE %?1%")
	public List<RentDetailEntity> findAll(String searchedString, Pageable pageable);

	RentDetailEntity getOneByIdAndStatus(String id, int activateStatus);
}
