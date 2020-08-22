package com.cdweb.service.intf;

import com.cdweb.model.RentDetailModel;

public interface ControllingService {
	RentDetailModel saveHistoryIn(String rentDetailId, byte[] plateInImage);
}
