package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.RentDetailEntity;

@Repository
public interface RentDetailRepository extends JpaRepository<RentDetailEntity, Long> {
	@Query("SELECT rd FROM RentDetailEntity rd WHERE rd.plateNo LIKE %?1% OR rd.customerEntity.id LIKE %?1% AND rd.status = ?2")
	public Page<RentDetailEntity> findAllByStatusAndPlateNoOrCustomerEntity(String searchedString, int status, Pageable pageable);

	RentDetailEntity getOneByIdAndStatus(Long id, int status);
	
	Page<RentDetailEntity> findAllByStatus(Pageable pageable, int status);
}
