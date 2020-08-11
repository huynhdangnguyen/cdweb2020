package com.cdweb.service.intf;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cdweb.model.HistoryModel;

@Service
public interface HistoryService {
	HistoryModel saveHistory(HistoryModel historyModel);
	byte[] getImage(long id, String imageName);
	HistoryModel getOne(Long id);
	List<HistoryModel> findAllHistorySortedByInDate(int offset, int numItem);
	List<HistoryModel> findAllHistoryByIdRentDetailOrIdCustomer(int offset, int numItem, String searchedString);
}
