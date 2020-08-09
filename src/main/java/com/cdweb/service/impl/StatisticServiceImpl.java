package com.cdweb.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdweb.entity.HistoryEntity;
import com.cdweb.repository.intf.StatisticRepository;
import com.cdweb.service.intf.StatisticService;

@Service
public class StatisticServiceImpl implements StatisticService {

	@Autowired
	StatisticRepository statisticRepository;

	@Override
	public Map<Date, Integer> getIncome(String startDate, String endDate) {
		Map<Date, Integer> result = new HashMap<Date, Integer>();
		try {
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date startDay = formater.parse(startDate);
			Date endDay = formater.parse(endDate);

			Calendar start = Calendar.getInstance();
			start.setTime(startDay);

			Calendar end = Calendar.getInstance();
			end.setTime(endDay);

			List<HistoryEntity> listHistoryEntity = statisticRepository.findAllByOutDateBetween(startDay, endDay);

			listHistoryEntity.forEach(
					(his) -> System.out.println(his.getPlateNo() + "\t" + his.getOutDate() + "\t" + his.getPrice()));

			for (Date date = start.getTime(); start.before(end); start.add(Calendar.DATE, 1), date = start.getTime()) {
				System.out.println(date);
				int totalInComeInADay = 0;
				for (HistoryEntity historyEntity : listHistoryEntity) {
					System.out.println(historyEntity.getOutDate());
					if (date.getDate() == historyEntity.getOutDate().getDate()) {
						totalInComeInADay += historyEntity.getPrice();
					}
				}
				result.put(date, totalInComeInADay);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}

		return result;
	}

}
