package com.cdweb.repository.intf;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.HistoryEntity;

@Repository
public interface StatisticRepository extends JpaRepository<HistoryEntity, Long> {
	List<HistoryEntity> findAllByOutDateBetween(Date startDate, Date endDate);
}
