package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cdweb.entity.PriceEntity;
import com.cdweb.entity.RentDetailEntity;

public interface PriceRepository extends JpaRepository<PriceEntity, Long>{

	List<PriceEntity> findAllByStatus(Pageable pageable, int status);

	List<PriceEntity> findAllByIdAndStatus(Long searchedString, int status, Pageable pageable);

	PriceEntity getOneByIdAndStatus(Long id, int status);
	
}
