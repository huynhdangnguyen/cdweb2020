package com.cdweb.service.intf;

import com.cdweb.model.HistoryModel;

public interface HistoryService {
	public HistoryModel saveHistory(HistoryModel historyModel);
	public byte[] getImage(long id, String imageName);
	public HistoryModel getOne(Long id);
}
