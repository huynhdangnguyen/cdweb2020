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
public interface CustomerRepository extends PagingAndSortingRepository<CustomerEntity, Long>{
	
	List<CustomerEntity> findAllByStatus(Pageable pageable, Integer status);
}
