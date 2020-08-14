package com.cdweb.repository.intf;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cdweb.entity.PriceEntity;

public interface PriceRepository extends JpaRepository<PriceEntity, Long>{
	
}
