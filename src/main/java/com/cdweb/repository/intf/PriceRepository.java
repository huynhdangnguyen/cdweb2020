package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cdweb.entity.PriceEntity;

public interface PriceRepository extends JpaRepository<PriceEntity, Long>{

	Page<PriceEntity> findAllByStatus(Pageable pageable, int status);

	Page<PriceEntity> findAllByIdAndStatus(Long searchedString, int status, Pageable pageable);

	PriceEntity getOneByIdAndStatus(Long id, int status);
	
}
