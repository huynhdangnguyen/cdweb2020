package com.cdweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.VehicleEntity;

@Repository
public interface IVehicleRepossitory extends JpaRepository<VehicleEntity, Long>{
	
}
