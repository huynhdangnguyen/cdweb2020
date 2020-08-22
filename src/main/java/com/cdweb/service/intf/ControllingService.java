package com.cdweb.service.intf;

import com.cdweb.model.HistoryModel;
import com.cdweb.model.RentDetailModel;

public interface ControllingService {
	RentDetailModel saveHistoryIn(String rentDetailId, byte[] plateInImage);
	
	HistoryModel getLastHistoryByRentDetailEntity(Long rentDetailId);

	RentDetailModel saveHistoryOut(String idCardOut, byte[] image);
}
