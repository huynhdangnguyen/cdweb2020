package com.cdweb.repository.intf;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.VehicleEntity;

@Repository
public interface VehicleRepossitory extends JpaRepository<VehicleEntity, Long>{
	
}
