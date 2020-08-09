package com.cdweb.service.intf;

import java.util.Date;
import java.util.Map;

public interface StatisticService {
	Map<Date, Integer> getIncome(String startDay, String endDay);
}
