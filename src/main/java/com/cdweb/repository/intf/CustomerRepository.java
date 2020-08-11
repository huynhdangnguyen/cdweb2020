package com.cdweb.repository.intf;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.CustomerEntity;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, String>{
	
	List<CustomerEntity> findAllByStatus(Pageable pageable, Integer status);
	
	@Query("SELECT c FROM CustomerEntity c WHERE c.id LIKE %?1% AND c.status = ?2")
	List<CustomerEntity> findAllByIdAndStatus( String searchedString, Integer status, Pageable pageable);
}
