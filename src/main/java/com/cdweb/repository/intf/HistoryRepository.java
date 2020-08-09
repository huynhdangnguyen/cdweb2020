package com.cdweb.repository.intf;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.HistoryEntity;

@Repository
public interface HistoryRepository extends JpaRepository<HistoryEntity, Long>{
}
