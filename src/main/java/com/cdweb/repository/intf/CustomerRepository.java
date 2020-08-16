package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.CustomerEntity;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, String>{
	
	Page<CustomerEntity> findAllByStatus(Pageable pageable, Integer status);
	
	@Query("SELECT c FROM CustomerEntity c WHERE c.id LIKE %?1% AND c.status = ?2")
	Page<CustomerEntity> findAllByIdAndStatus( String searchedString, Integer status, Pageable pageable);

	CustomerEntity getOneByIdAndStatus(String id, Integer status);

	
}
